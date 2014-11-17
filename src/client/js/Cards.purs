module Cards(Card(..), cards, Faction(..)) where

data Faction = Choobar | Einar | Jacob | Jandar | Ullar | Utgar | Vydar

data Card = Card
  { name      :: String
  , isEnabled :: Boolean
  , faction   :: Faction
  }

cards :: [Card]
cards =
  [ Card { name: "Agent Carr",                  isEnabled: true,  faction: Vydar   }
  , Card { name: "Airborne Elite",              isEnabled: true,  faction: Jandar  }
  , Card { name: "Alastair MacDirk",            isEnabled: true,  faction: Jandar  }
  , Card { name: "Anubian Wolves",              isEnabled: true,  faction: Utgar   }
  , Card { name: "Aphotia",                     isEnabled: true,  faction: Choobar }
  , Card { name: "Arkmer",                      isEnabled: true,  faction: Ullar   }
  , Card { name: "Arrow Gruts",                 isEnabled: true,  faction: Utgar   }
  , Card { name: "Aubrien Archers",             isEnabled: true,  faction: Ullar   }
  , Card { name: "Basilisk",                    isEnabled: false, faction: Choobar }
  , Card { name: "Blade Gruts",                 isEnabled: true,  faction: Utgar   }
  , Card { name: "Blastatrons",                 isEnabled: true,  faction: Vydar   }
  , Card { name: "Braxas",                      isEnabled: true,  faction: Vydar   }
  , Card { name: "Brunak",                      isEnabled: true,  faction: Utgar   }
  , Card { name: "Chardris",                    isEnabled: true,  faction: Ullar   }
  , Card { name: "Charos",                      isEnabled: true,  faction: Ullar   }
  , Card { name: "Concan",                      isEnabled: true,  faction: Jandar  }
  , Card { name: "Crixus",                      isEnabled: true,  faction: Einar   }
  , Card { name: "Crucian",                     isEnabled: true,  faction: Choobar }
  , Card { name: "Deadeye Dan",                 isEnabled: true,  faction: Ullar   }
  , Card { name: "Deadwood",                    isEnabled: true,  faction: Choobar }
  , Card { name: "Deathstalkers",               isEnabled: true,  faction: Utgar   }
  , Card { name: "Deathwalker 7000",            isEnabled: true,  faction: Utgar   }
  , Card { name: "Deathwalker 8000",            isEnabled: true,  faction: Utgar   }
  , Card { name: "Deathwalker 9000",            isEnabled: true,  faction: Utgar   }
  , Card { name: "Dumutef Guard",               isEnabled: true,  faction: Utgar   }
  , Card { name: "Dund",                        isEnabled: true,  faction: Vydar   }
  , Card { name: "Elemental Golems",            isEnabled: true,  faction: Vydar   }
  , Card { name: "Elite Onyx Vipers",           isEnabled: true,  faction: Ullar   }
  , Card { name: "Emirroon",                    isEnabled: true,  faction: Ullar   }
  , Card { name: "Festus",                      isEnabled: true,  faction: Jacob   }
  , Card { name: "Finn",                        isEnabled: true,  faction: Jandar  }
  , Card { name: "Firefly",                     isEnabled: true,  faction: Ullar   }
  , Card { name: "Gladiatrons",                 isEnabled: true,  faction: Vydar   }
  , Card { name: "Gorillinators",               isEnabled: true,  faction: Vydar   }
  , Card { name: "Grimnak",                     isEnabled: true,  faction: Utgar   }
  , Card { name: "Grok Riders",                 isEnabled: true,  faction: Utgar   }
  , Card { name: "Guilty McCreech",             isEnabled: true,  faction: Einar   }
  , Card { name: "Izumi Samurai",               isEnabled: true,  faction: Einar   }
  , Card { name: "James Murphy",                isEnabled: true,  faction: Vydar   }
  , Card { name: "Johnny 'Shotgun' Sullivan",   isEnabled: true,  faction: Jandar  }
  , Card { name: "Jotun",                       isEnabled: true,  faction: Ullar   }
  , Card { name: "Kato Katsuro",                isEnabled: true,  faction: Einar   }
  , Card { name: "Kelda",                       isEnabled: true,  faction: Jandar  }
  , Card { name: "Kenku Sneak",                 isEnabled: true,  faction: Choobar }
  , Card { name: "Khosumet",                    isEnabled: true,  faction: Utgar   }
  , Card { name: "Knights of Weston",           isEnabled: true,  faction: Jandar  }
  , Card { name: "Kozuke Samurai",              isEnabled: true,  faction: Einar   }
  , Card { name: "Krav Maga Agents",            isEnabled: true,  faction: Vydar   }
  , Card { name: "Krug",                        isEnabled: true,  faction: Utgar   }
  , Card { name: "MacDirk Warriors",            isEnabled: true,  faction: Jandar  }
  , Card { name: "Major Q10",                   isEnabled: true,  faction: Vydar   }
  , Card { name: "Major Q9",                    isEnabled: true,  faction: Vydar   }
  , Card { name: "Major X17",                   isEnabled: true,  faction: Vydar   }
  , Card { name: "Marcus Decimus",              isEnabled: true,  faction: Einar   }
  , Card { name: "Marrden Hounds",              isEnabled: true,  faction: Utgar   }
  , Card { name: "Marrden Nagrubs",             isEnabled: true,  faction: Utgar   }
  , Card { name: "Marro Drones",                isEnabled: true,  faction: Utgar   }
  , Card { name: "Marro Drudge",                isEnabled: true,  faction: Utgar   }
  , Card { name: "Marro Hive",                  isEnabled: false, faction: Utgar   }
  , Card { name: "Marro Stingers",              isEnabled: true,  faction: Utgar   }
  , Card { name: "Marro Warriors",              isEnabled: true,  faction: Utgar   }
  , Card { name: "Me-Burq-Sa",                  isEnabled: true,  faction: Utgar   }
  , Card { name: "Microcorp Agents",            isEnabled: true,  faction: Vydar   }
  , Card { name: "Mimring",                     isEnabled: true,  faction: Utgar   }
  , Card { name: "Minions of Utgar",            isEnabled: true,  faction: Utgar   }
  , Card { name: "Minutemen",                   isEnabled: true,  faction: Jandar  }
  , Card { name: "Moriko",                      isEnabled: true,  faction: Ullar   }
  , Card { name: "Morsbane",                    isEnabled: true,  faction: Ullar   }
  , Card { name: "Nakita Agents",               isEnabled: true,  faction: Vydar   }
  , Card { name: "Nathril",                     isEnabled: true,  faction: Jacob   }
  , Card { name: "Ne-Gok-Sa",                   isEnabled: true,  faction: Utgar   }
  , Card { name: "Nilfheim",                    isEnabled: true,  faction: Jandar  }
  , Card { name: "Ninjas of the Northern Wind", isEnabled: true,  faction: Einar   }
  , Card { name: "Nixy",                        isEnabled: true,  faction: Jacob   }
  , Card { name: "Obsidian Guards",             isEnabled: true,  faction: Utgar   }
  , Card { name: "Omnicron Snipers",            isEnabled: true,  faction: Jandar  }
  , Card { name: "Otonashi",                    isEnabled: true,  faction: Vydar   }
  , Card { name: "Parmenio",                    isEnabled: true,  faction: Einar   }
  , Card { name: "Raelin, 1st Edition",         isEnabled: true,  faction: Jandar  }
  , Card { name: "Raelin, 2nd Edition",         isEnabled: true,  faction: Jandar  }
  , Card { name: "Rat Bastards",                isEnabled: true,  faction: Utgar   }
  , Card { name: "Red Coats",                   isEnabled: true,  faction: Einar   }
  , Card { name: "Retiarius",                   isEnabled: true,  faction: Einar   }
  , Card { name: "Roman Archers",               isEnabled: true,  faction: Einar   }
  , Card { name: "Roman Legionnaires",          isEnabled: true,  faction: Einar   }
  , Card { name: "Sacred Band",                 isEnabled: true,  faction: Einar   }
  , Card { name: "Saylind",                     isEnabled: true,  faction: Ullar   }
  , Card { name: "Sentinels of Jandar",         isEnabled: true,  faction: Jandar  }
  , Card { name: "Sgt. Drake, 1st Edition",     isEnabled: true,  faction: Jandar  }
  , Card { name: "Sgt. Drake, 2nd Edition",     isEnabled: true,  faction: Jandar  }
  , Card { name: "Shaolin Monks",               isEnabled: true,  faction: Ullar   }
  , Card { name: "Shiori",                      isEnabled: true,  faction: Einar   }
  , Card { name: "Sir Denrick",                 isEnabled: true,  faction: Jandar  }
  , Card { name: "Sir Dupuis",                  isEnabled: true,  faction: Jandar  }
  , Card { name: "Sonic Boom",                  isEnabled: false, faction: Choobar }
  , Card { name: "Sonlen",                      isEnabled: true,  faction: Ullar   }
  , Card { name: "Spartacus",                   isEnabled: true,  faction: Einar   }
  , Card { name: "Su-Bak-Na",                   isEnabled: true,  faction: Utgar   }
  , Card { name: "Sudema",                      isEnabled: true,  faction: Vydar   }
  , Card { name: "Swog Rider",                  isEnabled: true,  faction: Utgar   }
  , Card { name: "Syvarris",                    isEnabled: true,  faction: Ullar   }
  , Card { name: "Taelord",                     isEnabled: true,  faction: Utgar   }
  , Card { name: "Tagawa Samurai",              isEnabled: true,  faction: Einar   }
  , Card { name: "Tarn Viking Warriors",        isEnabled: true,  faction: Jandar  }
  , Card { name: "Templar Cavalry",             isEnabled: false, faction: Jandar  }
  , Card { name: "Theracus",                    isEnabled: true,  faction: Ullar   }
  , Card { name: "Thorgrim",                    isEnabled: true,  faction: Jandar  }
  , Card { name: "Tor-Kul-Na",                  isEnabled: false, faction: Utgar   }
  , Card { name: "Tornak",                      isEnabled: true,  faction: Utgar   }
  , Card { name: "Ulginesh",                    isEnabled: true,  faction: Ullar   }
  , Card { name: "Valguard",                    isEnabled: true,  faction: Einar   }
  , Card { name: "Venoc Devourers",             isEnabled: true,  faction: Ullar   }
  , Card { name: "Venoc Vipers",                isEnabled: true,  faction: Ullar   }
  , Card { name: "Venoc Warlord",               isEnabled: true,  faction: Ullar   }
  , Card { name: "Veshnir",                     isEnabled: true,  faction: Ullar   }
  , Card { name: "Warriors of Ashra",           isEnabled: true,  faction: Ullar   }
  , Card { name: "Wolves of Badru",             isEnabled: true,  faction: Utgar   }
  , Card { name: "Zettian Guards",              isEnabled: true,  faction: Utgar   }
  ]
