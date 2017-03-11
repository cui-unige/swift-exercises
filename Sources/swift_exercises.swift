// http://bulbapedia.bulbagarden.net/wiki/Type
import Foundation
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
let FireBlast = Move(id: 1, name: "Fire BLast", description: "30% chance to burn the target.", category: Category.special, type: Type.fire, power: 120, accuracy: 85, powerpoints: 5, priority: 0)
let BodySlam = Move(id: 2, name: "Roar", description: "30% chance to paralyze the target", category: Category.physical, type: Type.normal, power: 85, accuracy: 100, powerpoints: 15, priority: 0)
let HyperBeam = Move(id: 3, name: "Hyper Beam", description: "User cannot move next turn, unless opponent or Substitute was KOed.", category: Category.physical, type: Type.normal, power: 150, accuracy: 90, powerpoints: 5, priority: 0)
let Reflect = Move(id: 4, name: "Reflect", description: "Lowers the physical damage done to user.", category: Category.status, type: Type.psychic, power: 0, accuracy: 0, powerpoints: 20, priority: 0)
let stats = Stats(hitpoints: 90, attack: 110, defense: 80, special_attack: 80, special_defense: 80, speed: 95)

let attacks: Set = [FireBlast, BodySlam, HyperBeam, Reflect]
let arcanine = Species(id: 59, name: "Jack", evolutions: [], attacks: attacks, type: (Type.fire, nil), base_values: stats)

// Do you use an enum, a map or constants/variables?
// http://bulbapedia.bulbagarden.net/wiki/List_of_Pokémon_by_National_Pokédex_number



struct Stats_val {
    let hitpoints       : Double
    let attack          : Double
    let defense         : Double
    let special_attack  : Double
    let special_defense : Double
    let speed           : Double
}

let nature_coeff: [Nature: Stats_val] = [
    Nature.hardy: Stats_val(hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1, speed: 1),
    Nature.lonely: Stats_val(hitpoints: 1, attack: 1.1, defense: 0.9, special_attack: 1, special_defense: 1, speed: 1),
    Nature.brave: Stats_val(hitpoints: 1, attack: 1.1, defense: 1, special_attack: 1, special_defense: 1, speed: 0.9),
    Nature.adamant: Stats_val(hitpoints: 1, attack: 1.1, defense: 1, special_attack: 0.9, special_defense: 1, speed: 1),
    Nature.naughty: Stats_val(hitpoints: 1, attack: 1.1, defense: 1, special_attack: 1, special_defense: 0.9, speed: 1),
    Nature.bold: Stats_val(hitpoints: 1, attack: 0.9, defense: 1.1, special_attack: 1, special_defense: 1, speed: 1),
    Nature.docile: Stats_val(hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1, speed: 1),
    Nature.relaxed: Stats_val(hitpoints: 1, attack: 1, defense: 1.1, special_attack: 1, special_defense: 1, speed: 0.9),
    Nature.impish: Stats_val(hitpoints: 1, attack: 1, defense: 1.1, special_attack: 0.9, special_defense: 1, speed: 1),
    Nature.lax: Stats_val(hitpoints: 1, attack: 1, defense: 1.1, special_attack: 1, special_defense: 0.9, speed: 1),
    Nature.timid: Stats_val(hitpoints: 1, attack: 0.9, defense: 1, special_attack: 1, special_defense: 1, speed: 1.1),
    Nature.hasty: Stats_val(hitpoints: 1, attack: 1, defense: 0.9, special_attack: 1, special_defense: 1, speed: 1.1),
    Nature.serious: Stats_val(hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1, speed: 1),
    Nature.jolly: Stats_val(hitpoints: 1, attack: 1, defense: 1, special_attack: 0.9, special_defense: 1, speed: 1.1),
    Nature.naive: Stats_val(hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 0.9, speed: 1.1),
    Nature.modest: Stats_val(hitpoints: 1, attack: 0.9, defense: 1, special_attack: 1.1, special_defense: 1, speed: 1),
    Nature.mild: Stats_val(hitpoints: 1, attack: 1, defense: 0.9, special_attack: 1.1, special_defense: 1, speed: 1),
    Nature.quiet: Stats_val(hitpoints: 1, attack: 1, defense: 1, special_attack: 1.1, special_defense: 1, speed: 0.9),
    Nature.bashful: Stats_val(hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1, speed: 1),
    Nature.rash: Stats_val(hitpoints: 1, attack: 1, defense: 1, special_attack: 1.1, special_defense: 0.9, speed: 1),
    Nature.calm: Stats_val(hitpoints: 1, attack: 0.9, defense: 1, special_attack: 1, special_defense: 1.1, speed: 1),
    Nature.gentle: Stats_val(hitpoints: 1, attack: 1, defense: 0.9, special_attack: 1, special_defense: 1.1, speed: 1),
    Nature.sassy: Stats_val(hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1.1, speed: 0.9),
    Nature.careful: Stats_val(hitpoints: 1, attack: 1, defense: 1, special_attack: 0.9, special_defense: 1.1, speed: 1),
    Nature.quirky: Stats_val(hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1, speed: 1)
]
//Fonction servant à calculer les effective stats de façon à éviter l'erreur des calculs trop grands.
func eff_stat_HP(base: Int, IV: Int, EV: Int, Level: Int) -> Int {
  let E = Int(floor(Double(EV/4)))
  let num = 2*base + IV + E * Level
  let fraction = Int(floor(Double(num/100)))
  return fraction
}
func eff_stat_others(base: Int, IV: Int, EV: Int, Level: Int, Nature: Double) -> Int {
  let E = Int(floor(Double(EV/4)))
  let num = 2*base + IV + E * Level
  let fraction = Int(floor(Double(floor(Double(num/100))+5)*Nature))
  return fraction
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
    // https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID259
    var effective_stats   : Stats {
      get{
        let effective_HP: Int = eff_stat_HP(base: self.hitpoints,IV: individual_values.hitpoints,EV: effort_values.hitpoints,Level: self.level)+self.level+10
        let effective_attack: Int = eff_stat_others(base: self.species.base_values.attack, IV: self.individual_values.attack, EV: self.effort_values.attack, Level: self.level, Nature: (nature_coeff[nature]?.attack)!)
        let effective_defense: Int = eff_stat_others(base: self.species.base_values.defense, IV: self.individual_values.defense, EV: self.effort_values.defense, Level: self.level, Nature: (nature_coeff[nature]?.defense)!)
        let effective_special_attack: Int = eff_stat_others(base: self.species.base_values.special_attack, IV: self.individual_values.special_attack, EV: self.effort_values.special_attack, Level: self.level, Nature: (nature_coeff[nature]?.special_attack)!)
        let effective_special_defense: Int = eff_stat_others(base: self.species.base_values.special_defense, IV: self.individual_values.special_defense, EV: self.effort_values.special_defense, Level: self.level, Nature: (nature_coeff[nature]?.special_defense)!)
        let effective_speed: Int = eff_stat_others(base: self.species.base_values.speed, IV: self.individual_values.speed, EV: self.effort_values.speed, Level: self.level, Nature: (nature_coeff[nature]?.speed)!)
            return Stats(hitpoints: effective_HP, attack: effective_attack, defense: effective_defense, special_attack: effective_special_attack, special_defense: effective_special_defense, speed: effective_speed)
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

// http://bulbapedia.bulbagarden.net/wiki/Type/Type_chart
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
    // 2 entraineurs, 2 pokemons actifs,
}

func battle(trainers: inout [Trainer], behavior: (State, Trainer) -> Move) -> () {
    // TODO: simulate battle
}
