CREATE (:`Character` {import_name: 'Character'  })
CREATE (:`City` {import_name: 'City'  })
CREATE (:`Game` {import_name: 'Game'  })
CREATE (:`Character` {import_name: 'Carl Johnson', `name`: 'Carl Johnson'  })
CREATE (:`Character` {import_name: 'Frank Tenpenny', `name`: 'Frank Tenpenny', `actor`: 'Samuel L. Jackson'  })
CREATE (:`Character` {import_name: 'Sweet', `name`: 'Sweet', `actor`: 'Faizon Love'  })
CREATE (:`Character` {import_name: 'Kendl', `name`: 'Kendl', `actor`: 'Yolanda Whittaker'  })
CREATE (:`Character` {import_name: 'Big Smoke', `name`: 'Big Smoke', `actor`: 'Clifton Powell'  })
CREATE (:`Character` {import_name: 'Ryder', `name`: 'Ryder', `actor`: 'MC Eiht'  })
CREATE (:`Character` {import_name: 'Cesar Vialpando', `name`: 'Cesar Vialpando', `actor`: 'Clifton Collins Jr.'  })
CREATE (:`Character` {import_name: 'The Truth', `name`: 'The Truth', `actor`: 'Peter Fonda'  })
CREATE (:`Character` {import_name: 'Wu Zi Mu', `name`: 'Wu Zi Mu', `actor`: 'James Yaegashi'  })
CREATE (:`Character` {import_name: 'Mike Toreno', `name`: 'Mike Toreno', `actor`: 'James Woods'  })
CREATE (:`City` {import_name: 'Los Santos', `location`: 'California'  })
CREATE (:`City` {import_name: 'San Fierro', `location`: 'San Francisco'  })
CREATE (:`City` {import_name: 'Las Venturas', `location`: 'Las Vegas'  })
CREATE (:`Game` {import_name: 'Grand Theft Auto: San Andreas', `year`: '2004', `developer`: 'Rockstar North', `publisher`: 'Rockstar Games'  });
MATCH (source { import_name: 'Carl Johnson' }), (target { import_name: 'Sweet' }) CREATE (source)-[:`is friend of` {}]->(target);
MATCH (source { import_name: 'Carl Johnson' }), (target { import_name: 'Sweet' }) CREATE (source)-[:`is brother of` {}]->(target);
MATCH (source { import_name: 'Carl Johnson' }), (target { import_name: 'Kendl' }) CREATE (source)-[:`is brother of` {}]->(target);
MATCH (source { import_name: 'Carl Johnson' }), (target { import_name: 'Grove Street Families' }) CREATE (source)-[:`is member of gang` {}]->(target);
MATCH (source { import_name: 'Carl Johnson' }), (target { import_name: 'Cesar Vialpando' }) CREATE (source)-[:`is ally of` {}]->(target);
MATCH (source { import_name: 'Carl Johnson' }), (target { import_name: 'The Truth' }) CREATE (source)-[:`is ally of` {}]->(target);
MATCH (source { import_name: 'Carl Johnson' }), (target { import_name: 'Wu Zi Mu' }) CREATE (source)-[:`is ally of` {}]->(target);
MATCH (source { import_name: 'Carl Johnson' }), (target { import_name: 'Frank Tenpenny' }) CREATE (source)-[:`is enemy of` {}]->(target);
MATCH (source { import_name: 'Carl Johnson' }), (target { import_name: 'Big Smoke' }) CREATE (source)-[:`is enemy of` {}]->(target);
MATCH (source { import_name: 'Carl Johnson' }), (target { import_name: 'Ryder' }) CREATE (source)-[:`is enemy of` {}]->(target);
MATCH (source { import_name: 'Carl Johnson' }), (target { import_name: 'Mike Toreno' }) CREATE (source)-[:`is enemy of` {}]->(target);
MATCH (source { import_name: '\'Character\'' }), (target { import_name: '\'Character\'' }) CREATE (source)-[:`\'performs action\'` {}]->(target);
MATCH (source { import_name: '\'Character\'' }), (target { import_name: '\'Character\'' }) CREATE (source)-[:`\'follows\'` {}]->(target);
MATCH (source { import_name: '\'Character\'' }), (target { import_name: '\'Character\'' }) CREATE (source)-[:`\'watches\'` {}]->(target);
MATCH (source { import_name: '\'Character\'' }), (target { import_name: '\'City\'' }) CREATE (source)-[:`\'celebrates at\'` {}]->(target);
MATCH (source { import_name: '\'Character\'' }), (target { import_name: '\'City\'' }) CREATE (source)-[:`\'checks on\'` {}]->(target);