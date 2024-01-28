CREATE (:`Actor` {import_name: 'Sean Connery'  })
CREATE (:`Actor` {import_name: 'Daniel Craig'  })
CREATE (:`Actor` {import_name: 'David Niven'  })
CREATE (:`Character` {import_name: '[James Bond', `code_number`: '007'  })
CREATE (:`Writer` {import_name: 'Ian Fleming'  })
CREATE (:`Writer` {import_name: 'Kingsley Amis'  })
CREATE (:`Writer` {import_name: 'Christopher Wood'  })
CREATE (:`Writer` {import_name: 'John Gardner'  })
CREATE (:`Writer` {import_name: 'Raymond Benson'  })
CREATE (:`Writer` {import_name: 'Sebastian Faulks'  })
CREATE (:`Writer` {import_name: 'Jeffery Deaver'  })
CREATE (:`Writer` {import_name: 'William Boyd'  })
CREATE (:`Writer` {import_name: 'Anthony Horowitz'  })
CREATE (:`Writer` {import_name: 'Charlie Higson'  })
CREATE (:`Writer` {import_name: 'Kate Westbrook'  });
MATCH (source { import_name: 'Sean Connery' }), (target { import_name: 'James Bond' }) CREATE (source)-[:`played_by` {}]->(target);
MATCH (source { import_name: 'Daniel Craig' }), (target { import_name: 'James Bond' }) CREATE (source)-[:`played_by` {}]->(target);
MATCH (source { import_name: 'David Niven' }), (target { import_name: 'James Bond' }) CREATE (source)-[:`played_by` {}]->(target);
MATCH (source { import_name: 'Ian Fleming' }), (target { import_name: 'James Bond' }) CREATE (source)-[:`wrote` {}]->(target);
MATCH (source { import_name: 'Kingsley Amis' }), (target { import_name: 'James Bond' }) CREATE (source)-[:`wrote` {}]->(target);
MATCH (source { import_name: 'Christopher Wood' }), (target { import_name: 'James Bond' }) CREATE (source)-[:`wrote` {}]->(target);
MATCH (source { import_name: 'John Gardner' }), (target { import_name: 'James Bond' }) CREATE (source)-[:`wrote` {}]->(target);
MATCH (source { import_name: 'Raymond Benson' }), (target { import_name: 'James Bond' }) CREATE (source)-[:`wrote` {}]->(target);
MATCH (source { import_name: 'Sebastian Faulks' }), (target { import_name: 'James Bond' }) CREATE (source)-[:`wrote` {}]->(target);
MATCH (source { import_name: 'Jeffery Deaver' }), (target { import_name: 'James Bond' }) CREATE (source)-[:`wrote` {}]->(target);
MATCH (source { import_name: 'William Boyd' }), (target { import_name: 'James Bond' }) CREATE (source)-[:`wrote` {}]->(target);
MATCH (source { import_name: 'Anthony Horowitz' }), (target { import_name: 'James Bond' }) CREATE (source)-[:`wrote` {}]->(target);
MATCH (source { import_name: 'Charlie Higson' }), (target { import_name: 'James Bond' }) CREATE (source)-[:`wrote` {}]->(target);
MATCH (source { import_name: 'Kate Westbrook' }), (target { import_name: 'James Bond' }) CREATE (source)-[:`wrote` {}]->(target);