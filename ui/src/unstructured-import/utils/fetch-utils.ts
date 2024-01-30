import { ImportResult } from "../types/respons-types";

type JSONResponse = {
  data?: ImportResult;
  nodis?: ImportResult;
  my_result?: ImportResult;
  errors?: Array<{ message: string }>;
};

export const runImport = async (input: string, schema?: string, apiKey?: string) => {
  console.log("sending body", JSON.stringify({ input, neo4j_schema: schema }));
  const body = {
    input, neo4j_schema: schema ? schema : ""
  };
  if (apiKey) {
    // @ts-ignore
    body.api_key = apiKey;
  }
  const response = await fetch(
    `http://localhost:7860/data2cypher`,
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(body),
    }
  );
  // const response = await fetch(
  //   `http://localhost:4173/restest.json`,
  //   {
  //     method: "GET",
  //     headers: {
  //       "Content-Type": "application/json",
  //     },
  //     // body: JSON.stringify(body),
  //   }
  // );
  if (!response.ok) {
    return Promise.reject(
      new Error(`Failed to import: ${response.statusText}`)
    );
  }

  const { data, nodis, my_result, errors }: JSONResponse = await response.json();
  if (errors !== undefined) {
    const error = new Error(
      errors?.map((e) => e.message).join("\n") ?? "unknown"
    );
    return Promise.reject(error);
  }
  console.log("data", data);
  console.log("nodis", nodis);
  console.log("my_result", my_result);
  console.log("data_json", JSON.stringify(data));
  console.log("nodis_json", JSON.stringify(nodis));
  console.log("my_result", JSON.stringify(my_result));
  return { data: data, nodis: nodis, my_result: my_result } ?? "";

  // const rawres: ImportResult = await response.json();
  // return { data: rawres, nodis: rawres, my_result: rawres }

};