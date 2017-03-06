// For random numbers in linux:
import Glibc
import Foundation

// http://bulbapedia.bulbagarden.net/wiki/Type
enum Type: Int {
    case bug = 6
    case dark = 16
    case dragon = 15
    case electric = 12
    case fairy = 17
    case fighting = 1
    case fire = 9
    case flying = 2
    case ghost = 7
    case grass = 11
    case ground = 4
    case ice = 14
    case normal = 0
    case poison = 3
    case psychic = 13
    case rock = 5
    case steel = 8
    case water = 10
}

// http://bulbapedia.bulbagarden.net/wiki/Damage_category
enum Category {
    case physical
    case special
    case status
}

// http://bulbapedia.bulbagarden.net/wiki/Nature
enum Nature: Int {
    case hardy = 0
    case lonely = 1
    case brave = 2
    case adamant = 3
    case naughty = 4
    case bold = 5
    case docile = 6
    case relaxed = 7
    case impish = 8
    case lax = 9
    case timid = 10
    case hasty = 11
    case serious = 12
    case jolly = 13
    case naive = 14
    case modest = 15
    case mild = 16
    case quiet = 17
    case bashful = 18
    case rash = 19
    case calm = 20
    case gentle = 21
    case sassy = 22
    case careful = 23
    case quirky = 24
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

let earthquake: Move = Move(
    id: 89,
    name: "Earthquake",
    description: "Tough but useless vs. flying foes.",
    category: .physical,
    type: .ground,
    power: 100,
    accuracy: 100,
    powerpoints: 10,
    priority: 0
)

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

let hooh: Pokemon = Pokemon(
  nickname: "fuck pokemon",
  size: 3.8,
  weight: 199,
  level: 100,
  nature: .relaxed,
  species: Species(
    id: 253, name: "Ho-Oh", evolutions: [], attacks: [], type: (.fire, .flying), base_values: Stats(hitpoints: 106, attack: 130, defense: 90, special_attack: 110, special_defense: 154, speed: 90)
  ),
  moves: [:],
  individual_values: Stats(hitpoints: 15, attack: 21, defense: 23, special_attack: 12, special_defense: 26, speed: 24),
  effort_values: Stats(hitpoints: 66, attack: 100, defense: 60, special_attack: 30, special_defense: 75, speed: 90)
)



struct Pokemon {
    let nickname          : String?
    let size              : Double
    let weight            : Double
    let level             : Int
    var experience        : Int {
      return 4*level*level*level/45
    }
    let nature            : Nature
    let species           : Species
    let moves             : [Move: Int] // Move -> remaining powerpoints
    let individual_values : Stats
    let effort_values     : Stats

    // TODO: implement the effective stats as a computed property:
    // https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID259
    var effective_stats   : Stats {
      get {
        // attack, defence, special attack, special defense, speed
        let natureChart: [[Double]] = [[1.1, 0.9, 1, 1, 1],
                                  [1.1, 1, 1, 1, 0.9],
                                  [1.1, 1, 0.9, 1, 1],
                                  [1.1, 1, 1, 0.9, 1],
                                  [0.9, 1.1, 1, 1, 1],
                                  [1, 1, 1, 1, 1],
                                  [1, 1.1, 1, 1, 0.9],
                                  [1, 1.1, 0.9, 1, 1],
                                  [1, 1.1, 1, 0.9, 1],
                                  [0.9, 1.1, 1, 1, 1.1],
                                  [1, 0.9, 1, 1, 1.1],
                                  [1, 1, 1, 1, 1],
                                  [1, 1.1, 0.9, 1, 1.1],
                                  [1, 1.1, 1, 0.9, 1.1],
                                  [0.9, 1, 1.1, 1, 1],
                                  [1, 0.9, 1.1, 1, 1],
                                  [1, 1, 1.1, 1, 0.9],
                                  [1, 1, 1, 1, 1],
                                  [1, 1, 1.1, 0.9, 1],
                                  [0.9, 1, 1, 1.1, 1],
                                  [1, 0.9, 1, 1.1, 1],
                                  [1, 1, 1, 1.1, 0.9],
                                  [1, 1, 0.9, 1.1, 1],
                                  [1, 1, 1, 1, 1]]

        // ****************************** ASK 4 HALP CUZ IDK HOW TO TEST THIS SHIT AND WHETHER I HAVE TO USE SELF.

        // var to compute the different stats in multiple lines without declaring tons of temporary variables
        var hp = Int((2 * species.base_values.hitpoints + individual_values.hitpoints + Int(effort_values.hitpoints / 4) * level) / 100)
        hp = hp + level + 10;

        var att = Int((2 * species.base_values.attack + individual_values.attack + Int(effort_values.attack / 4) * level) / 100)
        att = Int(Double(att + 5) * natureChart[nature.rawValue][0])

        var def = Int((2 * species.base_values.defense + individual_values.defense + Int(effort_values.defense / 4) * level) / 100)
        def = Int(Double(def + 5) * natureChart[nature.rawValue][1])

        var satt = Int((2 * species.base_values.special_attack + individual_values.special_attack + Int(effort_values.special_attack / 4) * level) / 100)
        satt = Int(Double(satt + 5) * natureChart[nature.rawValue][2])

        var sdef = Int((2 * species.base_values.special_defense + individual_values.special_defense + Int(effort_values.special_defense / 4) * level) / 100)
        sdef = Int(Double(sdef + 5) * natureChart[nature.rawValue][3])

        var spe = Int((2 * species.base_values.speed + individual_values.speed + Int(effort_values.speed / 4) * level) / 100)
        spe = Int(Double(spe + 5) * natureChart[nature.rawValue][4])

        return Stats(hitpoints: hp, attack: att, defense: def, special_attack: satt, special_defense: sdef, speed: spe)
      }
    }
}

struct Trainer {
    let pokemons : [Pokemon]
    let human: Bool
}

struct Environment {
    let weather : Weather
    let terrain : Terrain
}

// http://bulbapedia.bulbagarden.net/wiki/Type/Type_chart
func typeModifier(attacking: Type, defending : Type) -> Double {
    let chart: [[Double]] = [[1, 	1, 	1, 	1, 	1, 	0.5, 	1, 	0, 	0.5, 	1, 	1, 	1, 	1, 	1, 	1, 	1, 	1, 	1,],
                            [2, 	1, 	0.5, 	0.5, 	1, 	2, 	0.5, 	0, 	2, 	1, 	1, 	1, 	1, 	0.5, 	2, 	1, 	2, 	0.5,],
                            [1, 	2, 	1, 	1, 	1, 	0.5, 	2, 	1, 	0.5, 	1, 	1, 	2, 	0.5, 	1, 	1, 	1, 	1, 	1,],
                            [1, 	1, 	1, 	0.5, 	0.5, 	0.5, 	1, 	0.5, 	0, 	1, 	1, 	2, 	1, 	1, 	1, 	1, 	1, 	2,],
                            [1, 	1, 	0, 	2, 	1, 	2, 	0.5, 	1, 	2, 	2, 	1, 	0.5, 	2, 	1, 	1, 	1, 	1, 	1,],
                            [1, 	0.5, 	2, 	1, 	0.5, 	1, 	2, 	1, 	0.5, 	2, 	1, 	1, 	1, 	1, 	2, 	1, 	1, 	1,],
                            [1, 	0.5, 	0.5, 	0.5, 	1, 	1, 	1, 	0.5, 	0.5, 	0.5, 	1, 	2, 	1, 	2, 	1, 	1, 	2, 	0.5,],
                            [0, 	1, 	1, 	1, 	1, 	1, 	1, 	2, 	1, 	1, 	1, 	1, 	1, 	2, 	1, 	1, 	0.5, 	1,],
                            [1, 	1, 	1, 	1, 	1, 	2, 	1, 	1, 	0.5, 	0.5, 	0.5, 	1, 	0.5, 	1, 	2, 	1, 	1, 	2,],
                            [1, 	1, 	1, 	1, 	1, 	0.5, 	2, 	1, 	2, 	0.5, 	0.5, 	2, 	1, 	1, 	2, 	0.5, 	1, 	1,],
                            [1, 	1, 	1, 	1, 	2, 	2, 	1, 	1, 	1, 	2, 	0.5, 	0.5, 	1, 	1, 	1, 	0.5, 	1, 	1,],
                            [1, 	1, 	0.5, 	0.5, 	2, 	2, 	0.5, 	1, 	0.5, 	0.5, 	2, 	0.5, 	1, 	1, 	1, 	0.5, 	1, 	1,],
                            [1, 	1, 	2, 	1, 	0, 	1, 	1, 	1, 	1, 	1, 	2, 	0.5, 	0.5, 	1, 	1, 	0.5, 	1, 	1,],
                            [1, 	2, 	1, 	2, 	1, 	1, 	1, 	1, 	0.5, 	1, 	1, 	1, 	1, 	0.5, 	1, 	1, 	0, 	1,],
                            [1, 	1, 	2, 	1, 	2, 	1, 	1, 	1, 	0.5, 	0.5, 	0.5, 	2, 	1, 	1, 	0.5, 	2, 	1, 	1,],
                            [1, 	1, 	1, 	1, 	1, 	1, 	1, 	1, 	0.5, 	1, 	1, 	1, 	1, 	1, 	1, 	2, 	1, 	0,],
                            [1, 	0.5, 	1, 	1, 	1, 	1, 	1, 	2, 	1, 	1, 	1, 	1, 	1, 	2, 	1, 	1, 	0.5, 	0.5,],
                            [1, 	2, 	1, 	0.5, 	1, 	1, 	1, 	1, 	0.5, 	0.5, 	1, 	1, 	1, 	1, 	1, 	2, 	2, 	1]]

    return chart[attacking.rawValue][defending.rawValue]
}

enum Action {
    case attack
    case change_pokemon
    case use_item
    case run
}

func trainer_choose_action(trainer: Trainer) -> Action {
    return .attack
}

// http://bulbapedia.bulbagarden.net/wiki/Damage
func damage(environment : Environment, pokemon: Pokemon, move: Move, target: Pokemon) -> Int {
    let pkmType = pokemon.species.type;
    let tarType = target.species.type;

    let targets: Double = 1 // won't be implemented... soon
    let weather: Double = 1
    let badge: Double = 1 // won't be implemented... son
    let critical: Double = Int(random() % 256) > (pokemon.species.base_values.speed / 2) ? 1.5 : 1
    let random_value: Double = (100 - Double(random() % 16)) / 100
    let stab: Double = (move.type == pkmType.0 || move.type == pkmType.1!) ? 1.5 : 1
    let type: Double = typeModifier(attacking: move.type, defending: tarType.0) * ((tarType.1 != nil) ? typeModifier(attacking: move.type, defending: tarType.1!) : 1)
    let burn: Double = 1
    let other: Double = 1

    let modifier: Double = targets * weather * badge * critical * random_value * stab * type * burn * other

    return 0
}

struct State {
    let environment: Environment
    let pokemon_fighting: [Pokemon]
    let active_trainer: Int // 0 if first player, 1 if second
    let on_going: Bool // do we need to initialize everything, or is it already done and pokemon are fighting
}

func select_pokemon(trainer: Trainer) -> Pokemon? {
    var selected: Pokemon? = nil;

    for pkm in trainer.pokemons {
        if pkm.effective_stats.hitpoints > 0 {
            selected = pkm;
            break;
        }
    }

    return selected
}

func battle_init(trainers: [Trainer]) -> State {
    let environment: Environment = Environment(weather: .clear_skies, terrain: .normal);
    let pkm: [Pokemon] = [select_pokemon(trainer: trainers[0])!, select_pokemon(trainer: trainers[1])!];

    return State(environment: environment, pokemon_fighting: pkm, active_trainer: 0, on_going: true)
}

func battle(trainers: inout [Trainer], behavior: (State, Trainer) -> Move) -> () {
    // TODO: simulate battle
}
