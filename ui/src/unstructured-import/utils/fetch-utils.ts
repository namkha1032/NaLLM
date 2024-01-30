import { ImportResult } from "../types/respons-types";

type JSONResponse = {
  dis?: ImportResult;
  nodis?: ImportResult;
  mydis?: ImportResult;
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
  // const response = await fetch(`http://localhost:7860/test`)
  if (!response.ok) {
    return Promise.reject(
      new Error(`Failed to import: ${response.statusText}`)
    );
  }

  const responseJSON: any = await response.json();
  // if (errors !== undefined) {
  //   const error = new Error(
  //     errors?.map((e) => e.message).join("\n") ?? "unknown"
  //   );
  //   return Promise.reject(error);
  // }
  console.log("responseJSON", responseJSON);
  console.log("dis_json", JSON.stringify(responseJSON.dis));
  console.log("nodis_json", JSON.stringify(responseJSON.nodis));
  console.log("mydis_json", JSON.stringify(responseJSON.mydis));
  return { dis: responseJSON.dis, nodis: responseJSON.nodis, mydis: responseJSON.mydis } ?? "";

  // const rawres: ImportResult = await response.json();
  // return { data: rawres, nodis: rawres, my_result: rawres }

};