// For the 'floor' function
import Foundation


/******************************************************************************/
/************************ Basic types and information *************************/
/******************************************************************************/
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

enum Gender {
   case male
   case female
   case genderless // We're open-minded
}

struct Item {
   let id: Int
   let name: String
   let effect: String // String type is a placeholder, this would ultimately need to link to a function, or something to determine the effects in regard to the program
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

enum StatusEffect {
   case burn
   case freeze
   case paralysis
   case poison
   case sleep
   case confusion
   case curse
   case attract
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


/******************************************************************************/
/******************** Example inputs of moves and species *********************/
/******************************************************************************/
// http://bulbapedia.bulbagarden.net/wiki/List_of_Pokémon_by_National_Pokédex_number
let move_struggle = Move(
   id: 000,
   name: "Struggle",
   description: "Used only if the user runs totally out of PP. The user is hit with 1/4 of the damage it inflicts.",
   category: .physical,
   type: .normal,
   power: 50,
   accuracy: 100,
   powerpoints: 1,
   priority: 0
)

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


/******************************************************************************/
/************************ Stats model and computation *************************/
/******************************************************************************/
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
    let gender            : Gender
    var experience        : Int
    var level             : Int
    let nature            : Nature
    let species           : Species
    var moves             : [Move: Int] // Move -> remaining powerpoints
    var effects           : [StatusEffect]
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
    var pokemons : [Pokemon]
    var backpack: [Item]
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


/******************************************************************************/
/********************** Functions for additional effects **********************/
/******************************************************************************/
func heal(trainer: inout Trainer, pokeIndex: Int, healStrength: Int){
   if Array(trainer.pokemons)[pokeIndex].hitpoints + healStrength > Array(trainer.pokemons)[pokeIndex].effective_stats.hitpoints {
      trainer.pokemons[pokeIndex].hitpoints = trainer.pokemons[pokeIndex].effective_stats.hitpoints
   } else {
      trainer.pokemons[pokeIndex].hitpoints += healStrength
   }
}

func full_heal(trainer: inout Trainer, pokeIndex: Int, healStrength: Int) {
   trainer.pokemons[pokeIndex].hitpoints += healStrength
}

func heal_burn(trainer: inout Trainer, pokeIndex: Int) {
   if trainer.pokemons[pokeIndex].effects.contains(.burn) {
       trainer.pokemons[pokeIndex].effective_stats.attack *= 2
       trainer.pokemons[pokeIndex].effects = trainer.pokemons[pokeIndex].effects.filter{$0 != .burn}
   } else {
      // Display removal failure (no effect to remove)
      return
   }
}

func heal_freeze(trainer: inout Trainer, pokeIndex: Int) {
   if trainer.pokemons[pokeIndex].effects.contains(.freeze) {
       trainer.pokemons[pokeIndex].effects = trainer.pokemons[pokeIndex].effects.filter{$0 != .freeze}
   } else {
      // Display removal failure (no effect to remove)
      return
   }
}

func heal_paralysis(trainer: inout Trainer, pokeIndex: Int) {
   if trainer.pokemons[pokeIndex].effects.contains(.paralysis) {
       trainer.pokemons[pokeIndex].effective_stats.speed += Int(0.25 * Double(trainer.pokemons[pokeIndex].effective_stats.speed - trainer.pokemons[pokeIndex].temp_modifiers.speed))
       trainer.pokemons[pokeIndex].effects = trainer.pokemons[pokeIndex].effects.filter{$0 != .paralysis}
   } else {
      // Display removal failure (no effect to remove)
      return
   }
}

func heal_poison(trainer: inout Trainer, pokeIndex: Int) {
   if trainer.pokemons[pokeIndex].effects.contains(.poison) {
       trainer.pokemons[pokeIndex].effects = trainer.pokemons[pokeIndex].effects.filter{$0 != .poison}
   } else {
      // Display removal failure (no effect to remove)
      return
   }
}

func heal_sleep(trainer: inout Trainer, pokeIndex: Int) {
   if trainer.pokemons[pokeIndex].effects.contains(.sleep) {
       trainer.pokemons[pokeIndex].effects = trainer.pokemons[pokeIndex].effects.filter{$0 != .sleep}
   } else {
      // Display removal failure (no effect to remove)
      return
   }
}

func heal_attract(trainer: inout Trainer, pokeIndex: Int) {
   if trainer.pokemons[pokeIndex].effects.contains(.attract) {
       trainer.pokemons[pokeIndex].effects = trainer.pokemons[pokeIndex].effects.filter{$0 != .attract}
   } else {
      // Display removal failure (no effect to remove)
      return
   }
}

func heal_confusion(trainer: inout Trainer, pokeIndex: Int) {
   if trainer.pokemons[pokeIndex].effects.contains(.confusion) {
       trainer.pokemons[pokeIndex].effects = trainer.pokemons[pokeIndex].effects.filter{$0 != .confusion}
   } else {
      // Display removal failure (no effect to remove)
      return
   }
}

func heal_curse(trainer: inout Trainer, pokeIndex: Int) {
   if trainer.pokemons[pokeIndex].effects.contains(.curse) {
       trainer.pokemons[pokeIndex].effects = trainer.pokemons[pokeIndex].effects.filter{$0 != .curse}
   } else {
      // Display removal failure (no effect to remove)
      return
   }
}


/******************************************************************************/
/***************** Functions and structs for battle handling ******************/
/******************************************************************************/
// http://bulbapedia.bulbagarden.net/wiki/Damage
func damage(environment : Environment, pokemon: Pokemon, move: Move, target: Pokemon) -> Int {
   let att = Double(move.category == .physical ? pokemon.effective_stats.attack : pokemon.effective_stats.special_attack)
   let def = Double(move.category == .physical ? target.effective_stats.defense : target.effective_stats.special_defense)
   var base = Double(move.power)
   let STAB: Double
   if move.name == "Struggle" {
      STAB = 1
   } else {
      if move.type == pokemon.species.type.0 || move.type == pokemon.species.type.1 {
         STAB = 1.5
      } else {
         STAB = 1
      }
   }
   let type_effectiveness: Double
   if move.name == "Struggle" {
       type_effectiveness = 1
   } else {
      if let secondary = target.species.type.1 {
         type_effectiveness = typeModifier(attacking: move.type, defending: target.species.type.0) * typeModifier(attacking: move.type, defending: secondary)
      } else {
         type_effectiveness = typeModifier(attacking: move.type, defending: target.species.type.0)
      }
   }
   let crit_threshold = pokemon.species.base_values.speed / 2
   #if os(Linux)
      let diceRoll = Int(random() % 256)
      let diceRoll2 = Double(rand()) / Double(UINT32_MAX) * 0.15 + 0.85
   #else
      let diceRoll = Int(arc4random_uniform(256))
      let diceRoll2 = Double(arc4random()) / Double(UINT32_MAX) * 0.15 + 0.85
   #endif
   let critical: Double = diceRoll < crit_threshold ? 2 : 1
   var other: Double = 1
   switch environment.weather {
      case .harsh_sunlight(let extremely):
         if move.type == .fire {
            base *= 1.5
         }
         if move.type == .water {
            if extremely {
               other = 0
            } else {
               base *= 0.5
            }
         }
      case .rain(let heavy):
         if move.type == .water {
            base *= 1.5
         }
         if move.type == .fire {
            if heavy {
               other = 0
            } else {
               base *= 0.5
            }
         }
      case .mysterious_air_current:
         if ((target.species.type.0 == .flying || target.species.type.1 == .flying) && type_effectiveness == 2) {
            other *= 0.5
         }
      default:
         break
   }
   /* Terrain not implemented yet du to lack of an "ability" notion */
   let modifier = STAB * type_effectiveness * critical * other * diceRoll2
   let temp = Double(2*pokemon.level+10) * att / def / 250 * base
   let damageOutput = Int((temp + 2) * modifier)
   return damageOutput
}

struct PokemonInFight {
   let pokemon: Pokemon
   let index: Int // Where to find the pokemon in its trainer's list
   var availableMoves: Array<Move>{
      get {
         return Array(pokemon.moves.keys).filter{pokemon.moves[$0]! > 0}
      }
   }
}

struct State {
   var environment: Environment
   var activePokemons: [PokemonInFight]
   var order: (first: Int, last: Int) { // Indicates which of the 2 active pokemons acts first
      get{
         if activePokemons[0].pokemon.effective_stats.speed >= activePokemons[1].pokemon.effective_stats.speed {
            return (first: activePokemons[0].index, last: activePokemons[1].index)
         } else {
            return (first: activePokemons[1].index, last: activePokemons[0].index)
         }
      }
   }
   var remaining_pokemons: [[Int]] // Who hasn't fainted yet (get PETA out of here)
   var escape_attempts: (Int, Int)
}

// Function to randomly chose a next attack
func dumbOffense(_ state: State, _ trainerNum: Int) -> Move {
   if state.activePokemons[trainerNum].availableMoves.isEmpty {
      return move_struggle
   }
   #if os(Linux)
      let diceRoll = Int(random() % state.activePokemons[trainerNum].availableMoves.count)
   #else
      let diceRoll = Int(arc4random_uniform(state.activePokemons[trainerNum].availableMoves.count))
   #endif
   let move_pick = state.activePokemons[trainerNum].availableMoves[diceRoll]
   return move_pick
}

func select_action(trainer: Trainer) -> String {
   // Here defaults to attack, but could be 'Use item', 'Change pokemon' or 'Run'
   return "Attack"
}

func change_pokemon(state: inout State, trainers: [Trainer],trainerNum: Int) { // The choice is random, here, but could be modified to ask a user
   #if os(Linux)
      let diceRoll = Int(random() % state.remaining_pokemons[trainerNum].count)
   #else
      let diceRoll = Int(arc4random_uniform(state.remaining_pokemons[trainerNum].count))
   #endif
   let pick = state.remaining_pokemons[trainerNum][diceRoll]
   state.activePokemons[trainerNum] = PokemonInFight(pokemon: trainers[trainerNum].pokemons[pick], index: pick)
}

func try_escape(who: Pokemon, against: Pokemon, totalTries: Int) -> Bool {
   #if os(Linux)
      let diceRoll = Int(random() % 256)
   #else
      let diceRoll = Int(arc4random_uniform(256))
   #endif
   let ratio = Double(who.effective_stats.speed) * 128.0 / Double(against.effective_stats.speed)
   let total = (Int(ratio) + 30 * totalTries) % 256
   return diceRoll < total
}

func make_attack(move: Move, trainers: inout [Trainer], trainerNum: Int, state: State) {
   switch move.category {
   case .physical:
      let damageDealt = damage(environment: state.environment, pokemon: state.activePokemons[trainerNum].pokemon, move: move, target: state.activePokemons[1-trainerNum].pokemon)
      trainers[1-trainerNum].pokemons[state.activePokemons[1-trainerNum].index].hitpoints = trainers[1-trainerNum].pokemons[state.activePokemons[1-trainerNum].index].hitpoints > damageDealt ? trainers[1-trainerNum].pokemons[1-trainerNum].hitpoints - damageDealt : 0
      if move.name == "Struggle" {
         trainers[trainerNum].pokemons[state.activePokemons[trainerNum].index].hitpoints = trainers[trainerNum].pokemons[state.activePokemons[trainerNum].index].hitpoints > damageDealt/4 ? trainers[trainerNum].pokemons[trainerNum].hitpoints - damageDealt/4 : 0
      }
   case .special:
      /* Not implemented yet */
      break
   case .status:
      /* Not implemented yet */
      break
   }
}

func has_fainted(state: inout State, trainers: [Trainer], trainerNum: Int) -> Bool {
   let pokeIndex = state.activePokemons[trainerNum].index
   if trainers[trainerNum].pokemons[pokeIndex].hitpoints == 0 { // if dead
      state.remaining_pokemons[trainerNum] = state.remaining_pokemons[trainerNum].filter{$0 != pokeIndex} // not available anymore
      return true
   } else {
      return false
   }
}

/******************************************************************************/
/**************************** Main Battle Function ****************************/
/******************************************************************************/
func battle(trainers: inout [Trainer], behavior: (State, Int) -> Move) -> () {
   // Initial check for available pokemons
   let whosUp = [[Int](0 ..< trainers[0].pokemons.count).filter{trainers[0].pokemons[$0].hitpoints != 0},
               [Int](0 ..< trainers[1].pokemons.count).filter{trainers[1].pokemons[$0].hitpoints != 0}]

   // Initial state
   var battle_state = State(
      environment: Environment(
         weather: .clear_skies,
         terrain: .normal
      ),
      activePokemons: [ // First pokemons by default
         PokemonInFight(pokemon: Array(trainers)[0].pokemons[whosUp[0][0]], index: whosUp[0][0]),
         PokemonInFight(pokemon: Array(trainers)[1].pokemons[whosUp[1][0]], index: whosUp[1][0])
      ],
      remaining_pokemons: whosUp,
      escape_attempts: (0, 0)
   )

   // Loop until fight ends
   FIGHT: while true {
      // Choose action
      let action1 = select_action(trainer: trainers[0])
      let action2 = select_action(trainer: trainers[1])

      var attMove: [Move?] = [nil, nil]
      // Assess first trainer's action and exec if not an attack
      switch action1 {
      case "Use item":
         // Call item function
         attMove[0] = nil
      case "Change pokemon":
         change_pokemon(state: &battle_state, trainers: trainers,trainerNum: 0)
         attMove[0] = nil
      case "Run":
         battle_state.escape_attempts.0 += 1
         if try_escape(who: battle_state.activePokemons[0].pokemon, against: battle_state.activePokemons[1].pokemon, totalTries: battle_state.escape_attempts.0) {
            break FIGHT
         }
      case "Attack":
         attMove[0] = behavior(battle_state, 0)
      default:
         // Error message "Unknown action"
         attMove[0] = nil
      }
      // Assess second trainer's action and exec if not an attack
      switch action2 {
      case "Use item":
         // Call item function
         attMove[1] = nil
      case "Change pokemon":
         change_pokemon(state: &battle_state, trainers: trainers,trainerNum: 1)
         attMove[1] = nil
      case "Run":
         battle_state.escape_attempts.1 += 1
         if try_escape(who: battle_state.activePokemons[1].pokemon, against: battle_state.activePokemons[0].pokemon, totalTries: battle_state.escape_attempts.1) {
            break FIGHT
         }
      case "Attack":
         attMove[1] = behavior(battle_state, 1)
      default:
         // Error message "Unknown action"
         attMove[1] = nil
      }

      // Apply continuous effects
      switch battle_state.environment.weather { // Weather effects (damage only)
      case .sandstorm:
         let types1 = battle_state.activePokemons[0].pokemon.species.type
         let types2 = battle_state.activePokemons[1].pokemon.species.type
         if types1.0 != .rock, types1.0 != .ground, types1.0 != .steel, types1.1 != .rock, types1.1 != .ground, types1.1 != .steel {
            let envDamage1 = Int(Double(battle_state.activePokemons[0].pokemon.effective_stats.hitpoints) * 0.0625)
            trainers[0].pokemons[battle_state.activePokemons[0].index].hitpoints -= envDamage1 < trainers[0].pokemons[battle_state.activePokemons[0].index].hitpoints ? envDamage1 : 0
         }
         if types2.0 != .rock, types2.0 != .ground, types2.0 != .steel, types2.1 != .rock, types2.1 != .ground, types2.1 != .steel {
            let envDamage2 = Int(Double(battle_state.activePokemons[1].pokemon.effective_stats.hitpoints) * 0.0625)
            trainers[1].pokemons[battle_state.activePokemons[1].index].hitpoints -= envDamage2 < trainers[1].pokemons[battle_state.activePokemons[1].index].hitpoints ? envDamage2 : 0
         }
      case .hail:
         let types1 = battle_state.activePokemons[0].pokemon.species.type
         let types2 = battle_state.activePokemons[1].pokemon.species.type
         if types1.0 != .ice, types1.1 != .ice {
            let envDamage1 = Int(Double(battle_state.activePokemons[0].pokemon.effective_stats.hitpoints) * 0.0625)
            trainers[0].pokemons[battle_state.activePokemons[0].index].hitpoints -= envDamage1 < trainers[0].pokemons[battle_state.activePokemons[0].index].hitpoints ? envDamage1 : 0
         }
         if types2.0 != .ice, types2.1 != .ice {
            let envDamage2 = Int(Double(battle_state.activePokemons[1].pokemon.effective_stats.hitpoints) * 0.0625)
            trainers[1].pokemons[battle_state.activePokemons[1].index].hitpoints -= envDamage2 < trainers[1].pokemons[battle_state.activePokemons[1].index].hitpoints ? envDamage2 : 0
         }
      default:
         break
      }

      // Determine order
      let order = battle_state.activePokemons[0].pokemon.effective_stats.speed >= battle_state.activePokemons[1].pokemon.effective_stats.speed ? (first: 0, last: 1) : (first: 1, last: 0)

      // Status effect damage on first
      if trainers[order.first].pokemons[battle_state.activePokemons[order.first].index].effects.contains(.burn) { // Burn damage
         let damage = Int(0.125 * Double(trainers[order.first].pokemons[battle_state.activePokemons[order.first].index].effective_stats.hitpoints))
         if trainers[order.first].pokemons[battle_state.activePokemons[order.first].index].hitpoints > damage {
            trainers[order.first].pokemons[battle_state.activePokemons[order.first].index].hitpoints -= damage
         } else {
            trainers[order.first].pokemons[battle_state.activePokemons[order.first].index].hitpoints = 0
            attMove[order.first] = nil
         }
      }
      /* poison damage */
      /* curse damage */
      // First attack
      if let attack = attMove[order.first] {
         make_attack(move: attack, trainers: &trainers, trainerNum: order.first, state: battle_state)
         if has_fainted(state: &battle_state, trainers: trainers, trainerNum: order.last) {
            if battle_state.remaining_pokemons[order.last].isEmpty {
               break FIGHT
            } else {
               change_pokemon(state: &battle_state, trainers: trainers, trainerNum: order.last)
            }
         }
         if has_fainted(state: &battle_state, trainers: trainers, trainerNum: order.first) {
            if battle_state.remaining_pokemons[order.first].isEmpty {
               break FIGHT
            } else {
               change_pokemon(state: &battle_state, trainers: trainers, trainerNum: order.first)
            }
         }
      }
      // Second attack
      if let attack = attMove[order.last] {
         make_attack(move: attack, trainers: &trainers, trainerNum: order.last, state: battle_state)
         if has_fainted(state: &battle_state, trainers: trainers, trainerNum: order.last) {
            if battle_state.remaining_pokemons[order.last].isEmpty {
               break FIGHT
            } else {
               change_pokemon(state: &battle_state, trainers: trainers, trainerNum: order.last)
            }
         }
         if has_fainted(state: &battle_state, trainers: trainers, trainerNum: order.first) {
            if battle_state.remaining_pokemons[order.first].isEmpty {
               break FIGHT
            } else {
               change_pokemon(state: &battle_state, trainers: trainers, trainerNum: order.first)
            }
         }
      }
   } // FIGHT loop
}
