CREATE (:`FictionalCharacter` {import_name: 'Carl Johnson', `full_name`: 'Carl Johnson', `nickname`: 'CJ', `name`: 'Carl Johnson'  })
CREATE (:`FictionalCharacter` {import_name: 'Bloods'  })
CREATE (:`FictionalCharacter` {import_name: 'Crips'  })
CREATE (:`FictionalCharacter` {import_name: '1990s crack epidemic'  })
CREATE (:`FictionalCharacter` {import_name: '1992 Los Angeles riots'  })
CREATE (:`FictionalCharacter` {import_name: 'Rampart scandal'  })
CREATE (:`FictionalCharacter` {import_name: 'Fierro'  })
CREATE (:`FictionalCharacter` {import_name: 'Las Venturas'  })
CREATE (:`FictionalCharacter` {import_name: 'FictionalCharacter'  })
CREATE (:`FictionalCharacter` {import_name: 'CJ', `name`: 'CJ'  })
CREATE (:`FictionalCharacter` {import_name: 'Frank Tenpenny', `name`: 'Frank Tenpenny'  })
CREATE (:`FictionalCharacter` {import_name: 'Sweet', `name`: 'Sweet'  })
CREATE (:`FictionalCharacter` {import_name: 'Kendl', `name`: 'Kendl'  })
CREATE (:`FictionalCharacter` {import_name: 'Big Smoke', `name`: 'Big Smoke'  })
CREATE (:`FictionalCharacter` {import_name: 'Ryder', `name`: 'Ryder'  })
CREATE (:`FictionalCharacter` {import_name: 'CJ\'s mother'  })
CREATE (:`FictionalCharacter` {import_name: 'Cesar Vialpando', `leader`: 'Aztecas gang'  })
CREATE (:`FictionalCharacter` {import_name: 'Clifton Collins Jr.'  })
CREATE (:`FictionalCharacter` {import_name: 'Smoke'  })
CREATE (:`FictionalCharacter` {import_name: 'Tenpenny'  })
CREATE (:`FictionalCharacter` {import_name: 'The Truth', `name`: 'The Truth', `actor`: 'Peter Fonda'  })
CREATE (:`FictionalCharacter` {import_name: 'Wu Zi Mu', `name`: 'Wu Zi Mu', `actor`: 'James Yaegashi'  })
CREATE (:`FictionalCharacter` {import_name: 'James Woods', `name`: 'Mike Toreno'  })
CREATE (:`FictionalLocation` {import_name: 'Grove Street', `name`: 'Grove Street'  })
CREATE (:`FictionalLocation` {import_name: 'Los Santos', `name`: 'Los Santos'  })
CREATE (:`FictionalLocation` {import_name: 'Grove Street Families'  })
CREATE (:`FictionalLocation` {import_name: 'Ballas gang'  })
CREATE (:`FictionalLocation` {import_name: 'San Fierro', `name`: 'San Fierro'  })
CREATE (:`FictionalLocation` {import_name: 'Los Santos'  })
CREATE (:`GameDeveloper` {import_name: 'Rockstar North'  })
CREATE (:`GameDeveloper` {import_name: 'Rockstar Games'  })
CREATE (:`GameDeveloper` {import_name: 'GameDeveloper'  })
CREATE (:`GamePublisher` {import_name: 'Rockstar Games'  })
CREATE (:`GamePublisher` {import_name: 'Take-Two Interactive'  })
CREATE (:`GamePublisher` {import_name: 'GamePublisher'  })
CREATE (:`VideoGame` {import_name: 'Grand Theft Auto: San Andreas', `release_year`: '2004'  })
CREATE (:`VideoGame` {import_name: 'PlayStation 2', `release_date`: 'October 2004'  })
CREATE (:`VideoGame` {import_name: 'Windows', `release_date`: '2005'  })
CREATE (:`VideoGame` {import_name: 'Xbox', `release_date`: '2005'  })
CREATE (:`VideoGame` {import_name: '2010s enhanced version'  })
CREATE (:`VideoGame` {import_name: '2021 remastered version'  })
CREATE (:`VideoGame` {import_name: 'Grand Theft Auto'  })
CREATE (:`VideoGame` {import_name: 'San Andreas'  })
CREATE (:`VideoGame` {import_name: 'Grand Theft Auto IV', `release_date`: 'April 2008'  })
CREATE (:`VideoGame` {import_name: 'VideoGame'  });
MATCH (source { import_name: 'Grand Theft Auto: San Andreas' }), (target { import_name: 'Rockstar North' }) CREATE (source)-[:`developed_by` {}]->(target);
MATCH (source { import_name: 'Grand Theft Auto: San Andreas' }), (target { import_name: 'Rockstar Games' }) CREATE (source)-[:`published_by` {}]->(target);
MATCH (source { import_name: 'Grand Theft Auto: San Andreas' }), (target { import_name: 'Carl Johnson' }) CREATE (source)-[:`follows` {}]->(target);
MATCH (source { import_name: 'Rockstar Games' }), (target { import_name: 'GameDeveloper' }) CREATE (source)-[:`developed_by` {}]->(target);
MATCH (source { import_name: 'Grand Theft Auto: San Andreas' }), (target { import_name: 'Take-Two Interactive' }) CREATE (source)-[:`published_by` {}]->(target);
MATCH (source { import_name: 'Carl Johnson' }), (target { import_name: 'Grand Theft Auto: San Andreas' }) CREATE (source)-[:`character in` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Los Santos' }) CREATE (source)-[:`returns to` {`year`: '1992'}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Sweet' }) CREATE (source)-[:`reunites with` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Kendl' }) CREATE (source)-[:`reunites with` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Big Smoke' }) CREATE (source)-[:`reunites with` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Ryder' }) CREATE (source)-[:`reunites with` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Grove Street' }) CREATE (source)-[:`returns to` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Frank Tenpenny' }) CREATE (source)-[:`threatened by` {}]->(target);
MATCH (source { import_name: 'Grove Street Families' }), (target { import_name: 'CJ' }) CREATE (source)-[:`lost territory` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Grove Street Families' }) CREATE (source)-[:`helped reunite` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Cesar Vialpando' }) CREATE (source)-[:`allied with` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Smoke' }) CREATE (source)-[:`witnessed` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Ryder' }) CREATE (source)-[:`witnessed` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Tenpenny' }) CREATE (source)-[:`discovered` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Ballas gang' }) CREATE (source)-[:`discovered` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'set-up' }) CREATE (source)-[:`suspected` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'CJ\'s mother\'s murder' }) CREATE (source)-[:`suspected` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Sweet' }) CREATE (source)-[:`helps` {`action`: 'aid in a showdown against the Ballas'}]->(target);
MATCH (source { import_name: 'Sweet' }), (target { import_name: 'police' }) CREATE (source)-[:`imprisoned by` {`reason`: 'wounded in the ambush'}]->(target);
MATCH (source { import_name: 'Tenpenny' }), (target { import_name: 'CJ' }) CREATE (source)-[:`exiles` {`location`: 'countryside'}]->(target);
MATCH (source { import_name: 'Tenpenny' }), (target { import_name: 'CJ' }) CREATE (source)-[:`forces` {`action`: 'carry out favours that eliminate witnesses who could expose his corruption'}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'The Truth' }) CREATE (source)-[:`befriends` {`description`: 'hippie'}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Wu Zi Mu' }) CREATE (source)-[:`befriends` {`description`: 'Triad leader'}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'garage in San Fierro' }) CREATE (source)-[:`sets up` {`purpose`: 'earn money'}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Loco Synd' }) CREATE (source)-[:`crosses paths with` {`location`: 'San Fierro'}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Smoke' }) CREATE (source)-[:`steals` {`action`: 'at gunpoint while stealing drug money'}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Building' }) CREATE (source)-[:`causes` {`action`: 'explosion'}]->(target);
MATCH (source { import_name: 'Tenpenny' }), (target { import_name: 'FireTruck' }) CREATE (source)-[:`escapes` {}]->(target);
MATCH (source { import_name: 'Tenpenny' }), (target { import_name: 'Bridge' }) CREATE (source)-[:`crashes` {`location`: 'over the side of a bridge'}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Tenpenny' }) CREATE (source)-[:`follows` {}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Tenpenny' }) CREATE (source)-[:`watches` {`action`: 'dies of his injuries'}]->(target);
MATCH (source { import_name: 'CJ\'s family and friends' }), (target { import_name: 'Johnson House' }) CREATE (source)-[:`celebrate` {`event`: 'success celebration'}]->(target);
MATCH (source { import_name: 'CJ' }), (target { import_name: 'Neighbourhood' }) CREATE (source)-[:`leaves` {`action`: 'check on the neighbourhood'}]->(target);