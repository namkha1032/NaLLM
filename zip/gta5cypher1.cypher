CREATE (:`Character` {import_name: 'Michael_De_Santa', `name`: 'Michael De Santa', `actor`: 'Ned Luke', `role`: 'retired bank robber'  })
CREATE (:`Character` {import_name: 'Franklin_Clinton', `name`: 'Franklin Clinton', `actor`: 'Shawn Fonteno', `role`: 'street gangster'  })
CREATE (:`Character` {import_name: 'Trevor_Philips', `name`: 'Trevor Philips', `actor`: 'Steven Ogg', `role`: 'drug dealer and gunrunner'  })
CREATE (:`Company` {import_name: 'Rockstar_North', `name`: 'Rockstar North'  })
CREATE (:`Company` {import_name: 'Rockstar_Games', `name`: 'Rockstar Games'  })
CREATE (:`GameMode` {import_name: 'GTA_Online', `name`: 'Grand Theft Auto Online', `players`: 'up to 30', `mode`: 'multiplayer'  })
CREATE (:`Location` {import_name: 'San_Andreas', `name`: 'San Andreas', `based_on`: 'Southern California'  })
CREATE (:`Location` {import_name: 'Los_Santos', `name`: 'Los Santos', `based_on`: 'Los Angeles'  })
CREATE (:`VideoGame` {import_name: 'GTA_V'  })
CREATE (:`VideoGame` {import_name: 'GTA_IV', `title`: 'Grand Theft Auto IV', `release_year`: '2008'  })
CREATE (:`VideoGame` {import_name: 'GTA_VI', `title`: 'Grand Theft Auto VI', `scheduled_release`: '2025'  })
CREATE (:`VideoGame` {import_name: 'Red_Dead_Redemption', `title`: 'Red Dead Redemption'  })
CREATE (:`VideoGame` {import_name: 'Max_Payne_3', `title`: 'Max Payne 3'  })
CREATE (:`second-best-selling video game of all time` {import_name: 'fastest-selling entertainment product'  });
MATCH (source { import_name: 'GTA_V' }), (target { import_name: 'Rockstar_North' }) CREATE (source)-[:`developed_by` {}]->(target);
MATCH (source { import_name: 'GTA_V' }), (target { import_name: 'Rockstar_Games' }) CREATE (source)-[:`published_by` {}]->(target);
MATCH (source { import_name: 'GTA_V' }), (target { import_name: 'GTA_IV' }) CREATE (source)-[:`follows` {}]->(target);
MATCH (source { import_name: 'GTA_V' }), (target { import_name: 'GTA_VI' }) CREATE (source)-[:`precedes` {}]->(target);
MATCH (source { import_name: 'GTA_V' }), (target { import_name: 'Michael_De_Santa' }) CREATE (source)-[:`features` {}]->(target);
MATCH (source { import_name: 'GTA_V' }), (target { import_name: 'Franklin_Clinton' }) CREATE (source)-[:`features` {}]->(target);
MATCH (source { import_name: 'GTA_V' }), (target { import_name: 'Trevor_Philips' }) CREATE (source)-[:`features` {}]->(target);
MATCH (source { import_name: 'GTA_V' }), (target { import_name: 'San_Andreas' }) CREATE (source)-[:`set_in` {}]->(target);
MATCH (source { import_name: 'San_Andreas' }), (target { import_name: 'Los_Santos' }) CREATE (source)-[:`includes` {}]->(target);
MATCH (source { import_name: 'GTA_V' }), (target { import_name: 'GTA_Online' }) CREATE (source)-[:`has_mode` {}]->(target);
MATCH (source { import_name: 'Rockstar_North' }), (target { import_name: 'Red_Dead_Redemption' }) CREATE (source)-[:`influenced_by` {}]->(target);
MATCH (source { import_name: 'Rockstar_North' }), (target { import_name: 'Max_Payne_3' }) CREATE (source)-[:`influenced_by` {}]->(target);