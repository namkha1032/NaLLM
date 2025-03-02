import { CompanyReportData } from "../types";

type JSONResponse = {
  output?: CompanyReportData;
  errors?: Array<{ message: string }>;
};

export const getReportData = async (company: string, apiKey?: string) => {
  const body = {
    company,
    api_key: apiKey ? apiKey : undefined,
  };

  const response = await fetch(
    `http://localhost:7860/companyReport`,
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(body),
    }
  );
  if (!response.ok) {
    return Promise.reject(
      new Error(`Failed to get company: ${response.statusText}`)
    );
  }
  const { output, errors }: JSONResponse = await response.json();

  if (errors !== undefined) {
    const error = new Error(
      errors?.map((e) => e.message).join("\n") ?? "unknown"
    );
    return Promise.reject(error);
  }
  console.log("data", output);
  return output ?? undefined;
};
