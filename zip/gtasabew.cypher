CREATE (:`Character` {import_name: 'cj', `full_name`: 'Carl \'CJ\' Johnson'  })
CREATE (:`Character` {import_name: 'sweet', `name`: 'Sweet'  })
CREATE (:`Character` {import_name: 'kendl', `name`: 'Kendl'  })
CREATE (:`Character` {import_name: 'big_smoke', `name`: 'Big Smoke'  })
CREATE (:`Character` {import_name: 'ryder', `name`: 'Ryder'  })
CREATE (:`Character` {import_name: 'cesar_vialpando', `name`: 'Cesar Vialpando'  })
CREATE (:`Character` {import_name: 'frank_tenpenny', `name`: 'Frank Tenpenny', `actor`: 'Samuel L. Jackson'  })
CREATE (:`Character` {import_name: 'the_truth', `name`: 'The Truth', `actor`: 'Peter Fonda'  })
CREATE (:`Character` {import_name: 'wu_zi_mu', `name`: 'Wu Zi Mu'  })
CREATE (:`Character` {import_name: 'mike_toreno', `name`: 'Mike Toreno', `actor`: 'James Woods'  })
CREATE (:`Company` {import_name: 'rockstar_north', `name`: 'Rockstar North'  })
CREATE (:`Company` {import_name: 'rockstar_games', `name`: 'Rockstar Games'  })
CREATE (:`FictionalCity` {import_name: 'los_santos', `based_on`: 'Los Angeles'  })
CREATE (:`FictionalCity` {import_name: 'san_fierro', `based_on`: 'San Francisco'  })
CREATE (:`FictionalCity` {import_name: 'las_venturas', `based_on`: 'Las Vegas'  })
CREATE (:`FictionalState` {import_name: 'san_andreas', `based_on`: 'California and Nevada'  })
CREATE (:`Minigame` {import_name: 'hot_coffee', `name`: 'Hot Coffee'  })
CREATE (:`Platform` {import_name: 'playstation_2', `name`: 'PlayStation 2'  })
CREATE (:`Platform` {import_name: 'windows', `name`: 'Windows'  })
CREATE (:`Platform` {import_name: 'xbox', `name`: 'Xbox'  })
CREATE (:`VideoGame` {import_name: 'gta_sa', `title`: 'Grand Theft Auto: San Andreas', `release_year`: '2004', `genre`: 'action-adventure'  })
CREATE (:`VideoGame` {import_name: 'gta_iv', `title`: 'Grand Theft Auto IV', `release_year`: '2008'  });
MATCH (source { import_name: 'gta_sa' }), (target { import_name: 'rockstar_north' }) CREATE (source)-[:`developed_by` {}]->(target);
MATCH (source { import_name: 'gta_sa' }), (target { import_name: 'rockstar_games' }) CREATE (source)-[:`published_by` {}]->(target);
MATCH (source { import_name: 'gta_sa' }), (target { import_name: 'san_andreas' }) CREATE (source)-[:`set_in` {}]->(target);
MATCH (source { import_name: 'gta_sa' }), (target { import_name: 'cj' }) CREATE (source)-[:`follows_character` {}]->(target);
MATCH (source { import_name: 'gta_sa' }), (target { import_name: 'playstation_2' }) CREATE (source)-[:`available_on` {`release_year`: '2004'}]->(target);
MATCH (source { import_name: 'gta_sa' }), (target { import_name: 'windows' }) CREATE (source)-[:`available_on` {`release_year`: '2005'}]->(target);
MATCH (source { import_name: 'gta_sa' }), (target { import_name: 'xbox' }) CREATE (source)-[:`available_on` {`release_year`: '2005'}]->(target);
MATCH (source { import_name: 'gta_sa' }), (target { import_name: 'gta_iv' }) CREATE (source)-[:`predecessor` {}]->(target);
MATCH (source { import_name: 'gta_sa' }), (target { import_name: 'hot_coffee' }) CREATE (source)-[:`includes_minigame` {}]->(target);
MATCH (source { import_name: 'san_andreas' }), (target { import_name: 'los_santos' }) CREATE (source)-[:`includes_city` {}]->(target);
MATCH (source { import_name: 'san_andreas' }), (target { import_name: 'san_fierro' }) CREATE (source)-[:`includes_city` {}]->(target);
MATCH (source { import_name: 'san_andreas' }), (target { import_name: 'las_venturas' }) CREATE (source)-[:`includes_city` {}]->(target);
MATCH (source { import_name: 'cj' }), (target { import_name: 'sweet' }) CREATE (source)-[:`has_sibling` {}]->(target);
MATCH (source { import_name: 'cj' }), (target { import_name: 'kendl' }) CREATE (source)-[:`has_sibling` {}]->(target);
MATCH (source { import_name: 'cj' }), (target { import_name: 'big_smoke' }) CREATE (source)-[:`friend_with` {}]->(target);
MATCH (source { import_name: 'cj' }), (target { import_name: 'ryder' }) CREATE (source)-[:`friend_with` {}]->(target);
MATCH (source { import_name: 'kendl' }), (target { import_name: 'cesar_vialpando' }) CREATE (source)-[:`in_relationship_with` {}]->(target);
MATCH (source { import_name: 'cj' }), (target { import_name: 'frank_tenpenny' }) CREATE (source)-[:`enemy_with` {}]->(target);
MATCH (source { import_name: 'cj' }), (target { import_name: 'the_truth' }) CREATE (source)-[:`befriends` {}]->(target);
MATCH (source { import_name: 'cj' }), (target { import_name: 'wu_zi_mu' }) CREATE (source)-[:`befriends` {}]->(target);
MATCH (source { import_name: 'cj' }), (target { import_name: 'mike_toreno' }) CREATE (source)-[:`confronts` {}]->(target);
MATCH (source { import_name: 'cj' }), (target { import_name: 'big_smoke' }) CREATE (source)-[:`kills` {}]->(target);
MATCH (source { import_name: 'cj' }), (target { import_name: 'ryder' }) CREATE (source)-[:`kills` {}]->(target);