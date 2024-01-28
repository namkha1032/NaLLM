CREATE (:`Character` {import_name: 'CJ', `full_name`: 'Carl \'CJ\' Johnson', `role`: 'Protagonist'  })
CREATE (:`Character` {import_name: 'Frank_Tenpenny', `role`: 'Antagonist', `voice_actor`: 'Samuel L. Jackson'  })
CREATE (:`Character` {import_name: 'Sweet', `role`: 'CJ\'s brother'  })
CREATE (:`Character` {import_name: 'Kendl', `role`: 'CJ\'s sister'  })
CREATE (:`Character` {import_name: 'Big_Smoke', `role`: 'Antagonist'  })
CREATE (:`Character` {import_name: 'Ryder', `role`: 'Antagonist'  })
CREATE (:`Character` {import_name: 'Cesar_Vialpando', `role`: 'Ally'  })
CREATE (:`Character` {import_name: 'The_Truth', `role`: 'Ally', `voice_actor`: 'Peter Fonda'  })
CREATE (:`Character` {import_name: 'Wu_Zi_Mu', `role`: 'Ally'  })
CREATE (:`Character` {import_name: 'Mike_Toreno', `role`: 'Government Agent', `voice_actor`: 'James Woods'  })
CREATE (:`City` {import_name: 'Los_Santos', `based_on`: 'Los Angeles'  })
CREATE (:`City` {import_name: 'San_Fierro', `based_on`: 'San Francisco'  })
CREATE (:`City` {import_name: 'Las_Venturas', `based_on`: 'Las Vegas'  })
CREATE (:`FictionalState` {import_name: 'San_Andreas', `based_on`: 'California and Nevada'  })
CREATE (:`Platform` {import_name: 'PS2', `name`: 'PlayStation 2'  })
CREATE (:`Platform` {import_name: 'Windows', `name`: 'Windows'  })
CREATE (:`Platform` {import_name: 'Xbox', `name`: 'Xbox'  })
CREATE (:`VideoGame` {import_name: 'GTA_SA', `title`: 'Grand Theft Auto: San Andreas', `release_year`: '2004', `developer`: 'Rockstar North', `publisher`: 'Rockstar Games', `genre`: 'action-adventure'  });
MATCH (source { import_name: 'GTA_SA' }), (target { import_name: 'CJ' }) CREATE (source)-[:`features` {}]->(target);
MATCH (source { import_name: 'GTA_SA' }), (target { import_name: 'San_Andreas' }) CREATE (source)-[:`set_in` {}]->(target);
MATCH (source { import_name: 'San_Andreas' }), (target { import_name: 'Los_Santos' }) CREATE (source)-[:`includes_city` {}]->(target);
MATCH (source { import_name: 'San_Andreas' }), (target { import_name: 'San_Fierro' }) CREATE (source)-[:`includes_city` {}]->(target);
MATCH (source { import_name: 'San_Andreas' }), (target { import_name: 'Las_Venturas' }) CREATE (source)-[:`includes_city` {}]->(target);
MATCH (source { import_name: 'GTA_SA' }), (target { import_name: 'PS2' }) CREATE (source)-[:`released_on` {`date`: 'October 2004'}]->(target);
MATCH (source { import_name: 'GTA_SA' }), (target { import_name: 'Windows' }) CREATE (source)-[:`released_on` {`date`: '2005'}]->(target);
MATCH (source { import_name: 'GTA_SA' }), (target { import_name: 'Xbox' }) CREATE (source)-[:`released_on` {`date`: '2005'}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Sweet' }) CREATE (source)-[:`has_sibling` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Kendl' }) CREATE (source)-[:`has_sibling` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Frank_Tenpenny' }) CREATE (source)-[:`opposes` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Big_Smoke' }) CREATE (source)-[:`opposes` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Ryder' }) CREATE (source)-[:`opposes` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Cesar_Vialpando' }) CREATE (source)-[:`allied_with` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'The_Truth' }) CREATE (source)-[:`allied_with` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Wu_Zi_Mu' }) CREATE (source)-[:`allied_with` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Mike_Toreno' }) CREATE (source)-[:`works_for` {}]->(target);