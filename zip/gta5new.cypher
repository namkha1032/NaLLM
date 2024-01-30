MERGE (:`Person` {import_name: 'Michael Townley', `status`: 'deceased'  })
MERGE (:`Person` {import_name: 'Brad', `status`: 'deceased', `occupation`: 'criminal'  })
MERGE (:`Person` {import_name: 'Trevor', `status`: 'alive', `occupation`: 'criminal', `location`: 'Los Santos'  })
MERGE (:`Person` {import_name: 'Lester', `occupation`: 'criminal', `status`: 'alive'  })
MERGE (:`Organization` {import_name: 'FIB', `affiliation`: 'law enforcement'  })
MERGE (:`Person` {import_name: 'Michael De Santa', `status`: 'alive', `new name`: 'Michael De Santa'  })
MERGE (:`Person` {import_name: 'Dave Norton', `occupation`: 'FIB agent', `status`: 'alive'  })
MERGE (:`Person` {import_name: 'Franklin', `status`: 'alive', `occupation`: 'criminal', `location`: 'Los Santos'  })
MERGE (:`Person` {import_name: 'Lamar', `status`: 'alive', `occupation`: 'gang member'  })
MERGE (:`Person` {import_name: 'Simeon', `occupation`: 'shady car dealer'  })
MERGE (:`Person` {import_name: 'Jimmy', `status`: 'alive'  })
MERGE (:`Person` {import_name: 'Martin Madrazo', `occupation`: 'drug kingpin'  })
MERGE (:`Organization` {import_name: 'Lifeinvader', `industry`: 'social media platform'  })
MERGE (:`Person` {import_name: 'Johnny Klebitz', `affiliation`: 'motorcycle gang'  })
MERGE (:`Organization` {import_name: 'Wei Cheng Triad', `affiliation`: 'Chinese gang'  })
MERGE (:`Person` {import_name: 'Wade', `relation`: 'friend'  })
MERGE (:`Location` {import_name: 'Los Santos', `status`: 'active', `type`: 'city'  })
MERGE (:`Person` {import_name: 'Michael', `occupation`: 'retired criminal', `location`: 'Los Santos', `status`: 'deceased'  })
MERGE (:`Person` {import_name: 'Tracey', `occupation`: 'aspiring TV personality'  })
MERGE (:`Person` {import_name: 'Lazlow Jones', `occupation`: 'TV host'  })
MERGE (:`Person` {import_name: 'Floyd', `relation`: 'cousin', `status`: 'deceased', `occupation`: 'associate'  })
MERGE (:`Person` {import_name: 'Madrazo', `occupation`: 'criminal'  })
MERGE (:`Organization` {import_name: 'IAA', `affiliation`: 'intelligence agency'  })
MERGE (:`Person` {import_name: 'Ferdinand Kerimov', `occupation`: 'suspected terrorist'  })
MERGE (:`Person` {import_name: 'Steve Haines', `occupation`: 'FIB agent', `status`: 'deceased'  })
MERGE (:`Organization` {import_name: 'Merryweather Security', `affiliation`: 'private military contractor'  })
MERGE (:`Person` {import_name: 'Devin Weston', `occupation`: 'businessman', `status`: 'deceased'  })
MERGE (:`Person` {import_name: 'Solomon Richards', `occupation`: 'Vinewood producer'  })
MERGE (:`Person` {import_name: 'Patricia', `occupation`: 'kidnapped', `status`: 'alive', `relationship`: 'wife'  })
MERGE (:`Person` {import_name: 'solomon', `status`: 'alive', `occupation`: 'film producer'  })
MERGE (:`Organization` {import_name: 'Merryweather', `status`: 'active', `type`: 'mercenary group'  })
MERGE (:`Organization` {import_name: 'Ballas', `status`: 'active', `type`: 'rival gang'  })
MERGE (:`Location` {import_name: 'union depository', `status`: 'active', `type`: 'bank'  })
MERGE (:`Location` {import_name: 'vanilla unicorn', `status`: 'active', `type`: 'strip club'  })
MERGE (:`Location` {import_name: 'FIB headquarters', `status`: 'active', `type`: 'government building'  })
MERGE (:`Item` {import_name: 'trailer', `status`: 'active', `type`: 'vehicle'  })
MERGE (:`Item` {import_name: 'briefcase', `status`: 'active', `type`: 'container'  })
MERGE (:`Item` {import_name: 'ancient artifact', `status`: 'active', `type`: 'artifact'  })
MERGE (:`Item` {import_name: 'film', `status`: 'active', `type`: 'production'  })
MERGE (:`Item` {import_name: 'files', `status`: 'active', `type`: 'documents'  })
MERGE (:`Person` {import_name: 'Weston', `status`: 'deceased'  })
MERGE (:`Group` {import_name: 'Triads'  })
MERGE (:`Person` {import_name: 'Michael\'s widow', `status`: 'alive'  })
MERGE (:`Person` {import_name: 'Jimmy\'s family', `status`: 'alive'  });
MATCH (source { import_name: 'Michael Townley' }), (target { import_name: 'bank robbery crew' }) MERGE (source)-[:`part of` {}]->(target);
MATCH (source { import_name: 'Brad' }), (target { import_name: 'bank robbery crew' }) MERGE (source)-[:`part of` {}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'bank robbery crew' }) MERGE (source)-[:`part of` {}]->(target);
MATCH (source { import_name: 'Lester' }), (target { import_name: 'bank robbery crew' }) MERGE (source)-[:`part of` {}]->(target);
MATCH (source { import_name: 'bank robbery crew' }), (target { import_name: 'security company' }) MERGE (source)-[:`attempted robbery` {`year`: '2004'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'security guard' }) MERGE (source)-[:`murders` {}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'police' }) MERGE (source)-[:`chased by` {}]->(target);
MATCH (source { import_name: 'getaway driver' }), (target { import_name: 'police' }) MERGE (source)-[:`killed by` {}]->(target);
MATCH (source { import_name: 'Michael Townley' }), (target { import_name: 'FIB' }) MERGE (source)-[:`makes deal with` {`deal`: 'witness protection'}]->(target);
MATCH (source { import_name: 'FIB' }), (target { import_name: 'Michael De Santa' }) MERGE (source)-[:`protects` {}]->(target);
MATCH (source { import_name: 'Michael De Santa' }), (target { import_name: '{}' }) MERGE (source)-[:`in therapy` {}]->(target);
MATCH (source { import_name: 'Michael De Santa' }), (target { import_name: 'wife' }) MERGE (source)-[:`married to` {}]->(target);
MATCH (source { import_name: 'Michael De Santa' }), (target { import_name: 'family' }) MERGE (source)-[:`has` {}]->(target);
MATCH (source { import_name: 'Dave Norton' }), (target { import_name: 'Michael De Santa' }) MERGE (source)-[:`in charge of protection for` {}]->(target);
MATCH (source { import_name: 'Lamar' }), (target { import_name: 'Michael De Santa\'s son' }) MERGE (source)-[:`steals car of` {}]->(target);
MATCH (source { import_name: 'Lamar' }), (target { import_name: 'Simeon' }) MERGE (source)-[:`works for` {}]->(target);
MATCH (source { import_name: 'Franklin' }), (target { import_name: 'Lamar' }) MERGE (source)-[:`acquaintance of` {}]->(target);
MATCH (source { import_name: 'Michael De Santa' }), (target { import_name: 'Franklin' }) MERGE (source)-[:`meets` {}]->(target);
MATCH (source { import_name: 'Franklin' }), (target { import_name: 'Michael De Santa' }) MERGE (source)-[:`visits` {}]->(target);
MATCH (source { import_name: 'Franklin' }), (target { import_name: 'Michael De Santa\'s son' }) MERGE (source)-[:`rescues` {}]->(target);
MATCH (source { import_name: 'Franklin' }), (target { import_name: 'Michael De Santa' }) MERGE (source)-[:`forms partnership with` {}]->(target);
MATCH (source { import_name: 'Michael De Santa' }), (target { import_name: 'tennis instructor' }) MERGE (source)-[:`catches wife with` {}]->(target);
MATCH (source { import_name: 'Michael De Santa' }), (target { import_name: '{}' }) MERGE (source)-[:`rampages` {}]->(target);
MATCH (source { import_name: 'Michael De Santa' }), (target { import_name: 'house in Vinewood Hills' }) MERGE (source)-[:`destroys` {}]->(target);
MATCH (source { import_name: 'Martin Madrazo' }), (target { import_name: 'Michael De Santa and Franklin' }) MERGE (source)-[:`puts hit on` {}]->(target);
MATCH (source { import_name: 'Michael De Santa' }), (target { import_name: 'Lester' }) MERGE (source)-[:`contacts` {}]->(target);
MATCH (source { import_name: 'Lester' }), (target { import_name: 'Michael De Santa' }) MERGE (source)-[:`carries out mission with` {`mission`: 'assassinate the CEO of Lifeinvader'}]->(target);
MATCH (source { import_name: 'Michael De Santa' }), (target { import_name: 'new crew' }) MERGE (source)-[:`carries out jewelry heist with` {}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Michael De Santa is alive' }) MERGE (source)-[:`realizes` {}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'FIB agent Dave Norton' }) MERGE (source)-[:`corresponds with` {}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Johnny Klebitz' }) MERGE (source)-[:`facilitates` {`action`: 'killing'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Wei Cheng Triad' }) MERGE (source)-[:`facilitates` {`action`: 'confrontation'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Los Santos' }) MERGE (source)-[:`visits` {`purpose`: 'expanding business'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Floyd' }) MERGE (source)-[:`moves in with` {`relation`: 'cousin\'s apartment'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'wife' }) MERGE (source)-[:`has dispute with` {`location`: 'house'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'television studio' }) MERGE (source)-[:`races to` {`purpose`: 'stopping audition'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'Trevor' }) MERGE (source)-[:`reminisces with` {`about`: 'old days'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'FIB' }) MERGE (source)-[:`does jobs for` {`compromise`: 'payback Madrazo'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'Ferdinand Kerimov' }) MERGE (source)-[:`kidnaps` {`purpose`: 'extracting information'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Ferdinand Kerimov' }) MERGE (source)-[:`tortures` {`purpose`: 'information extraction'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Ferdinand Kerimov' }) MERGE (source)-[:`lets go` {`action`: 'releasing'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'family' }) MERGE (source)-[:`moves out with` {`purpose`: 'peace and quiet'}]->(target);
MATCH (source { import_name: 'Franklin' }), (target { import_name: 'new house' }) MERGE (source)-[:`moves into` {`location`: 'the hills'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Merryweather Security' }) MERGE (source)-[:`scopes out` {`purpose`: 'stealing shipment'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Merryweather shipment' }) MERGE (source)-[:`steals` {`assistance`: 'Michael and Franklin'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Merryweather' }) MERGE (source)-[:`crosses paths with` {`consequence`: 'theft of armored car'}]->(target);
MATCH (source { import_name: 'Devin Weston' }), (target { import_name: 'large payout' }) MERGE (source)-[:`facilitates` {`for`: 'Michael and his crew'}]->(target);
MATCH (source { import_name: 'Devin Weston' }), (target { import_name: 'Solomon Richards' }) MERGE (source)-[:`puts in touch with` {`purpose`: 'making a movie'}]->(target);
MATCH (source { import_name: 'Devin Weston' }), (target { import_name: 'Franklin and Trevor' }) MERGE (source)-[:`tasks` {`purpose`: 'stealing sports cars'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Patricia' }) MERGE (source)-[:`kidnaps` {`action`: 'kidnapping'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Michael' }) MERGE (source)-[:`goes into hiding with` {`reason`: 'escaping from Madrazo'}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'merryweather' }) MERGE (source)-[:`steals from` {`event`: 'cargo plane hijacking'}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'plane' }) MERGE (source)-[:`bails out of` {`event`: 'plane shot down'}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'train robbery' }) MERGE (source)-[:`proposes` {`event`: 'planning the heist'}]->(target);
MATCH (source { import_name: 'michael' }), (target { import_name: 'peace offering' }) MERGE (source)-[:`suggests` {`event`: 'using ancient artifact'}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'union depository heist' }) MERGE (source)-[:`agrees to` {`event`: 'planning the heist'}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'floyd' }) MERGE (source)-[:`kills` {`event`: 'change of headquarters'}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'vanilla unicorn' }) MERGE (source)-[:`sets up shop in` {`event`: 'change of headquarters'}]->(target);
MATCH (source { import_name: 'michael' }), (target { import_name: 'truth about brad' }) MERGE (source)-[:`tells` {`event`: 'revealing the secret'}]->(target);
MATCH (source { import_name: 'michael' }), (target { import_name: 'film' }) MERGE (source)-[:`steals` {`event`: 'retaliation against Devin Weston'}]->(target);
MATCH (source { import_name: 'michael' }), (target { import_name: 'FIB headquarters raid' }) MERGE (source)-[:`pulls off` {`event`: 'successful heist'}]->(target);
MATCH (source { import_name: 'michael' }), (target { import_name: 'weston' }) MERGE (source)-[:`plans revenge on` {`event`: 'planning the revenge'}]->(target);
MATCH (source { import_name: 'franklin' }), (target { import_name: 'lamar' }) MERGE (source)-[:`rescues` {`event`: 'saving from kidnapping'}]->(target);
MATCH (source { import_name: 'franklin' }), (target { import_name: 'dave norton and steve haines' }) MERGE (source)-[:`confronted by` {`event`: 'confrontation'}]->(target);
MATCH (source { import_name: 'michael' }), (target { import_name: 'attackers' }) MERGE (source)-[:`fends off` {`event`: 'protecting family'}]->(target);
MATCH (source { import_name: 'franklin' }), (target { import_name: 'devin weston' }) MERGE (source)-[:`confronted by` {`event`: 'confrontation'}]->(target);
MATCH (source { import_name: 'franklin' }), (target { import_name: 'trevor' }) MERGE (source)-[:`chooses to kill` {`event`: 'decision'}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'gas tanker' }) MERGE (source)-[:`crashes into` {`event`: 'chase'}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'fire' }) MERGE (source)-[:`burns alive` {`event`: 'result of the chase'}]->(target);
MATCH (source { import_name: 'michael' }), (target { import_name: 'franklin' }) MERGE (source)-[:`parts ways with` {`event`: 'decision'}]->(target);
MATCH (source { import_name: 'Franklin' }), (target { import_name: 'Weston' }) MERGE (source)-[:`follows orders` {}]->(target);
MATCH (source { import_name: 'Franklin' }), (target { import_name: 'Michael' }) MERGE (source)-[:`kills` {}]->(target);
MATCH (source { import_name: 'Franklin' }), (target { import_name: 'Trevor' }) MERGE (source)-[:`reaches out to` {}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Michael' }) MERGE (source)-[:`expresses disinterest in meeting with` {`reason`: 'considering him a traitor'}]->(target);
MATCH (source { import_name: 'Franklin' }), (target { import_name: 'Michael' }) MERGE (source)-[:`chases` {}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'bridge' }) MERGE (source)-[:`falls to his death at` {}]->(target);
MATCH (source { import_name: 'Michael\'s family' }), (target { import_name: '{}' }) MERGE (source)-[:`expresses knowledge of Franklin\'s involvement in Michael\'s death` {}]->(target);
MATCH (source { import_name: 'Michael\'s widow' }), (target { import_name: 'Franklin' }) MERGE (source)-[:`messages` {`message`: 'stay away from her family'}]->(target);
MATCH (source { import_name: 'Jimmy' }), (target { import_name: 'Franklin' }) MERGE (source)-[:`curses out` {`reason`: 'betrayal'}]->(target);
MATCH (source { import_name: 'Franklin' }), (target { import_name: 'Lester' }) MERGE (source)-[:`goes to` {}]->(target);
MATCH (source { import_name: 'Lester' }), (target { import_name: 'Franklin' }) MERGE (source)-[:`helps` {}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Michael' }) MERGE (source)-[:`concocts a plan with` {}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'Ballas' }) MERGE (source)-[:`takes out the leader of` {}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Steve Haines' }) MERGE (source)-[:`kills` {}]->(target);
MATCH (source { import_name: 'Franklin' }), (target { import_name: 'Triads' }) MERGE (source)-[:`blows up the head of` {}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Merryweather\'s mercenaries' }) MERGE (source)-[:`fights through` {}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Devin Weston' }) MERGE (source)-[:`kidnaps` {}]->(target);
MATCH (source { import_name: 'Trio' }), (target { import_name: 'destroying the car and killing Weston' }) MERGE (source)-[:`stuff Weston in the back of his prized sports car and shove it off a cliff` {}]->(target);
MATCH (source { import_name: 'Dave Norton' }), (target { import_name: '{grateful: True}' }) MERGE (source)-[:`wipes clean their records` {`grateful`: 'true'}]->(target);
MATCH (source { import_name: 'Trio' }), (target { import_name: '{}' }) MERGE (source)-[:`agree to lay low for a while and remain friends` {}]->(target);