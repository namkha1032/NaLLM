import re
import os
from typing import List

from components.base_component import BaseComponent
from llm.basellm import BaseLLM
from utils.unstructured_data_utils import (
    nodesTextToListOfDict,
    relationshipTextToListOfDict,
)


def generate_system_message_with_schema() -> str:
    return """
You are a data scientist working for a company that is building a graph database. Your task is to extract information from data and convert it into a graph database.
Provide a set of Nodes in the form [ENTITY, TYPE, PROPERTIES] and a set of relationships in the form [ENTITY1, RELATIONSHIP, ENTITY2, PROPERTIES]. 
Pay attention to the type of the properties, if you can't find data for a property set it to null. Don't make anything up and don't add any extra data. If you can't find any data for a node or relationship don't add it.
Only add nodes and relationships that are part of the schema. If you don't get any relationships in the schema only add nodes.

Example:
Schema: Nodes: [Person {age: integer, name: string}] Relationships: [Person, roommate, Person]
Alice is 25 years old and Bob is her roommate.
Nodes: [["Alice", "Person", {"age": 25, "name": "Alice}], ["Bob", "Person", {"name": "Bob"}]]
Relationships: [["Alice", "roommate", "Bob"]]
"""


def generate_system_message() -> str:
    return """
You are a data scientist working for a company that is building a graph database. Your task is to extract information from data and convert it into a graph database.
Provide a set of Nodes in the form [ENTITY_ID, TYPE, PROPERTIES] and a set of relationships in the form [ENTITY_ID_1, RELATIONSHIP, ENTITY_ID_2, PROPERTIES].
When you find a node you want to add, try to create a generic TYPE for it that describes the entity. You can also think of TYPE as a label.
It is important that the ENTITY_ID_1 and ENTITY_ID_2 exists as nodes with a matching ENTITY_ID. Try to create relationships for every node in the graph.

Example:
Data: Alice lawyer and is 25 years old and Bob is her roommate since 2001. Bob works as a journalist. Alice owns a the webpage www.alice.com and Bob owns the webpage www.bob.com.
Nodes: ["alice", "Person", {"age": 25, "occupation": "lawyer", "name":"Alice"}], ["bob", "Person", {"occupation": "journalist", "name": "Bob"}], ["alice.com", "Webpage", {"url": "www.alice.com"}], ["bob.com", "Webpage", {"url": "www.bob.com"}]
Relationships: ["alice", "roommate", "bob", {"start": 2021}], ["alice", "owns", "alice.com", {}], ["bob", "owns", "bob.com", {}]
"""


def generate_system_message_with_labels() -> str:
    return """
You are a data scientist working for a company that is building a graph database. Your task is to extract information from data and convert it into a graph database.
Provide a set of nodes in the form [ENTITY_ID, TYPE, PROPERTIES] and a set of relationships in the form [ENTITY_ID_1, RELATIONSHIP, ENTITY_ID_2, PROPERTIES].
It is important that the ENTITY_ID_1 and ENTITY_ID_2 exists as nodes with a matching ENTITY_ID. If you can't pair a relationship with a pair of nodes don't add it.
When you find a node or relationship you want to add try to create a generic TYPE for it that describes the entity you can also think of it as a label.
You will be given a list of types that you should try to use when creating the TYPE for a node. If the list of types is empty or you can't find a type that fits the node, you can create a new one.
The data will be in Vietnamese, so make sure the nodes and relationships extracted from the data will also be in Vietnamese.

Example:
Data: Alice lawyer and is 25 years old and Bob is her roommate since 2001. Bob works as a journalist. Alice owns a the webpage www.alice.com and Bob owns the webpage www.bob.com.
Types: ["Person", "Webpage"]
Nodes: ["alice", "Person", {"age": 25, "occupation": "lawyer", "name":"Alice"}], ["bob", "Person", {"occupation": "journalist", "name": "Bob"}], ["alice.com", "Webpage", {"url": "www.alice.com"}], ["bob.com", "Webpage", {"url": "www.bob.com"}]
Relationships: ["alice", "roommate", "bob", {"start": 2021}], ["alice", "owns", "alice.com", {}], ["bob", "owns", "bob.com", {}]
"""


def generate_prompt(data) -> str:
    return f"""
Data: {data}"""


def generate_prompt_gemini(data) -> str:
    return f"""
Here is the data that you have to extract information from:
Data: {data}"""


def generate_prompt_with_schema(data, schema) -> str:
    return f"""
Schema: {schema}
Data: {data}"""


def generate_prompt_with_labels(data, labels) -> str:
    return f"""
Data: {data}
Types: {labels}"""


def splitString(string, max_length) -> List[str]:
    return [string[i : i + max_length] for i in range(0, len(string), max_length)]


def splitStringToFitTokenSpace(
    llm: BaseLLM, string: str, token_use_per_string: int
) -> List[str]:
    allowed_tokens = 400
    chunked_data = string.splitlines()
    combined_chunks = []
    current_chunk = ""
    for chunk in chunked_data:
        if (
            llm.num_tokens_from_string(current_chunk)
            + llm.num_tokens_from_string(chunk)
            < allowed_tokens
        ):
            current_chunk += chunk
        else:
            combined_chunks.append(current_chunk)
            current_chunk = chunk
    combined_chunks.append(current_chunk)

    return combined_chunks
    # return chunked_data


def getNodesAndRelationshipsFromResult(result):
    regex = "Nodes:\s+(.*?)\s?\s?Relationships:\s?\s?(.*)"
    internalRegex = "\[(.*?)\]"
    nodes = []
    relationships = []
    for row in result:
        row = row.replace("**", "")
        parsing = re.match(regex, row, flags=re.S)
        if parsing == None:
            print("WARNING: parsing is none")
            continue
        rawNodes = str(parsing.group(1))
        rawRelationships = parsing.group(2)
        nodes.extend(re.findall(internalRegex, rawNodes))
        relationships.extend(re.findall(internalRegex, rawRelationships))

    result = dict()
    result["nodes"] = []
    result["relationships"] = []
    result["nodes"].extend(nodesTextToListOfDict(nodes))
    result["relationships"].extend(relationshipTextToListOfDict(relationships))
    print("result in getNodes: ", result)
    return result


class DataExtractor(BaseComponent):
    llm: BaseLLM

    def __init__(self, llm: BaseLLM) -> None:
        self.llm = llm

    def process(self, chunk):
        print("get in process")
        messages = [
            {"role": "system", "content": generate_system_message()},
            {"role": "user", "content": generate_prompt_gemini(chunk)},
        ]
        print("Message is: ", messages)
        output = self.llm.generate_gemini(messages)
        return output

    def process_with_labels(self, chunk, labels):
        messages = [
            {"role": "system", "content": generate_system_message_with_labels()},
            {"role": "user", "content": generate_prompt_with_labels(chunk, labels)},
        ]
        print("Message is: ", messages)
        output = self.llm.generate(messages)
        return output

    def run(self, data: str) -> List[str]:
        system_message = generate_system_message()
        # prompt_string = generate_prompt("")
        prompt_string = generate_prompt_with_labels(data, "")
        token_usage_per_prompt = self.llm.num_tokens_from_string(
            system_message + prompt_string
        )
        neo_result = []
        labels = set()
        
        my_result = dict()
        my_result["nodes"] = []
        my_result["relationships"] = []
        print("Starting chunked processing")
        chunked_data = splitStringToFitTokenSpace(
            llm=self.llm, string=data, token_use_per_string=token_usage_per_prompt
        )
        for index, chunk in enumerate(chunked_data):
            print(f"About to LLM chunk: {index+1}/{len(chunked_data)}")
            proceededChunk = self.process(chunk)
            print("proceededChunk: ", proceededChunk)
            chunkResult = getNodesAndRelationshipsFromResult([proceededChunk])
            print("chunkResult: ", chunkResult)
            newLabels = [node["label"] for node in chunkResult["nodes"]]
            print("newLabels: ", newLabels)
            neo_result.append(proceededChunk)
            labels.update(newLabels)
            my_result["nodes"].extend(chunkResult["nodes"])
            my_result["relationships"].extend(chunkResult["relationships"])
            print("neo_result after update: ", neo_result)
            print("labels after update: ", labels)
            
        # chunk = data
        # # proceededChunk = self.process_with_labels(chunk, list(labels))
        # proceededChunk = self.process(chunk)
        # print("proceededChunk", proceededChunk)
        # chunkResult = getNodesAndRelationshipsFromResult([proceededChunk])
        # print("chunkResult", chunkResult)
        # newLabels = [node["label"] for node in chunkResult["nodes"]]
        # print("newLabels", newLabels)
        # results.append(proceededChunk)
        # labels.update(newLabels)
        
        final_result = dict()
        final_result["neo_result"] = getNodesAndRelationshipsFromResult(neo_result)
        final_result["my_result"] = my_result
        print("neo result len node: ", len(final_result["neo_result"]["nodes"]))
        print("neo result len rela: ", len(final_result["neo_result"]["relationships"]))
        print("my result len node: ", len(final_result["my_result"]["nodes"]))
        print("my result len rela: ", len(final_result["my_result"]["relationships"]))
        return final_result


class DataExtractorWithSchema(BaseComponent):
    llm: BaseLLM

    def __init__(self, llm) -> None:
        self.llm = llm

    def run(self, data: str, schema: str) -> List[str]:
        system_message = generate_system_message_with_schema()
        prompt_string = (
            generate_system_message_with_schema()
            + generate_prompt_with_schema(schema=schema, data="")
        )
        token_usage_per_prompt = self.llm.num_tokens_from_string(
            system_message + prompt_string
        )

        chunked_data = splitStringToFitTokenSpace(
            llm=self.llm, string=data, token_use_per_string=token_usage_per_prompt
        )
        result = []
        print("Starting chunked processing")

        for chunk in chunked_data:
            print("prompt", generate_prompt_with_schema(chunk, schema))
            messages = [
                {
                    "role": "system",
                    "content": system_message,
                },
                {"role": "user", "content": generate_prompt_with_schema(chunk, schema)},
            ]
            output = self.llm.generate(messages)
            result.append(output)
        return getNodesAndRelationshipsFromResult(result)
