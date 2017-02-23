// For the 'floor' function
import Foundation

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
    var hitpoints       : Int
    var attack          : Int
    var defense         : Int
    var special_attack  : Int
    var special_defense : Int
    var speed           : Int
}

struct StatsModif {
    let hitpoints       : Double
    let attack          : Double
    let defense         : Double
    let special_attack  : Double
    let special_defense : Double
    let speed           : Double
}

// Collection to get stat modifiers based on nature
let nature_modifiers: [Nature: StatsModif] = [
   .hardy: StatsModif(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:1, speed:1),
   .lonely: StatsModif(hitpoints:1, attack:1.1, defense:0.9, special_attack:1, special_defense:1, speed:1),
   .brave: StatsModif(hitpoints:1, attack:1.1, defense:1, special_attack:1, special_defense:1, speed:0.9),
   .adamant: StatsModif(hitpoints:1, attack:1.1, defense:1, special_attack:0.9, special_defense:1, speed:1),
   .naughty: StatsModif(hitpoints:1, attack:1.1, defense:1, special_attack:1, special_defense:0.9, speed:1),
   .bold: StatsModif(hitpoints:1, attack:0.9, defense:1.1, special_attack:1, special_defense:1, speed:1),
   .docile: StatsModif(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:1, speed:1),
   .relaxed: StatsModif(hitpoints:1, attack:1, defense:1.1, special_attack:1, special_defense:1, speed:0.9),
   .impish: StatsModif(hitpoints:1, attack:1, defense:1.1, special_attack:0.9, special_defense:1, speed:1),
   .lax: StatsModif(hitpoints:1, attack:1, defense:1.1, special_attack:1, special_defense:0.9, speed:1),
   .timid: StatsModif(hitpoints:1, attack:0.9, defense:1, special_attack:1, special_defense:1, speed:1.1),
   .hasty: StatsModif(hitpoints:1, attack:1, defense:0.9, special_attack:1, special_defense:1, speed:1.1),
   .serious: StatsModif(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:1, speed:1),
   .jolly: StatsModif(hitpoints:1, attack:1, defense:1, special_attack:0.9, special_defense:1, speed:1.1),
   .naive: StatsModif(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:0.9, speed:1.1),
   .modest: StatsModif(hitpoints:1, attack:0.9, defense:1, special_attack:1.1, special_defense:1, speed:1),
   .mild: StatsModif(hitpoints:1, attack:1, defense:0.9, special_attack:1.1, special_defense:1, speed:1),
   .quiet: StatsModif(hitpoints:1, attack:1, defense:1, special_attack:1.1, special_defense:1, speed:0.9),
   .bashful: StatsModif(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:1, speed:1),
   .rash: StatsModif(hitpoints:1, attack:1, defense:1, special_attack:1.1, special_defense:0.9, speed:1),
   .calm: StatsModif(hitpoints:1, attack:0.9, defense:1, special_attack:1, special_defense:1.1, speed:1),
   .gentle: StatsModif(hitpoints:1, attack:1, defense:0.9, special_attack:1, special_defense:1.1, speed:1),
   .sassy: StatsModif(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:1.1, speed:0.9),
   .careful: StatsModif(hitpoints:1, attack:1, defense:1, special_attack:0.9, special_defense:1.1, speed:1),
   .quirky: StatsModif(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:1, speed:1)
]

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

// http://bulbapedia.bulbagarden.net/wiki/List_of_Pokémon_by_National_Pokédex_number
let move_tackle = Move(
   id: 738,
   name: "Tackle",
   description: "A Normal-type attack. Many Pokemons know this attack right from the start.",
   category: .physical,
   type: .normal,
   power: 40,
   accuracy: 100,
   powerpoints: 35,
   priority: 0
)

let move_vine_whip = Move(
   id: 606,
   name: "Vine Whip",
   description: "Inflicts damage on the target.",
   category: .physical,
   type: .grass,
   power: 45,
   accuracy: 100,
   powerpoints: 25,
   priority: 0
)

let species_venusaur = Species(
   id: 003,
   name: "Venusaur",
   evolutions: [],
   attacks: [move_tackle, move_vine_whip],
   type: (.grass, .poison),
   base_values: Stats(
      hitpoints: 80,
      attack: 82,
      defense: 83,
      special_attack: 100,
      special_defense: 100,
      speed: 80
   )
)

let species_ivysaur = Species(
   id: 002,
   name: "Ivysaur",
   evolutions: [species_venusaur],
   attacks: [move_tackle, move_vine_whip],
   type: (.grass, .poison),
   base_values: Stats(
      hitpoints: 60,
      attack: 62,
      defense: 63,
      special_attack: 80,
      special_defense: 80,
      speed: 60
   )
)

let species_bulbasaur = Species(
   id: 001,
   name: "Bulbasaur",
   evolutions: [species_ivysaur, species_venusaur],
   attacks: [move_tackle, move_vine_whip],
   type: (.grass, .poison),
   base_values: Stats(
      hitpoints: 45,
      attack: 49,
      defense: 49,
      special_attack: 65,
      special_defense: 65,
      speed: 45
   )
)

// Algorithm for effective stat computation
func effective_stat_set(lvl L: Int, base B: Int, individual I: Int, effort E: Int, nat_mod N: Double) -> Int {
   let temp1 = Double((2 * B + I + E) * L)
   let temp2 = floor(temp1 / Double(100) + 5) * N
   return Int(temp2)
}
func effective_HP_set(lvl L: Int, base B: Int, individual I: Int, effort E: Int) -> Int {
   let temp1 = Double((2 * B + I + E) * L)
   let temp2 = Int(temp1 / Double(100))
   return temp2 + L + 10
}

struct Pokemon {
    let nickname          : String?
    var hitpoints         : Int // remaining hitpoints
    let size              : Int
    let weight            : Int
    var experience        : Int
    var level             : Int
    let nature            : Nature
    let species           : Species
    var moves             : [Move: Int] // Move -> remaining powerpoints
    let individual_values : Stats
    var effort_values     : Stats
    var temp_modifiers    : Stats
    var effective_stats   : Stats {
      get {
         let HP = effective_HP_set(lvl: level, base: species.base_values.hitpoints, individual: individual_values.hitpoints, effort: effort_values.hitpoints) + temp_modifiers.hitpoints
         let att = effective_stat_set(lvl: level, base: species.base_values.attack, individual: individual_values.attack, effort: effort_values.attack, nat_mod: (nature_modifiers[nature]?.attack)!) + temp_modifiers.attack
         let def = effective_stat_set(lvl: level, base: species.base_values.defense, individual: individual_values.defense, effort: effort_values.defense, nat_mod: (nature_modifiers[nature]?.defense)!) + temp_modifiers.defense
         let spe_att = effective_stat_set(lvl: level, base: species.base_values.special_attack, individual: individual_values.special_attack, effort: effort_values.special_attack, nat_mod: (nature_modifiers[nature]?.special_attack)!) + temp_modifiers.special_attack
         let spe_def = effective_stat_set(lvl: level, base: species.base_values.special_defense, individual: individual_values.special_defense, effort: effort_values.special_defense, nat_mod: (nature_modifiers[nature]?.special_defense)!) + temp_modifiers.special_defense
         let spe = effective_stat_set(lvl: level, base: species.base_values.speed, individual: individual_values.speed, effort: effort_values.speed, nat_mod: (nature_modifiers[nature]?.speed)!) + temp_modifiers.speed
         return Stats(
            hitpoints: HP,
            attack: att,
            defense: def,
            special_attack: spe_att,
            special_defense: spe_def,
            speed: spe
         )
      }
      set(new_effective_stats){
         temp_modifiers.hitpoints = temp_modifiers.hitpoints + new_effective_stats.hitpoints - effective_stats.hitpoints
         temp_modifiers.attack = temp_modifiers.attack + new_effective_stats.attack - effective_stats.attack
         temp_modifiers.defense = temp_modifiers.defense + new_effective_stats.defense - effective_stats.defense
         temp_modifiers.special_attack = temp_modifiers.special_attack + new_effective_stats.special_attack - effective_stats.special_attack
         temp_modifiers.special_defense = temp_modifiers.special_defense + new_effective_stats.special_defense - effective_stats.special_defense
         temp_modifiers.speed = temp_modifiers.speed + new_effective_stats.speed - effective_stats.speed
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

// http://bulbapedia.bulbagarden.net/wiki/Type/Type_chart
let type_modifiers: [Type: [Type: Double]] = [
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

func typeModifier(attacking: Type, defending : Type) -> Double {
    return (type_modifiers[attacking]?[defending])!
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
