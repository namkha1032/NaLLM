import { NodeType, RelationshipType } from "../types/respons-types";

function createNodeStatement(node: NodeType) {
  const properties = Object.entries(node.properties);
  const propertiesStrings: string[] = [];
  propertiesStrings.push(
    `import_name: '${node.name ? node.name.toString().replaceAll("'", "\\'") : 'default_string'}'`
  );

  properties.forEach((property) => {
    const propertyKey = property[0];
    const propertyValue = property[1];
    if (propertyKey === undefined || propertyValue === undefined) {
      return;
    }
    console.log(propertyKey, propertyValue);
    propertiesStrings.push(
      `\`${propertyKey}\`: '${propertyValue ? propertyValue.toString().replaceAll("'", "\\'") : 'default_string'}'`
    );
  });
  return `CREATE (:\`${node.label}\` {${propertiesStrings.join(", ")}  })`;
}

// Function to generate a Cypher statement for creating a relationship
function createRelationshipStatement(relationship: RelationshipType) {
  const properties = Object.entries(relationship.properties);
  const propertiesStrings: string[] = [];
  properties.forEach((property) => {
    const propertyKey = property[0];
    const propertyValue = property[1];
    if (propertyKey === undefined || propertyValue === undefined) {
      return;
    }

    propertiesStrings.push(
      `\`${propertyKey}\`: '${propertyValue ? propertyValue.toString().replaceAll("'", "\\'") : 'default_string'}'`
    );
  });
  //TODO: Make into single statement
  return `MATCH (source { import_name: '${relationship.start ? relationship.start
    .toString()
    .replaceAll("'", "\\'") : "default_string"}' }), (target { import_name: '${relationship.end ? relationship.end
    .toString()
    .replaceAll("'", "\\'") : "default_string"}' }) CREATE (source)-[:\`${relationship.type ? relationship.type
    .toString()
    .replaceAll("'", "\\'") : "default_string"}\` {${propertiesStrings.join(", ")}}]->(target);`;
}

export const dataToCypher = (data: {
  nodes: NodeType[];
  relationships: RelationshipType[];
}) => {
  const cypherStatements: string[] = [];

  data.nodes.forEach((node, index) => {
    let nodeStatement = createNodeStatement(node);
    if (index === data.nodes.length - 1) {
      nodeStatement += ";";
    }
    cypherStatements.push(nodeStatement);
  });

  data.relationships.forEach((relationship) => {
    cypherStatements.push(createRelationshipStatement(relationship));
  });

  const cypherScript = cypherStatements.join("\n");
  return cypherScript;
};
