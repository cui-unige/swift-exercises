import Foundation // to use 'floor'

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

struct doubledStats {
    let hitpoints       : Double
    let attack          : Double
    let defense         : Double
    let special_attack  : Double
    let special_defense : Double
    let speed           : Double
}

let natureModifier: [Nature: doubledStats] = [
   .hardy: doubledStats(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:1, speed:1),
   .lonely: doubledStats(hitpoints:1, attack:1.1, defense:0.9, special_attack:1, special_defense:1, speed:1),
   .brave: doubledStats(hitpoints:1, attack:1.1, defense:1, special_attack:1, special_defense:1, speed:0.9),
   .adamant: doubledStats(hitpoints:1, attack:1.1, defense:1, special_attack:0.9, special_defense:1, speed:1),
   .naughty: doubledStats(hitpoints:1, attack:1.1, defense:1, special_attack:1, special_defense:0.9, speed:1),
   .bold: doubledStats(hitpoints:1, attack:0.9, defense:1.1, special_attack:1, special_defense:1, speed:1),
   .docile: doubledStats(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:1, speed:1),
   .relaxed: doubledStats(hitpoints:1, attack:1, defense:1.1, special_attack:1, special_defense:1, speed:0.9),
   .impish: doubledStats(hitpoints:1, attack:1, defense:1.1, special_attack:0.9, special_defense:1, speed:1),
   .lax: doubledStats(hitpoints:1, attack:1, defense:1.1, special_attack:1, special_defense:0.9, speed:1),
   .timid: doubledStats(hitpoints:1, attack:0.9, defense:1, special_attack:1, special_defense:1, speed:1.1),
   .hasty: doubledStats(hitpoints:1, attack:1, defense:0.9, special_attack:1, special_defense:1, speed:1.1),
   .serious: doubledStats(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:1, speed:1),
   .jolly: doubledStats(hitpoints:1, attack:1, defense:1, special_attack:0.9, special_defense:1, speed:1.1),
   .naive: doubledStats(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:0.9, speed:1.1),
   .modest: doubledStats(hitpoints:1, attack:0.9, defense:1, special_attack:1.1, special_defense:1, speed:1),
   .mild: doubledStats(hitpoints:1, attack:1, defense:0.9, special_attack:1.1, special_defense:1, speed:1),
   .quiet: doubledStats(hitpoints:1, attack:1, defense:1, special_attack:1.1, special_defense:1, speed:0.9),
   .bashful: doubledStats(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:1, speed:1),
   .rash: doubledStats(hitpoints:1, attack:1, defense:1, special_attack:1.1, special_defense:0.9, speed:1),
   .calm: doubledStats(hitpoints:1, attack:0.9, defense:1, special_attack:1, special_defense:1.1, speed:1),
   .gentle: doubledStats(hitpoints:1, attack:1, defense:0.9, special_attack:1, special_defense:1.1, speed:1),
   .sassy: doubledStats(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:1.1, speed:0.9),
   .careful: doubledStats(hitpoints:1, attack:1, defense:1, special_attack:0.9, special_defense:1.1, speed:1),
   .quirky: doubledStats(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:1, speed:1)
]

// TODO: create some species
// Do you use an enum, a map or constants/variables? constants
// http://bulbapedia.bulbagarden.net/wiki/List_of_Pokémon_by_National_Pokédex_number

// ---------------------------------------------------------------------------- SNORLAX ------------------------------------------------------------------
//                                                                               GenI
// 4 basic Moves of Snorlax (number of moves can later be increased)
let BodySlam = Move(id: 01,
                    name: "Body Slam",
                    description: "The user drops the target with its full body weight. This may also leave the target with paralysis.",
                    category: .physical,
                    type: .normal,
                    power: 85,
                    accuracy: 100,
                    powerpoints: 15,
                    priority: 1  )

let HyperBeam = Move(id: 02,
                     name: "Hyper Beam",
                     description: "The target is attacked with a powerfulbeam. The user can't move on the next turn.",
                     category: .special,
                     type: .normal,
                     power: 150,
                     accuracy: 90,
                     powerpoints: 5,
                     priority: 2)

let Earthquake = Move(id: 03,
                      name: "Earthquake",
                      description: "The user sets off an earthquake that strikes every Pokémon around it.",
                      category: .physical,
                      type: .ground,
                      power: 100,
                      accuracy: 100,
                      powerpoints: 10,
                      priority: 3)

let SelfDestruct = Move(id: 04,
                        name: "Self-Destruct",
                        description: "The user attacks everything around it by causing an explosion. The user faints upon this move.",
                        category: .physical,
                        type: .normal,
                        power: 200,
                        accuracy: 100,
                        powerpoints: 5,
                        priority: 4)

// Base values of Snorlax
let snorlax_baseValues = Stats(hitpoints: 160,
                               attack: 110,
                               defense: 65,
                               special_attack: 65,
                               special_defense: 110,
                               speed: 30)

// Effort values of Snorlax
let snorlax_effortValues = Stats(hitpoints: 2,
                                 attack: 0,
                                 defense: 0,
                                 special_attack: 0,
                                 special_defense: 0,
                                 speed: 0)

// Individual values of Snorlax (between 0 and 31)
let snorlax_individualValues = Stats(hitpoints:31,
                                     attack: 12,
                                     defense: 25,
                                     special_attack: 18,
                                     special_defense: 30,
                                     speed: 1)

//Creation of Snorlax
let snorlax_Species = Species(id: 143,
                      name: "Snorlax",
                      evolutions: [],
                      attacks: [BodySlam, HyperBeam, Earthquake, SelfDestruct],
                      type: (.normal, nil),
                    base_values: snorlax_baseValues)
// ------------------------------------------------------------------------- SNORLAX END ---------------------------------------------------------------------------

// function to calculate effective stats of HP
func setEffStatsHP(base: Int, iv: Int, ev: Int, level: Int) -> Int {
  return Int((Double((2*base + iv + ev/4 )*level)) / Double(100)) + level  + 10
}

// function to calculate effective stats of other stats
func setEffStats(base: Int, iv: Int, ev: Int, level: Int, nature: Double) -> Int {
  return Int(floor((Double((2*base + iv + ev)*level))/Double(100) + 5) * nature)
}

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
    var effective_stats   : Stats {
        get {
              let eff_attack = setEffStats(base: species.base_values.attack, iv: individual_values.attack, ev: effort_values.attack, level: level, nature: (natureModifier[nature]?.attack)!)
              let eff_hitpoints = setEffStatsHP(base: species.base_values.hitpoints, iv: individual_values.hitpoints, ev: effort_values.hitpoints, level: level)
              let eff_defense = setEffStats(base: species.base_values.attack, iv: individual_values.attack, ev: effort_values.attack, level: level, nature: (natureModifier[nature]?.defense)!)
              let eff_special_attack = setEffStats(base: species.base_values.attack, iv: individual_values.attack, ev: effort_values.attack, level: level, nature: (natureModifier[nature]?.special_attack)!)
              let eff_special_defense = setEffStats(base: species.base_values.attack, iv: individual_values.attack, ev: effort_values.attack, level: level, nature: (natureModifier[nature]?.special_defense)!)
              let eff_speed = setEffStats(base: species.base_values.attack, iv: individual_values.attack, ev: effort_values.attack, level: level, nature: (natureModifier[nature]?.speed)!)
              return Stats(hitpoints: eff_hitpoints, attack: eff_attack, defense: eff_defense, special_attack: eff_special_attack, special_defense: eff_special_defense, speed: eff_speed)
        }
    }
}

struct Trainer {
    let pokemons : [Pokemon]
}

struct Environment {
    let weather : Weather
    let terrain : Terrain
}

// type/type chart specified in the TODO of the function 'typeModifier' below
let type_modifier: [Type: [Type: Double]] = [
   .normal: [.normal:1, .fighting:1, .flying:1, .poison:1, .ground:1, .rock:0.5, .bug:1, .ghost:0, .steel:0.5, .fire:1, .water:1, .grass:1, .electric:1, .psychic:1, .ice:1, .dragon:1, .dark:1, .fairy:1],
   .fighting: [.normal:2, .fighting:1, .flying:0.5, .poison:0.5, .ground:1, .rock:2, .bug:0.5, .ghost:0, .steel:2, .fire:1, .water:1, .grass:1, .electric:1, .psychic:0.5, .ice:2, .dragon:1, .dark:2, .fairy:0.5],
   .flying: [.normal:1, .fighting:2, .flying:1, .poison:1, .ground:1, .rock:0.5, .bug:2, .ghost:1, .steel:0.5, .fire:1, .water:1, .grass:2, .electric:0.5, .psychic:1, .ice:1, .dragon:1, .dark:1, .fairy:1],
   .poison: [.normal:1, .fighting:1, .flying:1, .poison:0.5, .ground:0.5, .rock:0.5, .bug:1, .ghost:0.5, .steel:0, .fire:1, .water:1, .grass:2, .electric:1, .psychic:1, .ice:1, .dragon:1, .dark:1, .fairy:2],
   .ground: [.normal:1, .fighting:1, .flying:0, .poison:2, .ground:1, .rock:2, .bug:0.5, .ghost:1, .steel:2, .fire:2, .water:1, .grass:0.5, .electric:2, .psychic:1, .ice:1, .dragon:1, .dark:1, .fairy:1],
   .rock: [.normal:1, .fighting:0.5, .flying:2, .poison:1, .ground:0.5, .rock:1, .bug:2, .ghost:1, .steel:0.5, .fire:2, .water:1, .grass:1, .electric:1, .psychic:1, .ice:2, .dragon:1, .dark:1, .fairy:1],
   .bug: [.normal:1, .fighting:0.5, .flying:0.5, .poison:0.5, .ground:1, .rock:1, .bug:1, .ghost:0.5, .steel:0.5, .fire:0.5, .water:1, .grass:2, .electric:1, .psychic:2, .ice:1, .dragon:1, .dark:2, .fairy:0.5],
   .ghost: [.normal:0, .fighting:1, .flying:1, .poison:1, .ground:1, .rock:1, .bug:1, .ghost:2, .steel:1, .fire:1, .water:1, .grass:1, .electric:1, .psychic:2, .ice:1, .dragon:1, .dark:0.5, .fairy:1],
   .steel: [.normal:1, .fighting:1, .flying:1, .poison:1, .ground:1, .rock:2, .bug:1, .ghost:1, .steel:0.5, .fire:0.5, .water:0.5, .grass:1, .electric:0.5, .psychic:1, .ice:2, .dragon:1, .dark:1, .fairy:2],
   .fire: [.normal:1, .fighting:1, .flying:1, .poison:1, .ground:1, .rock:0.5, .bug:2, .ghost:1, .steel:2, .fire:0.5, .water:0.5, .grass:2, .electric:1, .psychic:1, .ice:2, .dragon:0.5, .dark:1, .fairy:1],
   .water: [.normal:1, .fighting:1, .flying:1, .poison:1, .ground:2, .rock:2, .bug:1, .ghost:1, .steel:1, .fire:2, .water:0.5, .grass:0.5, .electric:1, .psychic:1, .ice:1, .dragon:0.5, .dark:1, .fairy:1],
   .grass: [.normal:1, .fighting:1, .flying:0.5, .poison:0.5, .ground:2, .rock:2, .bug:0.5, .ghost:1, .steel:0.5, .fire:0.5, .water:2, .grass:0.5, .electric:1, .psychic:1, .ice:1, .dragon:0.5, .dark:1, .fairy:1],
   .electric: [.normal:1, .fighting:1, .flying:2, .poison:1, .ground:0, .rock:1, .bug:1, .ghost:1, .steel:1, .fire:1, .water:2, .grass:0.5, .electric:0.5, .psychic:1, .ice:1, .dragon:0.5, .dark:1, .fairy:1],
   .psychic: [.normal:1, .fighting:2, .flying:1, .poison:2, .ground:1, .rock:1, .bug:1, .ghost:1, .steel:0.5, .fire:1, .water:1, .grass:1, .electric:1, .psychic:0.5, .ice:1, .dragon:1, .dark:0, .fairy:1],
   .ice: [.normal:1, .fighting:1, .flying:2, .poison:1, .ground:2, .rock:1, .bug:1, .ghost:1, .steel:0.5, .fire:0.5, .water:0.5, .grass:2, .electric:1, .psychic:1, .ice:0.5, .dragon:2, .dark:1, .fairy:1],
   .dragon: [.normal:1, .fighting:1, .flying:1, .poison:1, .ground:1, .rock:1, .bug:1, .ghost:1, .steel:0.5, .fire:1, .water:1, .grass:1, .electric:1, .psychic:1, .ice:1, .dragon:2, .dark:1, .fairy:0],
   .dark: [.normal:1, .fighting:0.5, .flying:1, .poison:1, .ground:1, .rock:1, .bug:1, .ghost:2, .steel:1, .fire:1, .water:1, .grass:1, .electric:1, .psychic:2, .ice:1, .dragon:1, .dark:0.5, .fairy:0.5],
   .fairy: [.normal:1, .fighting:2, .flying:1, .poison:0.5, .ground:1, .rock:1, .bug:1, .ghost:1, .steel:0.5, .fire:0.5, .water:1, .grass:1, .electric:1, .psychic:1, .ice:1, .dragon:2, .dark:2, .fairy:1]
]

// http://bulbapedia.bulbagarden.net/wiki/Type/Type_chart
func typeModifier(attacking: Type, defending : Type) -> Double {
    // TODO: encode type/type chart
    return (type_modifier[attacking]?[defending])!
}

// http://bulbapedia.bulbagarden.net/wiki/Damage
func damage(environment : Environment, pokemon: Pokemon, move: Move, target: Pokemon) -> Int {
    // TODO

    // Damage = (((((2*level/5)+2)*power*attack/defense)/50)+2)*Modifier
    let attack = Double(move.category == .physical ? pokemon.effective_stats.attack : pokemon.effective_stats.special_attack)
    let defense = Double(move.category == .physical ? target.effective_stats.defense : target.effective_stats.special_defense)
    let pwr = Double(move.power)
    let lvl = pokemon.level
    // Modifier = target*weather*critical*random*STAB*type*other
    let Modifier: Double
      let trgt = 1.0 // 1 vs 1 (i'm a simple being i do the bare minimum ¯\_(￣∀￣)_/¯ )
      let other: Double = 1.0 // 1 in most cases, and a different multiplier when specific interactions of moves
      let STAB: Double // equal to 1.5 if the move's type matches any of the user's types, 1 if otherwise
          if move.type == pokemon.species.type.0 || move.type == pokemon.species.type.1 {
              STAB = 1.5
          } else {
              STAB = 1.0
          }
      let critical: Double
        let threshold_value = pokemon.species.base_values.speed / 2
        let rnd = random() % 256
        critical = rnd < threshold_value ? 2 : 1
      let rndm = Double((Int(random() % 38) + 217)/255)
      var weather = Double(move.power)
        switch environment.weather{
          case .rain:
              if move.type == .fire {
                weather = weather*0.5
              }
              if move.type == .water {
                weather = weather*1.5
              }
          case .harsh_sunlight:
              if move.type == .water {
                weather = weather*0.5
              }
              if move.type == .fire {
                weather = weather*1.5
              }
          default:
              weather = weather*1
          }
      let type_effectiveness: Double
        if let second_type = target.species.type.1 {
            type_effectiveness = typeModifier(attacking: move.type, defending: target.species.type.0)*typeModifier(attacking: move.type, defending: second_type)
        }
        else {
            type_effectiveness = typeModifier(attacking: move.type, defending: target.species.type.0)
        }

    Modifier =  trgt * weather * critical * rndm * STAB * type_effectiveness * other
    let dmg = Double(2*lvl+10) * pwr * attack / defense / 250
    let damage_value = Int((dmg + 2) * Modifier)
    return damage_value
}

struct State {
    // TODO: describe a battle state
    var environment: Environment

    let trainer1: Trainer
    var pokemon1: Pokemon
    var pokemon1_move: Move
    // 1v1
    let trainer2: Trainer
    var pokemon2: Pokemon
    var pokemon2_move: Move
}

func battle(trainers: inout [Trainer], behavior: (State, Trainer) -> Move) -> () {
    // TODO: simulate battle

    // 1. Create: trainers and pokemons
    // 2. Establish the environment
    // 3. 
}
