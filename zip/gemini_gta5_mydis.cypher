MERGE (:`Person` {import_name: 'michael_townley'  })
MERGE (:`Person` {import_name: 'Brad', `occupation`: 'bank robber', `Status`: 'Deceased', `name`: 'Brad'  })
MERGE (:`Person` {import_name: 'Trevor', `occupation`: 'criminal', `name`: 'Trevor', `Occupation`: 'Criminal', `Status`: 'Alive'  })
MERGE (:`Person` {import_name: 'Lester', `occupation`: 'criminal', `Occupation`: 'Hacker', `Status`: 'Alive', `name`: 'Lester'  })
MERGE (:`Person` {import_name: 'unnamed_getaway_driver', `occupation`: 'getaway driver for bank robbers'  })
MERGE (:`Organization` {import_name: 'fib', `type`: 'Federal Investigation Bureau', `name`: 'FIB'  })
MERGE (:`Person` {import_name: 'dave_norton', `occupation`: 'police officer', `name`: 'Dave Norton'  })
MERGE (:`Alias` {import_name: 'michael_de_santa', `real_name`: 'Michael Townley'  })
MERGE (:`Person` {import_name: 'lamar', `occupation`: 'gang banger'  })
MERGE (:`Person` {import_name: 'Franklin', `occupation`: 'criminal', `name`: 'Franklin', `Occupation`: 'Criminal', `Status`: 'Alive'  })
MERGE (:`Person` {import_name: 'simeon', `occupation`: 'car dealer'  })
MERGE (:`Person` {import_name: 'franklin\'s_aunt'  })
MERGE (:`Person` {import_name: 'jimmy', `relationship`: 'son of Michael De Santa'  })
MERGE (:`Company` {import_name: 'lifeinvader', `type`: 'social media platform'  })
MERGE (:`Person` {import_name: 'martin_madrazo', `occupation`: 'drug kingpin'  })
MERGE (:`Person` {import_name: 'madrazo\'s_mistress', `relationship`: 'mistress of Martin Madrazo'  })
MERGE (:`Person` {import_name: 'social_media_ceo', `occupation`: 'CEO of social media platform Lifeinvader'  })
MERGE (:`Car` {import_name: 'getaway_car'  })
MERGE (:`Boat` {import_name: 'michael\'s_boat'  })
MERGE (:`House` {import_name: 'michael\'s_house'  })
MERGE (:`House` {import_name: 'vinewood_hills_house', `owner`: 'madrazo\'s_mistress'  })
MERGE (:`Store` {import_name: 'jewelry_store', `type`: 'jewelry store'  })
MERGE (:`Location` {import_name: 'desert'  })
MERGE (:`Location` {import_name: 'Prison', `Type`: 'Correctional Facility'  })
MERGE (:`Person` {import_name: 'Michael', `name`: 'Michael', `occupation`: 'criminal', `Occupation`: 'Criminal', `Status`: 'Alive'  })
MERGE (:`Person` {import_name: 'johnny_klebitz', `name`: 'Johnny Klebitz', `occupation`: 'motorcycle gang leader'  })
MERGE (:`Organization` {import_name: 'wei_cheng_triad', `name`: 'Wei Cheng Triad'  })
MERGE (:`City` {import_name: 'los_santos', `name`: 'Los Santos'  })
MERGE (:`Person` {import_name: 'Madrazo', `name`: 'Madrazo', `occupation`: 'drug lord', `Status`: 'Alive'  })
MERGE (:`Person` {import_name: 'tracey', `name`: 'Tracey', `occupation`: 'aspiring actress'  })
MERGE (:`Show` {import_name: 'fame_or_shame', `name`: 'Fame or Shame'  })
MERGE (:`Person` {import_name: 'lazwlow_jones', `name`: 'Lazlow Jones', `occupation`: 'radio and television personality'  })
MERGE (:`Person` {import_name: 'Floyd', `name`: 'Floyd', `occupation`: 'longshoreman', `Occupation`: 'Criminal', `Status`: 'Deceased'  })
MERGE (:`Organization` {import_name: 'IAA', `name`: 'IAA', `Type`: 'Government Agency'  })
MERGE (:`Person` {import_name: 'ferdinand_kerimov', `name`: 'Ferdinand Kerimov', `occupation`: 'suspected terrorist'  })
MERGE (:`Person` {import_name: 'steve_haines', `name`: 'Steve Haines', `occupation`: 'criminal'  })
MERGE (:`Organization` {import_name: 'merryweather_security', `name`: 'Merryweather Security'  })
MERGE (:`Person` {import_name: 'devin_weston', `name`: 'Devin Weston', `occupation`: 'criminal'  })
MERGE (:`Person` {import_name: 'solomon_richards', `name`: 'Solomon Richards', `occupation`: 'Vinewood producer'  })
MERGE (:`Person` {import_name: 'Patricia', `name`: 'Patricia', `occupation`: 'Madrazo\'s wife', `Status`: 'Alive'  })
MERGE (:`Company` {import_name: 'Merryweather', `Type`: 'Military Company', `type`: 'mercenaries'  })
MERGE (:`Bank` {import_name: 'Union Depository'  })
MERGE (:`Character` {import_name: 'Steve Haines', `Occupation`: 'Corrupt Government Official', `Status`: 'Alive', `name`: 'Steve Haines'  })
MERGE (:`Character` {import_name: 'Dave Norton', `Occupation`: 'Corrupt Government Official', `Status`: 'Alive', `name`: 'Dave Norton'  })
MERGE (:`Character` {import_name: 'Solamon', `Occupation`: 'Film Producer', `Status`: 'Alive', `name`: 'Solomon'  })
MERGE (:`Character` {import_name: 'Devin Weston', `Occupation`: 'Businessman', `Status`: 'Alive', `name`: 'Devin Weston'  })
MERGE (:`Organization` {import_name: 'Triads', `Type`: 'Criminal Syndicate', `type`: 'gang'  })
MERGE (:`Organization` {import_name: 'Ballas', `Type`: 'Criminal Gang', `type`: 'gang'  })
MERGE (:`Organization` {import_name: 'Lost Santos Police Department', `Type`: 'Police Agency'  })
MERGE (:`Character` {import_name: 'Girlfriend', `Occupation`: 'Criminal', `Status`: 'Deceased', `name`: 'Girlfriend'  })
MERGE (:`Product` {import_name: 'Film', `Title`: 'Michael\'s Film'  })
MERGE (:`Money` {import_name: 'Insurance Payout'  })
MERGE (:`Process` {import_name: 'Production', `Type`: 'Film Production'  })
MERGE (:`Event` {import_name: 'Chase', `Type`: 'Car Chase'  })
MERGE (:`Event` {import_name: 'Accident', `Type`: 'Car Accident'  })
MERGE (:`Event` {import_name: 'Death', `Type`: 'Accidental Death'  })
MERGE (:`Emotion` {import_name: 'Revenge'  })
MERGE (:`Emotion` {import_name: 'Betrayal'  })
MERGE (:`Event` {import_name: 'Union Depository Heist', `Type`: 'Heist'  })
MERGE (:`Event` {import_name: 'Kidnap', `Type`: 'Kidnapping'  })
MERGE (:`Event` {import_name: 'Torture', `Type`: 'Torture'  })
MERGE (:`Event` {import_name: 'Rescue', `Type`: 'Rescue'  })
MERGE (:`Event` {import_name: 'Firefight', `Type`: 'Shootout'  })
MERGE (:`Agreement` {import_name: 'Truce', `Start`: 'Present', `End`: 'Present'  })
MERGE (:`Facility` {import_name: 'Grave', `Type`: 'Burial Site'  })
MERGE (:`Webpage` {import_name: 'Webpage', `url`: 'www.bob.com'  })
MERGE (:`Person` {import_name: 'weston', `occupation`: 'criminal'  })
MERGE (:`Person` {import_name: 'michael\'s_widow'  });
MATCH (source { import_name: 'michael_townley' }), (target { import_name: 'brad' }) MERGE (source)-[:`crew member` {}]->(target);
MATCH (source { import_name: 'michael_townley' }), (target { import_name: 'trevor' }) MERGE (source)-[:`crew member` {}]->(target);
MATCH (source { import_name: 'michael_townley' }), (target { import_name: 'lester' }) MERGE (source)-[:`crew member` {}]->(target);
MATCH (source { import_name: 'michael_townley' }), (target { import_name: 'unnamed_getaway_driver' }) MERGE (source)-[:`crew member` {}]->(target);
MATCH (source { import_name: 'michael_townley' }), (target { import_name: 'fib' }) MERGE (source)-[:`contact` {}]->(target);
MATCH (source { import_name: 'michael_townley' }), (target { import_name: 'dave_norton' }) MERGE (source)-[:`contact` {}]->(target);
MATCH (source { import_name: 'michael_townley' }), (target { import_name: 'michael_de_santa' }) MERGE (source)-[:`alias` {}]->(target);
MATCH (source { import_name: 'michael_de_santa' }), (target { import_name: 'jimmy' }) MERGE (source)-[:`son` {}]->(target);
MATCH (source { import_name: 'michael_de_santa' }), (target { import_name: 'unknown' }) MERGE (source)-[:`wife` {}]->(target);
MATCH (source { import_name: 'lamar' }), (target { import_name: 'franklin' }) MERGE (source)-[:`colleague` {}]->(target);
MATCH (source { import_name: 'lamar' }), (target { import_name: 'simeon' }) MERGE (source)-[:`boss` {}]->(target);
MATCH (source { import_name: 'franklin' }), (target { import_name: 'franklin\'s_aunt' }) MERGE (source)-[:`aunt` {}]->(target);
MATCH (source { import_name: 'franklin' }), (target { import_name: 'michael_de_santa' }) MERGE (source)-[:`friend` {}]->(target);
MATCH (source { import_name: 'jimmy' }), (target { import_name: 'michael_townley' }) MERGE (source)-[:`father` {}]->(target);
MATCH (source { import_name: 'jimmy' }), (target { import_name: 'franklin' }) MERGE (source)-[:`friend` {}]->(target);
MATCH (source { import_name: 'michael_de_santa' }), (target { import_name: 'unknown' }) MERGE (source)-[:`tennis instructor` {}]->(target);
MATCH (source { import_name: 'michael_de_santa' }), (target { import_name: 'franklin' }) MERGE (source)-[:`crew member` {}]->(target);
MATCH (source { import_name: 'madrazo\'s_mistress' }), (target { import_name: 'martin_madrazo' }) MERGE (source)-[:`lover` {}]->(target);
MATCH (source { import_name: 'michael_de_santa' }), (target { import_name: 'lester' }) MERGE (source)-[:`contact` {}]->(target);
MATCH (source { import_name: 'lifeinvader' }), (target { import_name: 'social_media_ceo' }) MERGE (source)-[:`ceo` {}]->(target);
MATCH (source { import_name: 'michael_de_santa' }), (target { import_name: 'martin_madrazo' }) MERGE (source)-[:`enemy` {}]->(target);
MATCH (source { import_name: 'michael_de_santa' }), (target { import_name: 'trevor' }) MERGE (source)-[:`enemy` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'brad' }) MERGE (source)-[:`friend` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'dave_norton' }) MERGE (source)-[:`contact` {}]->(target);
MATCH (source { import_name: 'getaway_car' }), (target { import_name: 'michael_townley' }) MERGE (source)-[:`owner` {}]->(target);
MATCH (source { import_name: 'michael\'s_boat' }), (target { import_name: 'michael_townley' }) MERGE (source)-[:`owner` {}]->(target);
MATCH (source { import_name: 'michael\'s_house' }), (target { import_name: 'michael_de_santa' }) MERGE (source)-[:`resident` {}]->(target);
MATCH (source { import_name: 'vinewood_hills_house' }), (target { import_name: 'madrazo\'s_mistress' }) MERGE (source)-[:`owner` {}]->(target);
MATCH (source { import_name: 'jewelry_store' }), (target { import_name: 'jewelry_heist' }) MERGE (source)-[:`location` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'desert' }) MERGE (source)-[:`location` {}]->(target);
MATCH (source { import_name: 'brad' }), (target { import_name: 'prison' }) MERGE (source)-[:`location` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'johnny_klebitz\'s_gang_destruction' }) MERGE (source)-[:`involved in` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'wei_cheng_triad_turf_war' }) MERGE (source)-[:`involved in` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'los_santos' }) MERGE (source)-[:`moves to` {`date`: 'unknown'}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'michael\'s_life' }) MERGE (source)-[:`finds out about` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'michael\'s_house' }) MERGE (source)-[:`arrives at` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'tracey\'s_audition_halt' }) MERGE (source)-[:`involved in` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'lazwlow_jones_chase' }) MERGE (source)-[:`involved in` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'old days' }) MERGE (source)-[:`reminisces about` {`with`: 'michael'}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'stay in touch' }) MERGE (source)-[:`agrees to` {`with`: 'michael'}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'floyd\'s_apartment' }) MERGE (source)-[:`moves into` {`with`: 'wade'}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'business ventures' }) MERGE (source)-[:`expands` {`to`: 'los_santos'}]->(target);
MATCH (source { import_name: 'fib' }), (target { import_name: 'michael\'s_return to crime' }) MERGE (source)-[:`not pleased with` {}]->(target);
MATCH (source { import_name: 'dave_norton' }), (target { import_name: 'michael' }) MERGE (source)-[:`tells` {`to do`: 'FIB jobs'}]->(target);
MATCH (source { import_name: 'michael' }), (target { import_name: 'FIB job' }) MERGE (source)-[:`sent on` {`description`: 'posing as corpse and stealing information'}]->(target);
MATCH (source { import_name: 'michael' }), (target { import_name: 'ferdinand_kerimov\'s_kidnap' }) MERGE (source)-[:`involved in` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'ferdinand_kerimov' }) MERGE (source)-[:`tortures` {`for`: 'information'}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'kill' }) MERGE (source)-[:`ordered to` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'ferdinand_kerimov' }) MERGE (source)-[:`lets go free` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'merryweather_shipment_theft' }) MERGE (source)-[:`involved in` {`with`: 'michael and franklin'}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'returning merryweather_device' }) MERGE (source)-[:`dismayed by` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'return merryweather_device' }) MERGE (source)-[:`agrees to` {`when`: 'michael promises bigger jobs'}]->(target);
MATCH (source { import_name: 'gang' }), (target { import_name: 'devin_weston' }) MERGE (source)-[:`in touch with` {}]->(target);
MATCH (source { import_name: 'devin_weston' }), (target { import_name: 'large payout' }) MERGE (source)-[:`facilitates` {`for`: 'michael and crew'}]->(target);
MATCH (source { import_name: 'devin_weston' }), (target { import_name: 'solomon_richards' }) MERGE (source)-[:`puts michael in touch with` {}]->(target);
MATCH (source { import_name: 'devin_weston' }), (target { import_name: 'franklin and trevor with' }) MERGE (source)-[:`tasks` {}]->(target);
MATCH (source { import_name: 'michael and trevor' }), (target { import_name: 'working for madrazo again' }) MERGE (source)-[:`contacted about` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'madrazo\'s treatment of patricia' }) MERGE (source)-[:`sees` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'patricia' }) MERGE (source)-[:`kidnaps` {}]->(target);
MATCH (source { import_name: 'trevor and michael' }), (target { import_name: '{by: madrazo}' }) MERGE (source)-[:`sent into hiding` {`by`: 'madrazo'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Merryweather' }) MERGE (source)-[:`robs` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Plane' }) MERGE (source)-[:`jumps out of` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Union Depository Heist' }) MERGE (source)-[:`proposes` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Madrazo' }) MERGE (source)-[:`threatens` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Madrazo' }), (target { import_name: 'Ancient Artifact' }) MERGE (source)-[:`collects` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'Trevor' }) MERGE (source)-[:`helps` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Floyd' }) MERGE (source)-[:`kills` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Girlfriend' }) MERGE (source)-[:`kills` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'Los Santos' }) MERGE (source)-[:`settles` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Truth' }) MERGE (source)-[:`learns` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'Trevor' }) MERGE (source)-[:`follows` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'Grave' }) MERGE (source)-[:`finds` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'Trevor' }) MERGE (source)-[:`pulls gun` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'Triads' }) MERGE (source)-[:`is kidnapped` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Franklin' }), (target { import_name: 'Michael' }) MERGE (source)-[:`rescues` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'Dave Norton' }) MERGE (source)-[:`is given mission` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'Devin Weston\'s decision' }) MERGE (source)-[:`learns` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'Film' }) MERGE (source)-[:`steals` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'FIB headquarters heist' }) MERGE (source)-[:`plans` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'Merryweather\'s plan' }) MERGE (source)-[:`finds out` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Trevor' }), (target { import_name: 'Lamar' }) MERGE (source)-[:`rescues` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Dave Norton' }), (target { import_name: 'Franklin' }) MERGE (source)-[:`tells` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'Movie' }) MERGE (source)-[:`releases` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Merryweather' }), (target { import_name: 'Michael\'s family' }) MERGE (source)-[:`attacks` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'Devin Weston' }) MERGE (source)-[:`avenges` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Devin Weston' }), (target { import_name: 'Merryweather' }) MERGE (source)-[:`hires` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Franklin' }), (target { import_name: 'Devin Weston' }) MERGE (source)-[:`finds` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Devin Weston' }), (target { import_name: 'Franklin' }) MERGE (source)-[:`tells` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Franklin' }), (target { import_name: 'Lamar' }) MERGE (source)-[:`rescues` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Dave Norton' }), (target { import_name: 'Franklin' }) MERGE (source)-[:`tells` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'Movie' }) MERGE (source)-[:`releases` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Merryweather' }), (target { import_name: 'Michael\'s family' }) MERGE (source)-[:`attacks` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Michael' }), (target { import_name: 'Devin Weston' }) MERGE (source)-[:`avenges` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Devin Weston' }), (target { import_name: 'Merryweather' }) MERGE (source)-[:`hires` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Franklin' }), (target { import_name: 'Devin Weston' }) MERGE (source)-[:`finds` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'Devin Weston' }), (target { import_name: 'Franklin' }) MERGE (source)-[:`tells` {`Date`: 'Before Story'}]->(target);
MATCH (source { import_name: 'franklin' }), (target { import_name: 'weston' }) MERGE (source)-[:`follows_orders` {}]->(target);
MATCH (source { import_name: 'franklin' }), (target { import_name: 'trevor' }) MERGE (source)-[:`attempts_to_reach_out` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'michael' }) MERGE (source)-[:`expresses_disinterest` {}]->(target);
MATCH (source { import_name: 'michael' }), (target { import_name: 'trevor' }) MERGE (source)-[:`is_considered_a_traitor` {}]->(target);
MATCH (source { import_name: 'franklin' }), (target { import_name: 'michael' }) MERGE (source)-[:`chases` {}]->(target);
MATCH (source { import_name: 'michael\'s_widow' }), (target { import_name: 'franklin' }) MERGE (source)-[:`expresses_knowledge` {}]->(target);
MATCH (source { import_name: 'michael\'s_widow' }), (target { import_name: 'franklin' }) MERGE (source)-[:`messages` {}]->(target);
MATCH (source { import_name: 'jimmy' }), (target { import_name: 'franklin' }) MERGE (source)-[:`curses` {}]->(target);
MATCH (source { import_name: 'franklin' }), (target { import_name: 'lester' }) MERGE (source)-[:`goes_to` {}]->(target);
MATCH (source { import_name: 'lester' }), (target { import_name: 'franklin' }) MERGE (source)-[:`helps` {}]->(target);
MATCH (source { import_name: 'franklin' }), (target { import_name: 'michael' }) MERGE (source)-[:`concocts_plan` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'michael' }) MERGE (source)-[:`concocts_plan` {}]->(target);
MATCH (source { import_name: 'michael' }), (target { import_name: 'ballas' }) MERGE (source)-[:`takes_out` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'steve_haines' }) MERGE (source)-[:`kills` {}]->(target);
MATCH (source { import_name: 'franklin' }), (target { import_name: 'triads' }) MERGE (source)-[:`blows_up` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'merryweather' }) MERGE (source)-[:`fights` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'devin_weston' }) MERGE (source)-[:`kidnaps` {}]->(target);
MATCH (source { import_name: 'franklin' }), (target { import_name: 'devin_weston' }) MERGE (source)-[:`stuffs` {}]->(target);
MATCH (source { import_name: 'michael' }), (target { import_name: 'devin_weston' }) MERGE (source)-[:`stuffs` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'devin_weston' }) MERGE (source)-[:`shoves_car_off_cliff` {}]->(target);
MATCH (source { import_name: 'dave_norton' }), (target { import_name: 'franklin' }) MERGE (source)-[:`wipes_records` {}]->(target);
MATCH (source { import_name: 'dave_norton' }), (target { import_name: 'michael' }) MERGE (source)-[:`wipes_records` {}]->(target);
MATCH (source { import_name: 'dave_norton' }), (target { import_name: 'trevor' }) MERGE (source)-[:`wipes_records` {}]->(target);
MATCH (source { import_name: 'franklin' }), (target { import_name: 'michael' }) MERGE (source)-[:`agrees_to_lay_low` {}]->(target);
MATCH (source { import_name: 'franklin' }), (target { import_name: 'trevor' }) MERGE (source)-[:`agrees_to_lay_low` {}]->(target);
MATCH (source { import_name: 'michael' }), (target { import_name: 'franklin' }) MERGE (source)-[:`agrees_to_lay_low` {}]->(target);
MATCH (source { import_name: 'michael' }), (target { import_name: 'trevor' }) MERGE (source)-[:`agrees_to_lay_low` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'michael' }) MERGE (source)-[:`agrees_to_lay_low` {}]->(target);
MATCH (source { import_name: 'trevor' }), (target { import_name: 'franklin' }) MERGE (source)-[:`agrees_to_lay_low` {}]->(target);