import os
from typing import Optional
from components.company_report import CompanyReport

from components.data_disambiguation import DataDisambiguation
from components.question_proposal_generator import (
    QuestionProposalGenerator,
)
from components.summarize_cypher_result import SummarizeCypherResult
from components.text2cypher import Text2Cypher
from components.unstructured_data_extractor import (
    DataExtractor,
    DataExtractorWithSchema,
)
from driver.neo4j import Neo4jDatabase
from fastapi import FastAPI, HTTPException, WebSocket, WebSocketDisconnect
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
from fewshot_examples import get_fewshot_examples
from llm.openaiclass import OpenAIChat
from pydantic import BaseModel
import copy

class Payload(BaseModel):
    question: str
    api_key: Optional[str]
    model_name: Optional[str]


class ImportPayload(BaseModel):
    input: str
    neo4j_schema: Optional[str]
    api_key: Optional[str]


class questionProposalPayload(BaseModel):
    api_key: Optional[str]


# Maximum number of records used in the context
HARD_LIMIT_CONTEXT_RECORDS = 10

neo4j_connection = Neo4jDatabase(
    host=os.environ.get("NEO4J_URL", "neo4j+s://demo.neo4jlabs.com"),
    user=os.environ.get("NEO4J_USER", "companies"),
    password=os.environ.get("NEO4J_PASS", "companies"),
    database=os.environ.get("NEO4J_DATABASE", "companies"),
)


# Initialize LLM modules
openai_api_key = os.environ.get("OPENAI_API_KEY", None)


# Define FastAPI endpoint
app = FastAPI()

origins = [
    "*",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.post("/questionProposalsForCurrentDb")
async def questionProposalsForCurrentDb(payload: questionProposalPayload):
    if not openai_api_key and not payload.api_key:
        raise HTTPException(
            status_code=422,
            detail="Please set OPENAI_API_KEY environment variable or send it as api_key in the request body",
        )
    api_key = openai_api_key if openai_api_key else payload.api_key

    questionProposalGenerator = QuestionProposalGenerator(
        database=neo4j_connection,
        llm=OpenAIChat(
            openai_api_key=api_key,
            model_name="gpt-3.5-turbo-0613",
            max_tokens=512,
            temperature=0.8,
        ),
    )

    return questionProposalGenerator.run()


@app.get("/hasapikey")
async def hasApiKey():
    return JSONResponse(content={"output": openai_api_key is not None})


@app.websocket("/text2text")
async def websocket_endpoint(websocket: WebSocket):
    async def sendDebugMessage(message):
        await websocket.send_json({"type": "debug", "detail": message})

    async def sendErrorMessage(message):
        await websocket.send_json({"type": "error", "detail": message})

    async def onToken(token):
        delta = token["choices"][0]["delta"]
        if "content" not in delta:
            return
        content = delta["content"]
        if token["choices"][0]["finish_reason"] == "stop":
            await websocket.send_json({"type": "end", "output": content})
        else:
            await websocket.send_json({"type": "stream", "output": content})

        # await websocket.send_json({"token": token})

    await websocket.accept()
    await sendDebugMessage("connected")
    chatHistory = []
    try:
        while True:
            data = await websocket.receive_json()
            if not openai_api_key and not data.get("api_key"):
                raise HTTPException(
                    status_code=422,
                    detail="Please set OPENAI_API_KEY environment variable or send it as api_key in the request body",
                )
            api_key = openai_api_key if openai_api_key else data.get("api_key")

            default_llm = OpenAIChat(
                openai_api_key=api_key,
                model_name=data.get("model_name", "gpt-3.5-turbo-0613"),
            )
            summarize_results = SummarizeCypherResult(
                llm=OpenAIChat(
                    openai_api_key=api_key,
                    model_name="gpt-3.5-turbo-0613",
                    max_tokens=128,
                )
            )

            text2cypher = Text2Cypher(
                database=neo4j_connection,
                llm=default_llm,
                cypher_examples=get_fewshot_examples(api_key),
            )

            if "type" not in data:
                await websocket.send_json({"error": "missing type"})
                continue
            if data["type"] == "question":
                try:
                    question = data["question"]
                    chatHistory.append({"role": "user", "content": question})
                    await sendDebugMessage("received question: " + question)
                    results = None
                    try:
                        results = text2cypher.run(question, chatHistory)
                        print("results", results)
                    except Exception as e:
                        await sendErrorMessage(str(e))
                        continue
                    if results == None:
                        await sendErrorMessage("Could not generate Cypher statement")
                        continue

                    await websocket.send_json(
                        {
                            "type": "start",
                        }
                    )
                    output = await summarize_results.run_async(
                        question,
                        results["output"][:HARD_LIMIT_CONTEXT_RECORDS],
                        callback=onToken,
                    )
                    chatHistory.append({"role": "system", "content": output})
                    await websocket.send_json(
                        {
                            "type": "end",
                            "output": output,
                            "generated_cypher": results["generated_cypher"],
                        }
                    )
                except Exception as e:
                    await sendErrorMessage(str(e))
                await sendDebugMessage("output done")
    except WebSocketDisconnect:
        print("disconnected")


@app.post("/data2cypher")
async def root(payload: ImportPayload):
    print("get in path")
    """
    Takes an input and created a Cypher query
    """
    if not openai_api_key and not payload.api_key:
        raise HTTPException(
            status_code=422,
            detail="Please set OPENAI_API_KEY environment variable or send it as api_key in the request body",
        )
    api_key = openai_api_key if openai_api_key else payload.api_key

    try:
        resultRaw = ""
        llm = OpenAIChat(
            openai_api_key=api_key, model_name="gpt-3.5-turbo-1106", max_tokens=4000
        )

        if not payload.neo4j_schema:
            extractor = DataExtractor(llm=llm)
            resultRaw = extractor.run(data=payload.input)
        else:
            extractor = DataExtractorWithSchema(llm=llm)
            resultRaw = extractor.run(schema=payload.neo4j_schema, data=payload.input)

        print("resultRaw: ", resultRaw)
        print("Begin disambiguation...")
        disambiguation = DataDisambiguation(llm=llm)
        disambiguation_result = disambiguation.run(resultRaw["results"])

        print("Disambiguation result: ", str(disambiguation_result))

        return {"data": disambiguation_result, "nodis": resultRaw["results"], "my_result": resultRaw["my_result"]}

    except Exception as e:
        print(e)
        return f"Error: {e}"

@app.get("/test")
async def getStuff():
    oriObj = {
        "nodes": [
            {
                "name": "Michael Townley",
                "label": "Person",
                "properties": {
                    "status": "deceased"
                }
            },
            {
                "name": "Brad",
                "label": "Person",
                "properties": {
                    "status": "imprisoned"
                }
            },
            {
                "name": "Trevor",
                "label": "Person",
                "properties": {
                    "status": "alive"
                }
            },
            {
                "name": "Lester",
                "label": "Person",
                "properties": {
                    "occupation": "remote contact"
                }
            },
            {
                "name": "FIB",
                "label": "Organization",
                "properties": {}
            },
            {
                "name": "Michael De Santa",
                "label": "Person",
                "properties": {
                    "status": "alive",
                    "new name": "Michael De Santa"
                }
            },
            {
                "name": "Dave Norton",
                "label": "Person",
                "properties": {
                    "occupation": "FIB agent"
                }
            },
            {
                "name": "Franklin",
                "label": "Person",
                "properties": {
                    "status": "alive"
                }
            },
            {
                "name": "Lamar",
                "label": "Person",
                "properties": {
                    "status": "alive"
                }
            },
            {
                "name": "Simeon",
                "label": "Person",
                "properties": {
                    "occupation": "shady car dealer"
                }
            },
            {
                "name": "Jimmy",
                "label": "Person",
                "properties": {
                    "status": "alive"
                }
            },
            {
                "name": "Martin Madrazo",
                "label": "Person",
                "properties": {
                    "occupation": "drug kingpin"
                }
            },
            {
                "name": "Lifeinvader",
                "label": "Organization",
                "properties": {
                    "industry": "social media platform"
                }
            },
            {
                "name": "Trevor",
                "label": "Person",
                "properties": {
                    "occupation": "criminal",
                    "location": "Los Santos"
                }
            },
            {
                "name": "Johnny Klebitz",
                "label": "Person",
                "properties": {
                    "affiliation": "motorcycle gang"
                }
            },
            {
                "name": "Wei Cheng Triad",
                "label": "Organization",
                "properties": {
                    "affiliation": "Chinese gang"
                }
            },
            {
                "name": "Wade",
                "label": "Person",
                "properties": {
                    "relation": "friend"
                }
            },
            {
                "name": "Los Santos",
                "label": "Location",
                "properties": {}
            },
            {
                "name": "Michael",
                "label": "Person",
                "properties": {
                    "occupation": "criminal",
                    "location": "Los Santos"
                }
            },
            {
                "name": "Tracey",
                "label": "Person",
                "properties": {
                    "occupation": "aspiring TV personality"
                }
            },
            {
                "name": "Lazlow Jones",
                "label": "Person",
                "properties": {
                    "occupation": "TV host"
                }
            },
            {
                "name": "Floyd",
                "label": "Person",
                "properties": {
                    "relation": "cousin"
                }
            },
            {
                "name": "FIB",
                "label": "Organization",
                "properties": {
                    "affiliation": "law enforcement"
                }
            },
            {
                "name": "Dave Norton",
                "label": "Person",
                "properties": {
                    "occupation": "FIB agent"
                }
            },
            {
                "name": "Madrazo",
                "label": "Person",
                "properties": {
                    "occupation": "criminal"
                }
            },
            {
                "name": "IAA",
                "label": "Organization",
                "properties": {
                    "affiliation": "intelligence agency"
                }
            },
            {
                "name": "Ferdinand Kerimov",
                "label": "Person",
                "properties": {
                    "occupation": "suspected terrorist"
                }
            },
            {
                "name": "Steve Haines",
                "label": "Person",
                "properties": {
                    "occupation": "corrupt FIB agent"
                }
            },
            {
                "name": "Franklin",
                "label": "Person",
                "properties": {
                    "occupation": "criminal",
                    "location": "Los Santos"
                }
            },
            {
                "name": "Lester",
                "label": "Person",
                "properties": {
                    "occupation": "criminal"
                }
            },
            {
                "name": "Merryweather Security",
                "label": "Organization",
                "properties": {
                    "affiliation": "private military contractor"
                }
            },
            {
                "name": "Devin Weston",
                "label": "Person",
                "properties": {
                    "occupation": "billionaire"
                }
            },
            {
                "name": "Solomon Richards",
                "label": "Person",
                "properties": {
                    "occupation": "Vinewood producer"
                }
            },
            {
                "name": "Patricia",
                "label": "Person",
                "properties": {
                    "occupation": "kidnapped"
                }
            },
            {
                "name": "trevor",
                "label": "Person",
                "properties": {
                    "status": "alive",
                    "occupation": "criminal"
                }
            },
            {
                "name": "michael",
                "label": "Person",
                "properties": {
                    "status": "alive",
                    "occupation": "retired criminal"
                }
            },
            {
                "name": "patricia",
                "label": "Person",
                "properties": {
                    "status": "alive",
                    "relationship": "wife"
                }
            },
            {
                "name": "floyd",
                "label": "Person",
                "properties": {
                    "status": "deceased",
                    "occupation": "associate"
                }
            },
            {
                "name": "brad",
                "label": "Person",
                "properties": {
                    "status": "deceased",
                    "occupation": "criminal"
                }
            },
            {
                "name": "franklin",
                "label": "Person",
                "properties": {
                    "status": "alive",
                    "occupation": "criminal"
                }
            },
            {
                "name": "dave norton",
                "label": "Person",
                "properties": {
                    "status": "alive",
                    "occupation": "FIB agent"
                }
            },
            {
                "name": "steve haines",
                "label": "Person",
                "properties": {
                    "status": "deceased",
                    "occupation": "FIB agent"
                }
            },
            {
                "name": "devin weston",
                "label": "Person",
                "properties": {
                    "status": "deceased",
                    "occupation": "businessman"
                }
            },
            {
                "name": "solomon",
                "label": "Person",
                "properties": {
                    "status": "alive",
                    "occupation": "film producer"
                }
            },
            {
                "name": "lamar",
                "label": "Person",
                "properties": {
                    "status": "alive",
                    "occupation": "gang member"
                }
            },
            {
                "name": "merryweather",
                "label": "Organization",
                "properties": {
                    "status": "active",
                    "type": "mercenary group"
                }
            },
            {
                "name": "ballas",
                "label": "Organization",
                "properties": {
                    "status": "active",
                    "type": "rival gang"
                }
            },
            {
                "name": "union depository",
                "label": "Location",
                "properties": {
                    "status": "active",
                    "type": "bank"
                }
            },
            {
                "name": "vanilla unicorn",
                "label": "Location",
                "properties": {
                    "status": "active",
                    "type": "strip club"
                }
            },
            {
                "name": "FIB headquarters",
                "label": "Location",
                "properties": {
                    "status": "active",
                    "type": "government building"
                }
            },
            {
                "name": "Los Santos",
                "label": "Location",
                "properties": {
                    "status": "active",
                    "type": "city"
                }
            },
            {
                "name": "trailer",
                "label": "Item",
                "properties": {
                    "status": "active",
                    "type": "vehicle"
                }
            },
            {
                "name": "briefcase",
                "label": "Item",
                "properties": {
                    "status": "active",
                    "type": "container"
                }
            },
            {
                "name": "ancient artifact",
                "label": "Item",
                "properties": {
                    "status": "active",
                    "type": "artifact"
                }
            },
            {
                "name": "film",
                "label": "Item",
                "properties": {
                    "status": "active",
                    "type": "production"
                }
            },
            {
                "name": "files",
                "label": "Item",
                "properties": {
                    "status": "active",
                    "type": "documents"
                }
            },
            {
                "name": "Franklin",
                "label": "Person",
                "properties": {
                    "status": "alive"
                }
            },
            {
                "name": "Weston",
                "label": "Person",
                "properties": {
                    "status": "deceased"
                }
            },
            {
                "name": "Michael",
                "label": "Person",
                "properties": {
                    "status": "deceased"
                }
            },
            {
                "name": "Trevor",
                "label": "Person",
                "properties": {
                    "status": "alive"
                }
            },
            {
                "name": "Lester",
                "label": "Person",
                "properties": {
                    "status": "alive"
                }
            },
            {
                "name": "Ballas",
                "label": "Group",
                "properties": {}
            },
            {
                "name": "Steve Haines",
                "label": "Person",
                "properties": {
                    "status": "deceased"
                }
            },
            {
                "name": "Triads",
                "label": "Group",
                "properties": {}
            },
            {
                "name": "Merryweather",
                "label": "Group",
                "properties": {}
            },
            {
                "name": "Devin Weston",
                "label": "Person",
                "properties": {
                    "status": "deceased"
                }
            },
            {
                "name": "Dave Norton",
                "label": "Person",
                "properties": {
                    "status": "alive"
                }
            },
            {
                "name": "Jimmy",
                "label": "Person",
                "properties": {
                    "status": "alive"
                }
            },
            {
                "name": "Michael's widow",
                "label": "Person",
                "properties": {
                    "status": "alive"
                }
            },
            {
                "name": "Jimmy's family",
                "label": "Person",
                "properties": {
                    "status": "alive"
                }
            }
        ],
        "relationships": [
            {
                "start": "Michael Townley",
                "end": "bank robbery crew",
                "type": "part of",
                "properties": {}
            },
            {
                "start": "Brad",
                "end": "bank robbery crew",
                "type": "part of",
                "properties": {}
            },
            {
                "start": "Trevor",
                "end": "bank robbery crew",
                "type": "part of",
                "properties": {}
            },
            {
                "start": "Lester",
                "end": "bank robbery crew",
                "type": "part of",
                "properties": {}
            },
            {
                "start": "bank robbery crew",
                "end": "security company",
                "type": "attempted robbery",
                "properties": {
                    "year": 2004
                }
            },
            {
                "start": "Trevor",
                "end": "security guard",
                "type": "murders",
                "properties": {}
            },
            {
                "start": "Trevor",
                "end": "police",
                "type": "chased by",
                "properties": {}
            },
            {
                "start": "getaway driver",
                "end": "police",
                "type": "killed by",
                "properties": {}
            },
            {
                "start": "Michael Townley",
                "end": "FIB",
                "type": "makes deal with",
                "properties": {
                    "deal": "witness protection"
                }
            },
            {
                "start": "FIB",
                "end": "Michael De Santa",
                "type": "protects",
                "properties": {}
            },
            {
                "start": "Michael De Santa",
                "end": "{}",
                "type": "in therapy",
                "properties": {}
            },
            {
                "start": "Michael De Santa",
                "end": "wife",
                "type": "married to",
                "properties": {}
            },
            {
                "start": "Michael De Santa",
                "end": "family",
                "type": "has",
                "properties": {}
            },
            {
                "start": "Dave Norton",
                "end": "Michael De Santa",
                "type": "in charge of protection for",
                "properties": {}
            },
            {
                "start": "Lamar",
                "end": "Michael De Santa's son",
                "type": "steals car of",
                "properties": {}
            },
            {
                "start": "Lamar",
                "end": "Simeon",
                "type": "works for",
                "properties": {}
            },
            {
                "start": "Franklin",
                "end": "Lamar",
                "type": "acquaintance of",
                "properties": {}
            },
            {
                "start": "Michael De Santa",
                "end": "Franklin",
                "type": "meets",
                "properties": {}
            },
            {
                "start": "Franklin",
                "end": "Michael De Santa",
                "type": "visits",
                "properties": {}
            },
            {
                "start": "Franklin",
                "end": "Michael De Santa's son",
                "type": "rescues",
                "properties": {}
            },
            {
                "start": "Franklin",
                "end": "Michael De Santa",
                "type": "forms partnership with",
                "properties": {}
            },
            {
                "start": "Michael De Santa",
                "end": "tennis instructor",
                "type": "catches wife with",
                "properties": {}
            },
            {
                "start": "Michael De Santa",
                "end": "{}",
                "type": "rampages",
                "properties": {}
            },
            {
                "start": "Michael De Santa",
                "end": "house in Vinewood Hills",
                "type": "destroys",
                "properties": {}
            },
            {
                "start": "Martin Madrazo",
                "end": "Michael De Santa and Franklin",
                "type": "puts hit on",
                "properties": {}
            },
            {
                "start": "Michael De Santa",
                "end": "Lester",
                "type": "contacts",
                "properties": {}
            },
            {
                "start": "Lester",
                "end": "Michael De Santa",
                "type": "carries out mission with",
                "properties": {
                    "mission": "assassinate the CEO of Lifeinvader"
                }
            },
            {
                "start": "Michael De Santa",
                "end": "new crew",
                "type": "carries out jewelry heist with",
                "properties": {}
            },
            {
                "start": "Trevor",
                "end": "Michael De Santa is alive",
                "type": "realizes",
                "properties": {}
            },
            {
                "start": "Trevor",
                "end": "FIB agent Dave Norton",
                "type": "corresponds with",
                "properties": {}
            },
            {
                "start": "Trevor",
                "end": "Johnny Klebitz",
                "type": "facilitates",
                "properties": {
                    "action": "killing"
                }
            },
            {
                "start": "Trevor",
                "end": "Wei Cheng Triad",
                "type": "facilitates",
                "properties": {
                    "action": "confrontation"
                }
            },
            {
                "start": "Trevor",
                "end": "Los Santos",
                "type": "visits",
                "properties": {
                    "purpose": "expanding business"
                }
            },
            {
                "start": "Trevor",
                "end": "Floyd",
                "type": "moves in with",
                "properties": {
                    "relation": "cousin's apartment"
                }
            },
            {
                "start": "Michael",
                "end": "wife",
                "type": "has dispute with",
                "properties": {
                    "location": "house"
                }
            },
            {
                "start": "Michael",
                "end": "television studio",
                "type": "races to",
                "properties": {
                    "purpose": "stopping audition"
                }
            },
            {
                "start": "Michael",
                "end": "Trevor",
                "type": "reminisces with",
                "properties": {
                    "about": "old days"
                }
            },
            {
                "start": "Michael",
                "end": "FIB",
                "type": "does jobs for",
                "properties": {
                    "compromise": "payback Madrazo"
                }
            },
            {
                "start": "Michael",
                "end": "Ferdinand Kerimov",
                "type": "kidnaps",
                "properties": {
                    "purpose": "extracting information"
                }
            },
            {
                "start": "Trevor",
                "end": "Ferdinand Kerimov",
                "type": "tortures",
                "properties": {
                    "purpose": "information extraction"
                }
            },
            {
                "start": "Trevor",
                "end": "Ferdinand Kerimov",
                "type": "lets go",
                "properties": {
                    "action": "releasing"
                }
            },
            {
                "start": "Michael",
                "end": "family",
                "type": "moves out with",
                "properties": {
                    "purpose": "peace and quiet"
                }
            },
            {
                "start": "Franklin",
                "end": "new house",
                "type": "moves into",
                "properties": {
                    "location": "the hills"
                }
            },
            {
                "start": "Trevor",
                "end": "Merryweather Security",
                "type": "scopes out",
                "properties": {
                    "purpose": "stealing shipment"
                }
            },
            {
                "start": "Trevor",
                "end": "Merryweather shipment",
                "type": "steals",
                "properties": {
                    "assistance": "Michael and Franklin"
                }
            },
            {
                "start": "Trevor",
                "end": "Merryweather",
                "type": "crosses paths with",
                "properties": {
                    "consequence": "theft of armored car"
                }
            },
            {
                "start": "Devin Weston",
                "end": "large payout",
                "type": "facilitates",
                "properties": {
                    "for": "Michael and his crew"
                }
            },
            {
                "start": "Devin Weston",
                "end": "Solomon Richards",
                "type": "puts in touch with",
                "properties": {
                    "purpose": "making a movie"
                }
            },
            {
                "start": "Devin Weston",
                "end": "Franklin and Trevor",
                "type": "tasks",
                "properties": {
                    "purpose": "stealing sports cars"
                }
            },
            {
                "start": "Trevor",
                "end": "Patricia",
                "type": "kidnaps",
                "properties": {
                    "action": "kidnapping"
                }
            },
            {
                "start": "Trevor",
                "end": "Michael",
                "type": "goes into hiding with",
                "properties": {
                    "reason": "escaping from Madrazo"
                }
            },
            {
                "start": "trevor",
                "end": "merryweather",
                "type": "steals from",
                "properties": {
                    "event": "cargo plane hijacking"
                }
            },
            {
                "start": "trevor",
                "end": "plane",
                "type": "bails out of",
                "properties": {
                    "event": "plane shot down"
                }
            },
            {
                "start": "trevor",
                "end": "train robbery",
                "type": "proposes",
                "properties": {
                    "event": "planning the heist"
                }
            },
            {
                "start": "michael",
                "end": "peace offering",
                "type": "suggests",
                "properties": {
                    "event": "using ancient artifact"
                }
            },
            {
                "start": "trevor",
                "end": "union depository heist",
                "type": "agrees to",
                "properties": {
                    "event": "planning the heist"
                }
            },
            {
                "start": "trevor",
                "end": "floyd",
                "type": "kills",
                "properties": {
                    "event": "change of headquarters"
                }
            },
            {
                "start": "trevor",
                "end": "vanilla unicorn",
                "type": "sets up shop in",
                "properties": {
                    "event": "change of headquarters"
                }
            },
            {
                "start": "michael",
                "end": "truth about brad",
                "type": "tells",
                "properties": {
                    "event": "revealing the secret"
                }
            },
            {
                "start": "michael",
                "end": "film",
                "type": "steals",
                "properties": {
                    "event": "retaliation against Devin Weston"
                }
            },
            {
                "start": "michael",
                "end": "FIB headquarters raid",
                "type": "pulls off",
                "properties": {
                    "event": "successful heist"
                }
            },
            {
                "start": "michael",
                "end": "weston",
                "type": "plans revenge on",
                "properties": {
                    "event": "planning the revenge"
                }
            },
            {
                "start": "franklin",
                "end": "lamar",
                "type": "rescues",
                "properties": {
                    "event": "saving from kidnapping"
                }
            },
            {
                "start": "franklin",
                "end": "dave norton and steve haines",
                "type": "confronted by",
                "properties": {
                    "event": "confrontation"
                }
            },
            {
                "start": "michael",
                "end": "attackers",
                "type": "fends off",
                "properties": {
                    "event": "protecting family"
                }
            },
            {
                "start": "franklin",
                "end": "devin weston",
                "type": "confronted by",
                "properties": {
                    "event": "confrontation"
                }
            },
            {
                "start": "franklin",
                "end": "trevor",
                "type": "chooses to kill",
                "properties": {
                    "event": "decision"
                }
            },
            {
                "start": "trevor",
                "end": "gas tanker",
                "type": "crashes into",
                "properties": {
                    "event": "chase"
                }
            },
            {
                "start": "trevor",
                "end": "fire",
                "type": "burns alive",
                "properties": {
                    "event": "result of the chase"
                }
            },
            {
                "start": "michael",
                "end": "franklin",
                "type": "parts ways with",
                "properties": {
                    "event": "decision"
                }
            },
            {
                "start": "Franklin",
                "end": "Weston",
                "type": "follows orders",
                "properties": {}
            },
            {
                "start": "Franklin",
                "end": "Michael",
                "type": "kills",
                "properties": {}
            },
            {
                "start": "Franklin",
                "end": "Trevor",
                "type": "reaches out to",
                "properties": {}
            },
            {
                "start": "Trevor",
                "end": "Michael",
                "type": "expresses disinterest in meeting with",
                "properties": {
                    "reason": "considering him a traitor"
                }
            },
            {
                "start": "Franklin",
                "end": "Michael",
                "type": "chases",
                "properties": {}
            },
            {
                "start": "Michael",
                "end": "bridge",
                "type": "falls to his death at",
                "properties": {}
            },
            {
                "start": "Michael's family",
                "end": "{}",
                "type": "expresses knowledge of Franklin's involvement in Michael's death",
                "properties": {}
            },
            {
                "start": "Michael's widow",
                "end": "Franklin",
                "type": "messages",
                "properties": {
                    "message": "stay away from her family"
                }
            },
            {
                "start": "Jimmy",
                "end": "Franklin",
                "type": "curses out",
                "properties": {
                    "reason": "betrayal"
                }
            },
            {
                "start": "Franklin",
                "end": "Lester",
                "type": "goes to",
                "properties": {}
            },
            {
                "start": "Lester",
                "end": "Franklin",
                "type": "helps",
                "properties": {}
            },
            {
                "start": "Trevor",
                "end": "Michael",
                "type": "concocts a plan with",
                "properties": {}
            },
            {
                "start": "Michael",
                "end": "Ballas",
                "type": "takes out the leader of",
                "properties": {}
            },
            {
                "start": "Trevor",
                "end": "Steve Haines",
                "type": "kills",
                "properties": {}
            },
            {
                "start": "Franklin",
                "end": "Triads",
                "type": "blows up the head of",
                "properties": {}
            },
            {
                "start": "Trevor",
                "end": "Merryweather's mercenaries",
                "type": "fights through",
                "properties": {}
            },
            {
                "start": "Trevor",
                "end": "Devin Weston",
                "type": "kidnaps",
                "properties": {}
            },
            {
                "start": "Trio",
                "end": "destroying the car and killing Weston",
                "type": "stuff Weston in the back of his prized sports car and shove it off a cliff",
                "properties": {}
            },
            {
                "start": "Dave Norton",
                "end": "{grateful: True}",
                "type": "wipes clean their records",
                "properties": {
                    "grateful": True
                }
            },
            {
                "start": "Trio",
                "end": "{}",
                "type": "agree to lay low for a while and remain friends",
                "properties": {}
            }
        ]
    }

    test = {
        "nodes": [1,2,3,6,4,1,5,2,6,7,2,8,1,9,10,6,4]
    }
    mystr = "anBcd"
    newstr = mystr.lower()
    for index, node in enumerate(oriObj["nodes"]):
        copyObj = copy.deepcopy(oriObj)
        delCount = 0
        for i in range(index+1, len(copyObj["nodes"])):
            if node["name"].lower() == copyObj["nodes"][i]["name"].lower():
                oriObj["nodes"][index]["properties"].update(copyObj["nodes"][i]["properties"])
                upperOri = 0
                upperCopy = 0
                for c in node["name"]:
                    if(c.isupper()):
                        upperOri += 1
                for c in copyObj["nodes"][i]["name"]:
                    if(c.isupper()):
                        upperCopy += 1
                if(upperCopy > upperOri):
                    oriObj["nodes"][index]["name"] = copyObj["nodes"][i]["name"]
                oriObj["nodes"].pop(i - delCount)
                delCount = delCount+1
        for idx, rela in enumerate(oriObj["relationships"]):
            if rela["start"].lower() == oriObj["nodes"][index]["name"].lower:
                oriObj["relationships"][idx]["start"] = oriObj["nodes"][index]["name"]
            if rela["end"].lower() == oriObj["nodes"][index]["name"].lower:
                oriObj["relationships"][idx]["end"] = oriObj["nodes"][index]["name"]

    return {"data": oriObj, "nodis": oriObj, "my_result": oriObj}
class companyReportPayload(BaseModel):
    company: str
    api_key: Optional[str]


# This endpoint is database specific and only works with the Demo database.
@app.post("/companyReport")
async def companyInformation(payload: companyReportPayload):
    api_key = openai_api_key if openai_api_key else payload.api_key
    if not openai_api_key and not payload.api_key:
        raise HTTPException(
            status_code=422,
            detail="Please set OPENAI_API_KEY environment variable or send it as api_key in the request body",
        )
    api_key = openai_api_key if openai_api_key else payload.api_key

    llm = OpenAIChat(
        openai_api_key=api_key,
        model_name="gpt-3.5-turbo-16k-0613",
        max_tokens=512,
    )
    print("Running company report for " + payload.company)
    company_report = CompanyReport(neo4j_connection, payload.company, llm)
    result = company_report.run()

    return JSONResponse(content={"output": result})


@app.post("/companyReport/list")
async def companyReportList():
    company_data = neo4j_connection.query(
        "MATCH (n:Organization) WITH n WHERE rand() < 0.01 return n.name LIMIT 5",
    )

    return JSONResponse(content={"output": [x["n.name"] for x in company_data]})


@app.get("/health")
async def health():
    return {"status": "ok"}


@app.get("/ready")
async def readiness_check():
    return {"status": "ok"}


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, port=int(os.environ.get("PORT", 7860)), host="0.0.0.0")
