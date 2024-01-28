CREATE (:`Company` {import_name: 'Rockstar North', `name`: 'Rockstar North', `country`: 'British'  })
CREATE (:`Company` {import_name: 'Rockstar Games', `name`: 'Rockstar Games', `country`: 'American'  })
CREATE (:`Game` {import_name: '[Grand Theft Auto', `name`: 'Grand Theft Auto'  })
CREATE (:`Person` {import_name: 'David Jones', `name`: 'David Jones'  })
CREATE (:`Person` {import_name: 'Mike Dailly', `name`: 'Mike Dailly'  })
CREATE (:`Person` {import_name: 'Dan Houser', `name`: 'Dan Houser'  })
CREATE (:`Person` {import_name: 'Sam Houser', `name`: 'Sam Houser'  })
CREATE (:`Person` {import_name: 'Leslie Benzies', `name`: 'Leslie Benzies'  })
CREATE (:`Person` {import_name: 'Aaron Garbut', `name`: 'Aaron Garbut'  })
CREATE (:`Person` {import_name: 'Ray Liotta', `name`: 'Ray Liotta'  })
CREATE (:`Person` {import_name: 'Dennis Hopper', `name`: 'Dennis Hopper'  })
CREATE (:`Person` {import_name: 'Samuel L. Jackson', `name`: 'Samuel L. Jackson'  })
CREATE (:`Person` {import_name: 'William Fichtner', `name`: 'William Fichtner'  })
CREATE (:`Person` {import_name: 'James Woods', `name`: 'James Woods'  })
CREATE (:`Person` {import_name: 'Debbie Harry', `name`: 'Debbie Harry'  })
CREATE (:`Person` {import_name: 'Axl Rose', `name`: 'Axl Rose'  })
CREATE (:`Person` {import_name: 'Peter Fonda', `name`: 'Peter Fonda'  });
MATCH (source { import_name: 'Rockstar North' }), (target { import_name: 'Grand Theft Auto' }) CREATE (source)-[:`developed_by` {}]->(target);
MATCH (source { import_name: 'Rockstar Games' }), (target { import_name: 'Grand Theft Auto' }) CREATE (source)-[:`published_by` {}]->(target);
MATCH (source { import_name: 'Grand Theft Auto' }), (target { import_name: 'Liberty City' }) CREATE (source)-[:`has_setting` {}]->(target);
MATCH (source { import_name: 'Grand Theft Auto' }), (target { import_name: 'San Andreas' }) CREATE (source)-[:`has_setting` {}]->(target);
MATCH (source { import_name: 'Grand Theft Auto' }), (target { import_name: 'Vice City' }) CREATE (source)-[:`has_setting` {}]->(target);
MATCH (source { import_name: 'Grand Theft Auto' }), (target { import_name: 'Ray Liotta' }) CREATE (source)-[:`voiced_by` {}]->(target);
MATCH (source { import_name: 'Grand Theft Auto' }), (target { import_name: 'Dennis Hopper' }) CREATE (source)-[:`voiced_by` {}]->(target);
MATCH (source { import_name: 'Grand Theft Auto' }), (target { import_name: 'Samuel L. Jackson' }) CREATE (source)-[:`voiced_by` {}]->(target);
MATCH (source { import_name: 'Grand Theft Auto' }), (target { import_name: 'William Fichtner' }) CREATE (source)-[:`voiced_by` {}]->(target);
MATCH (source { import_name: 'Grand Theft Auto' }), (target { import_name: 'James Woods' }) CREATE (source)-[:`voiced_by` {}]->(target);
MATCH (source { import_name: 'Grand Theft Auto' }), (target { import_name: 'Debbie Harry' }) CREATE (source)-[:`voiced_by` {}]->(target);
MATCH (source { import_name: 'Grand Theft Auto' }), (target { import_name: 'Axl Rose' }) CREATE (source)-[:`voiced_by` {}]->(target);
MATCH (source { import_name: 'Grand Theft Auto' }), (target { import_name: 'Peter Fonda' }) CREATE (source)-[:`voiced_by` {}]->(target);