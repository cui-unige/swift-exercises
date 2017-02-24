// http://bulbapedia.bulbagarden.net/wiki/Type
enum Type {
    case bug
    case dark
    case dragon
    case electric
    case fairy
    case fighting
    case fire
    case flying
    case ghost
    case grass
    case ground
    case ice
    case normal
    case poison
    case psychic
    case rock
    case steel
    case water
}

// http://bulbapedia.bulbagarden.net/wiki/Damage_category
enum Category {
    case physical
    case special
    case status
}

// http://bulbapedia.bulbagarden.net/wiki/Nature
enum Nature {
    case hardy
    case lonely
    case brave
    case adamant
    case naughty
    case bold
    case docile
    case relaxed
    case impish
    case lax
    case timid
    case hasty
    case serious
    case jolly
    case naive
    case modest
    case mild
    case quiet
    case bashful
    case rash
    case calm
    case gentle
    case sassy
    case careful
    case quirky
}

// http://bulbapedia.bulbagarden.net/wiki/Weather
enum Weather {
    case clear_skies
    case harsh_sunlight (extremely: Bool)
    case rain (heavy : Bool)
    case sandstorm
    case hail (diamond_dust : Bool)
    case shadowy_aura
    case fog
    case mysterious_air_current
}

enum Terrain {
    case normal
    case electric
    case grassy
    case psychic
    case misty
}

// http://bulbapedia.bulbagarden.net/wiki/Move
struct Move : Hashable {
    let id          : Int
    let name        : String
    let description : String
    let category    : Category
    let type        : Type
    let power       : Int
    let accuracy    : Int
    let powerpoints : Int
    let priority    : Int

    var hashValue   : Int {
      return self.id
    }
}
func ==(lhs: Move, rhs: Move) -> Bool {
    return lhs.id == rhs.id
}

// http://bulbapedia.bulbagarden.net/wiki/Statistic
struct Stats {
    let hitpoints       : Int
    let attack          : Int
    let defense         : Int
    let special_attack  : Int
    let special_defense : Int
    let speed           : Int
}

struct Species : Hashable {
    let id          : Int
    let name        : String
    let evolutions  : Set<Species>
    let attacks     : Set<Move>
    let type        : (Type, Type?)
    let base_values : Stats
    var hashValue   : Int {
      return self.id
    }
}
func ==(lhs: Species, rhs: Species) -> Bool {
    return lhs.id == rhs.id
}

// TODO: create some species
// Do you use an enum, a map or constants/variables?
// http://bulbapedia.bulbagarden.net/wiki/List_of_Pokémon_by_National_Pokédex_number



struct Pokemon {
    let nickname          : String?
    let hitpoints         : Int // remaining hitpoints
    let size              : Int
    let weight            : Int
    let experience        : Int
    let level             : Int
    let nature            : Nature
    let species           : Species
    let moves             : [Move: Int] // Move -> remaining powerpoints
    let individual_values : Stats
    let effort_values     : Stats
    // TODO: implement the effective stats as a computed property:
    // https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID259
    // var effective_stats   : Stats {
    // }
}

struct Trainer {
    let pokemons : [Pokemon]
}

struct Environment {
    let weather : Weather
    let terrain : Terrain
}

// http://bulbapedia.bulbagarden.net/wiki/Type/Type_chart
func typeModifier(attacking: Type, defending : Type) -> Double {

    if attacking == normal {

        switch defending {

        case normal :
            return 1
        case fire :
            return 1
        case water :
            return 1
        case electric :
            return 1
        case grass :
            return 1
        case ice :
            return 1
        case fighting :
            return 1
        case poison :
            return 1
        case ground :
            return 1
        case flying :
            return 1
        case psychic :
            return 1
        case bug :
            return 1
        case rock :
            return 0.5
        case ghost :
            return 0
        case dragon :
            return 1
        case dark :
            return 1
        case steel :
            return 0.5
        case fairy :
            return 1
        default :
          print("Error in the defending type : type is not known");
          return nil;
        }

    } else if attacking == fire {

        switch defending {

        case normal :
            return 1
        case fire :
            return 0.5
        case water :
            return 0.5
        case electric :
            return 1
        case grass :
            return 2
        case ice :
            return 2
        case fighting :
            return 1
        case poison :
            return 1
        case ground :
            return 1
        case flying :
            return 1
        case psychic :
            return 1
        case bug :
            return 2
        case rock :
            return 0.5
        case ghost :
            return 1
        case dragon :
            return 0.5
        case dark :
            return 1
        case steel :
            return 2
        case fairy :
            return 1
        default :
          print("Error in the defending type : type is not known");
          return nil;
        }

    } else if attacking == water {

        switch defending {

        case normal :
            return 1
        case fire :
            return 2
        case water :
            return 0.5
        case electric :
            return 1
        case grass :
            return 0.5
        case ice :
            return 1
        case fighting :
            return 1
        case poison :
            return 1
        case ground :
            return 2
        case flying :
            return 1
        case psychic :
            return 1
        case bug :
            return 1
        case rock :
            return 2
        case ghost :
            return 1
        case dragon :
            return 0.5
        case dark :
            return 1
        case steel :
            return 1
        case fairy :
            return 1
        default :
          print("Error in the defending type : type is not known");
          return nil;
        }

    } else if attacking == electric {

        switch defending {

        case normal :
            return 1
        case fire :
            return 1
        case water :
            return 2
        case electric :
            return 0.5
        case grass :
            return 0.5
        case ice :
            return 1
        case fighting :
            return 1
        case poison :
            return 1
        case ground :
            return 0
        case flying :
            return 2
        case psychic :
            return 1
        case bug :
            return 1
        case rock :
            return 1
        case ghost :
            return 1
        case dragon :
            return 0.5
        case dark :
            return 1
        case steel :
            return 1
        case fairy :
            return 1
        default :
          print("Error in the defending type : type is not known");
          return nil;
        }

    } else if attacking == grass {

        switch defending {

        case normal :
            return 1
        case fire :
            return 0.5
        case water :
            return 2
        case electric :
            return 1
        case grass :
            return 0.5
        case ice :
            return 1
        case fighting :
            return 1
        case poison :
            return 0.5
        case ground :
            return 2
        case flying :
            return 0.5
        case psychic :
            return 1
        case bug :
            return 0.5
        case rock :
            return 2
        case ghost :
            return 1
        case dragon :
            return 0.5
        case dark :
            return 1
        case steel :
            return 0.5
        case fairy :
            return 1
        default :
          print("Error in the defending type : type is not known");
          return nil;
        }

    } else if attacking == ice {

        switch defending {

        case normal :
            return 1
        case fire :
            return 0.5
        case water :
            return 0.5
        case electric :
            return 1
        case grass :
            return 2
        case ice :
            return 0.5
        case fighting :
            return 1
        case poison :
            return 1
        case ground :
            return 2
        case flying :
            return 2
        case psychic :
            return 1
        case bug :
            return 1
        case rock :
            return 1
        case ghost :
            return 1
        case dragon :
            return 2
        case dark :
            return 1
        case steel :
            return 0.5
        case fairy :
            return 1
        default :
          print("Error in the defending type : type is not known");
          return nil;
        }

    } else if attacking == fighting {

        switch defending {

        case normal :
            return 2
        case fire :
            return 1
        case water :
            return 1
        case electric :
            return 1
        case grass :
            return 1
        case ice :
            return 2
        case fighting :
            return 1
        case poison :
            return 0.5
        case ground :
            return 1
        case flying :
            return 0.5
        case psychic :
            return 0.5
        case bug :
            return 0.5
        case rock :
            return 2
        case ghost :
            return 0
        case dragon :
            return 1
        case dark :
            return 2
        case steel :
            return 2
        case fairy :
            return 0.5
        default :
          print("Error in the defending type : type is not known");
          return nil;
        }

    } else if attacking == poison {

        switch defending {

        case normal :
            return 1
        case fire :
            return 1
        case water :
            return 1
        case electric :
            return 1
        case grass :
            return 2
        case ice :
            return 1
        case fighting :
            return 1
        case poison :
            return 0.5
        case ground :
            return 0.5
        case flying :
            return 1
        case psychic :
            return 1
        case bug :
            return 1
        case rock :
            return 0.5
        case ghost :
            return 0.5
        case dragon :
            return 1
        case dark :
            return 1
        case steel :
            return 0
        case fairy :
            return 2
        default :
          print("Error in the defending type : type is not known");
          return nil;
        }

    } else if attacking == ground {

        switch defending {

        case normal :
            return 1
        case fire :
            return 2
        case water :
            return 1
        case electric :
            return 2
        case grass :
            return 0.5
        case ice :
            return 1
        case fighting :
            return 1
        case poison :
            return 2
        case ground :
            return 1
        case flying :
            return 0
        case psychic :
            return 1
        case bug :
            return 0.5
        case rock :
            return 2
        case ghost :
            return 1
        case dragon :
            return 1
        case dark :
            return 1
        case steel :
            return 2
        case fairy :
            return 1
        default :
          print("Error in the defending type : type is not known");
          return nil;
        }

    } else if attacking == flying {

        switch defending {

        case normal :
            return 1
        case fire :
            return 1
        case water :
            return 1
        case electric :
            return 0.5
        case grass :
            return 2
        case ice :
            return 1
        case fighting :
            return 2
        case poison :
            return 1
        case ground :
            return 1
        case flying :
            return 1
        case psychic :
            return 1
        case bug :
            return 2
        case rock :
            return 0.5
        case ghost :
            return 1
        case dragon :
            return 1
        case dark :
            return 1
        case steel :
            return 0.5
        case fairy :
            return 1
        default :
          print("Error in the defending type : type is not known");
          return nil;
        }

    } else if attacking == psychic {

        switch defending {

        case normal :
            return 1
        case fire :
            return 1
        case water :
            return 1
        case electric :
            return 1
        case grass :
            return 1
        case ice :
            return 1
        case fighting :
            return 2
        case poison :
            return 2
        case ground :
            return 1
        case flying :
            return 1
        case psychic :
            return 0.5
        case bug :
            return 1
        case rock :
            return 1
        case ghost :
            return 1
        case dragon :
            return 1
        case dark :
            return 0
        case steel :
            return 0.5
        case fairy :
            return 1
        default :
          print("Error in the defending type : type is not known");
          return nil;
        }

    } else if attacking == bug {

        switch defending {

        case normal :
            return 1
        case fire :
            return 0.5
        case water :
            return 1
        case electric :
            return 1
        case grass :
            return 2
        case ice :
            return 1
        case fighting :
            return 0.5
        case poison :
            return 0.5
        case ground :
            return 1
        case flying :
            return 0.5
        case psychic :
            return 2
        case bug :
            return 1
        case rock :
            return 1
        case ghost :
            return 0.5
        case dragon :
            return 1
        case dark :
            return 2
        case steel :
            return 0.5
        case fairy :
            return 0.5
        default :
          print("Error in the defending type : type is not known");
          return nil;
        }

    } else if attacking == rock {

        switch defending {

        case normal :
            return 1
        case fire :
            return 2
        case water :
            return 1
        case electric :
            return 1
        case grass :
            return 1
        case ice :
            return 2
        case fighting :
            return 0.5
        case poison :
            return 1
        case ground :
            return 0.5
        case flying :
            return 2
        case psychic :
            return 1
        case bug :
            return 2
        case rock :
            return 1
        case ghost :
            return 1
        case dragon :
            return 1
        case dark :
            return 1
        case steel :
            return 0.5
        case fairy :
            return 1
        default :
          print("Error in the defending type : type is not known");
          return nil;
        }

    } else if attacking == ghost {

        switch defending {

        case normal :
            return 0
        case fire :
            return 1
        case water :
            return 1
        case electric :
            return 1
        case grass :
            return 1
        case ice :
            return 1
        case fighting :
            return 1
        case poison :
            return 1
        case ground :
            return 1
        case flying :
            return 1
        case psychic :
            return 2
        case bug :
            return 1
        case rock :
            return 1
        case ghost :
            return 2
        case dragon :
            return 1
        case dark :
            return 0.5
        case steel :
            return 1
        case fairy :
            return 1
        default :
          print("Error in the defending type : type is not known");
          return nil;
        }

    } else if attacking == dragon {

        switch defending {

        case normal :
            return 1
        case fire :
            return 1
        case water :
            return 1
        case electric :
            return 1
        case grass :
            return 1
        case ice :
            return 1
        case fighting :
            return 1
        case poison :
            return 1
        case ground :
            return 1
        case flying :
            return 1
        case psychic :
            return 1
        case bug :
            return 1
        case rock :
            return 1
        case ghost :
            return 1
        case dragon :
            return 2
        case dark :
            return 1
        case steel :
            return 0.5
        case fairy :
            return 0
        default :
          print("Error in the defending type : type is not known");
          return nil;
        }

    } else if attacking == dark {

        switch defending {

        case normal :
            return 1
        case fire :
            return 1
        case water :
            return 1
        case electric :
            return 1
        case grass :
            return 1
        case ice :
            return 1
        case fighting :
            return 0.5
        case poison :
            return 1
        case ground :
            return 1
        case flying :
            return 1
        case psychic :
            return 2
        case bug :
            return 1
        case rock :
            return 1
        case ghost :
            return 2
        case dragon :
            return 1
        case dark :
            return 0.5
        case steel :
            return 1
        case fairy :
            return 0.5
        default :
          print("Error in the defending type : type is not known");
          return nil;
        }

    } else if attacking == steel {

        switch defending {

        case normal :
            return 1
        case fire :
            return 0.5
        case water :
            return 0.5
        case electric :
            return 0.5
        case grass :
            return 1
        case ice :
            return 2
        case fighting :
            return 1
        case poison :
            return 1
        case ground :
            return 1
        case flying :
            return 1
        case psychic :
            return 1
        case bug :
            return 1
        case rock :
            return 2
        case ghost :
            return 1
        case dragon :
            return 1
        case dark :
            return 1
        case steel :
            return 0.5
        case fairy :
            return 2
        default :
          print("Error in the defending type : type is not known");
          return nil;
        }

    } else if attacking == fairy {

        switch defending {

        case normal :
            return 1
        case fire :
            return 0.5
        case water :
            return 1
        case electric :
            return 1
        case grass :
            return 1
        case ice :
            return 1
        case fighting :
            return 2
        case poison :
            return 0.5
        case ground :
            return 1
        case flying :
            return 1
        case psychic :
            return 1
        case bug :
            return 1
        case rock :
            return 1
        case ghost :
            return 1
        case dragon :
            return 2
        case dark :
            return 2
        case steel :
            return 0.5
        case fairy :
            return 1
        default :
          print("Error in the defending type : type is not known");
          return nil;
        }

    } else {

      print("Error in the attack type : type is not known");
      return nil;

    }
}

// http://bulbapedia.bulbagarden.net/wiki/Damage
func damage(environment : Environment, pokemon: Pokemon, move: Move, target: Pokemon) -> Int {
    // TODO
    return 0
}

struct State {
    // TODO: describe a battle state
}

func battle(trainers: inout [Trainer], behavior: (State, Trainer) -> Move) -> () {
    // TODO: simulate battle
}
