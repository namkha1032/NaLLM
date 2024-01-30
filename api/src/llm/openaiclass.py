from typing import (
    Callable,
    List,
)

from openai import OpenAI
import tiktoken
from llm.basellm import BaseLLM
from retry import retry
import google.generativeai as genai

client = OpenAI()

genai.configure(api_key="AIzaSyB6ixOT-4N-WgqhqUUC64o0DC5COZ5o5RQ")
model_gemini = genai.GenerativeModel('gemini-pro')

class OpenAIChat(BaseLLM):
    """Wrapper around OpenAI Chat large language models."""

    def __init__(
        self,
        openai_api_key: str,
        model_name: str = "gpt-3.5-turbo-1106",
        max_tokens: int = 1000,
        temperature: float = 0.0,
    ) -> None:
        client.api_key = openai_api_key
        self.model = model_name
        self.max_tokens = max_tokens
        self.temperature = temperature

    @retry(tries=3, delay=1)
    def generate(
        self,
        messages: List[str],
    ) -> str:
        try:
            completions = client.chat.completions.create(
                model="gpt-3.5-turbo-1106",
                temperature=0,
                # max_tokens=self.max_tokens,
                messages=messages,
            )
            return completions.choices[0].message.content
        # catch context length / do not retry
        except client.error.InvalidRequestError as e:
            return str(f"Error: {e}")
        # catch authorization errors / do not retry
        except client.error.AuthenticationError as e:
            return "Error: The provided OpenAI API key is invalid"
        except Exception as e:
            print(f"Retrying LLM call {e}")
            raise Exception()
    def generate_gemini(self, messages):
        generation_config = genai.types.GenerationConfig(
                                                    max_output_tokens=4000,
                                                    temperature=0.0)
        safety_settings = [
            {
                "category": "HARM_CATEGORY_UNSPECIFIED",
                "threshold": "BLOCK_NONE",
            },
            {
                "category": "HARM_CATEGORY_DEROGATORY",
                "threshold": "BLOCK_NONE",
            },
            {
                "category": "HARM_CATEGORY_TOXICITY",
                "threshold": "BLOCK_NONE",
            },
            {
                "category": "HARM_CATEGORY_VIOLENCE",
                "threshold": "BLOCK_NONE",
            },
            {
                "category": "HARM_CATEGORY_SEXUAL",
                "threshold": "BLOCK_NONE",
            },
            {
                "category": "HARM_CATEGORY_MEDICAL",
                "threshold": "BLOCK_NONE",
            },
            {
                "category": "HARM_CATEGORY_DANGEROUS",
                "threshold": "BLOCK_NONE",
            },
            {
                "category": "HARM_CATEGORY_HARASSMENT",
                "threshold": "BLOCK_NONE",
            },
            {
                "category": "HARM_CATEGORY_HATE_SPEECH",
                "threshold": "BLOCK_NONE",
            },
            {
                "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
                "threshold": "BLOCK_NONE",
            },
            {
                "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
                "threshold": "BLOCK_NONE",
            }
        ]
        
        response = model_gemini.generate_content(messages[0]["content"] + messages[1]["content"])
        return response.text
    async def generateStreaming(
        self,
        messages: List[str],
        onTokenCallback=Callable[[str], None],
    ) -> str:
        result = []
        completions = client.ChatCompletion.create(
            model=self.model,
            temperature=self.temperature,
            max_tokens=self.max_tokens,
            messages=messages,
            stream=True,
        )
        result = []
        for message in completions:
            # Process the streamed messages or perform any other desired action
            delta = message["choices"][0]["delta"]
            if "content" in delta:
                result.append(delta["content"])
            await onTokenCallback(message)
        return result

    def num_tokens_from_string(self, string: str) -> int:
        encoding = tiktoken.encoding_for_model(self.model)
        num_tokens = len(encoding.encode(string))
        return num_tokens

    def max_allowed_token_length(self) -> int:
        # TODO: list all models and their max tokens from api
        return 16385
