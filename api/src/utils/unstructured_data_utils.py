import json
import re
import copy

regex = "Nodes:\s+(.*?)\s?\s?Relationships:\s+(.*)"
internalRegex = "\[(.*?)\]"
jsonRegex = "\{.*\}"


def nodesTextToListOfDict(nodes):
    result = []
    for node in nodes:
        nodeList = node.split(",")
        if len(nodeList) < 2:
            print("WARNING: nodeList < 2")
            continue

        name = nodeList[0].strip().replace('"', "")
        label = nodeList[1].strip().replace('"', "")
        properties = re.search(jsonRegex, node)
        if properties == None:
            properties = "{}"
        else:
            properties = properties.group(0)
        properties = properties.replace("True", "true")
        try:
            properties = json.loads(properties)
        except:
            properties = {}
        if name[0] == "[":
            name = name[1:]
        result.append({"name": name, "label": label, "properties": properties})
    return result


def relationshipTextToListOfDict(relationships):
    result = []
    for relation in relationships:
        relationList = relation.split(",")
        if len(relation) < 3:
            continue
        start = relationList[0].strip().replace('"', "")
        end = relationList[2].strip().replace('"', "")
        type = relationList[1].strip().replace('"', "")

        properties = re.search(jsonRegex, relation)
        if properties == None:
            properties = "{}"
        else:
            properties = properties.group(0)
        properties = properties.replace("True", "true")
        try:
            properties = json.loads(properties)
        except:
            properties = {}
        if start[0] == "[":
            start = start[1:]
        if end[0] == "[":
            end = end[1:]
        result.append(
            {"start": start, "end": end, "type": type, "properties": properties}
        )
    return result

def myDisambiguation(obj):
    oriObj = copy.deepcopy(obj)
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

    return oriObj