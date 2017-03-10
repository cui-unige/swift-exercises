import Foundation

/// http://bulbapedia.bulbagarden.net/wiki/Type
enum Type {
    case bug
    case dark
    case dragon
    case electric
    case fairy
    case fighting
    case ground
    case fire
    case flying
    case ghost
    case grass
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
struct StatsDouble {
    let hitpoints       : Double
    let attack          : Double
    let defense         : Double
    let special_attack  : Double
    let special_defense : Double
    let speed           : Double
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

func set_effective_hp(base B: Int, iv I: Int, ev E: Int, lvl L: Int) -> Int
{
  let result = Int( Double((2 * B + I + E) * L) / Double(100))
  return result + L + 10
}

func set_effective_stat(base B: Int, iv I: Int, ev E: Int, lvl L: Int,nature N: Double) -> Int
{
  let result = floor(Double((2 * B + I + E) * L) / Double(100) + 5) * N
  return Int(result)
}
//------------------------------------------------------
let nature_coeff: [Nature: StatsDouble] = [
    Nature.hardy: StatsDouble(hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1, speed: 1),
    Nature.lonely: StatsDouble(hitpoints: 1, attack: 1.1, defense: 0.9, special_attack: 1, special_defense: 1, speed: 1),
    Nature.brave: StatsDouble(hitpoints: 1, attack: 1.1, defense: 1, special_attack: 1, special_defense: 1, speed: 0.9),
    Nature.adamant: StatsDouble(hitpoints: 1, attack: 1.1, defense: 1, special_attack: 0.9, special_defense: 1, speed: 1),
    Nature.naughty: StatsDouble(hitpoints: 1, attack: 1.1, defense: 1, special_attack: 1, special_defense: 0.9, speed: 1),
    Nature.bold: StatsDouble(hitpoints: 1, attack: 0.9, defense: 1.1, special_attack: 1, special_defense: 1, speed: 1),
    Nature.docile: StatsDouble(hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1, speed: 1),
    Nature.relaxed: StatsDouble(hitpoints: 1, attack: 1, defense: 1.1, special_attack: 1, special_defense: 1, speed: 0.9),
    Nature.impish: StatsDouble(hitpoints: 1, attack: 1, defense: 1.1, special_attack: 0.9, special_defense: 1, speed: 1),
    Nature.lax: StatsDouble(hitpoints: 1, attack: 1, defense: 1.1, special_attack: 1, special_defense: 0.9, speed: 1),
    Nature.timid: StatsDouble(hitpoints: 1, attack: 0.9, defense: 1, special_attack: 1, special_defense: 1, speed: 1.1),
    Nature.hasty: StatsDouble(hitpoints: 1, attack: 1, defense: 0.9, special_attack: 1, special_defense: 1, speed: 1.1),
    Nature.serious: StatsDouble(hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1, speed: 1),
    Nature.jolly: StatsDouble(hitpoints: 1, attack: 1, defense: 1, special_attack: 0.9, special_defense: 1, speed: 1.1),
    Nature.naive: StatsDouble(hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 0.9, speed: 1.1),
    Nature.modest: StatsDouble(hitpoints: 1, attack: 0.9, defense: 1, special_attack: 1.1, special_defense: 1, speed: 1),
    Nature.mild: StatsDouble(hitpoints: 1, attack: 1, defense: 0.9, special_attack: 1.1, special_defense: 1, speed: 1),
    Nature.quiet: StatsDouble(hitpoints: 1, attack: 1, defense: 1, special_attack: 1.1, special_defense: 1, speed: 0.9),
    Nature.bashful: StatsDouble(hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1, speed: 1),
    Nature.rash: StatsDouble(hitpoints: 1, attack: 1, defense: 1, special_attack: 1.1, special_defense: 0.9, speed: 1),
    Nature.calm: StatsDouble(hitpoints: 1, attack: 0.9, defense: 1, special_attack: 1, special_defense: 1.1, speed: 1),
    Nature.gentle: StatsDouble(hitpoints: 1, attack: 1, defense: 0.9, special_attack: 1, special_defense: 1.1, speed: 1),
    Nature.sassy: StatsDouble(hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1.1, speed: 0.9),
    Nature.careful: StatsDouble(hitpoints: 1, attack: 1, defense: 1, special_attack: 0.9, special_defense: 1.1, speed: 1),
    Nature.quirky: StatsDouble(hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1, speed: 1)
]
// TODO: create some species
// Do you use an enum, a map or constants/variables?
// http://bulbapedia.bulbagarden.net/wiki/List_of_Pokémon_by_National_Pokédex_number

let curse = Move(id: 1,name: "curse",description: "Curse (Japanese: のろい Curse/Slow) is a non-damaging Ghost-type move introduced in Generation II. Prior to Generation V, it was a ???-type move, and the only move of that type. It was TM03 in Generation II. ",category: Category.status,type: Type.ghost,power: 0,accuracy: 0,powerpoints: 10,priority: 0)
let aeroblast = Move(id: 2,name: "aeroblast",description: "Aeroblast (Japanese: エアロブラスト Aeroblast) is a damage-dealing Flying-type move introduced in Generation II. It is the signature move of Lugia. ",category: Category.special,type: Type.flying,power: 100,accuracy: 95,powerpoints: 5,priority: 0)
let earthquake = Move(id: 3,name: "earthquake",description: "Earthquake (Japanese: じしん Earthquake) is a damage-dealing Gfloor-type move introduced in Generation I. It is TM26 in all generations so far. ",category: Category.physical,type: Type.ground,power: 100,accuracy: 100,powerpoints: 10,priority: 0)
let recover = Move(id: 4,name: "recover",description: "Recover (Japanese: じこさいせい Self-regeneration) is a non-damaging Normal-type move introduced in Generation I. ",category: Category.status,type: Type.normal,power: 0,accuracy: 0,powerpoints: 10,priority: 0)

let speciesEmpty : Set<Species> = []
let Attaque: Set = [curse,aeroblast,earthquake,recover]
let Values = Stats(hitpoints: 106,attack: 90,defense: 130,special_attack: 90,special_defense: 154,speed: 110)
let lugia = Species(id: 249,name: "maria",evolutions: speciesEmpty,attacks: Attaque,type: (Type.flying, Type.psychic),base_values: Values)

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
    var effective_stats   : Stats
    {
          get
          {
              let new_hitpoints = set_effective_hp(base: species.base_values.hitpoints,iv: individual_values.hitpoints,ev: effort_values.hitpoints,lvl: level)
              let new_attack = set_effective_stat(base: species.base_values.attack,iv: individual_values.attack,ev: effort_values.attack,lvl: level,nature: (nature_coeff[nature]?.defense)!)
              let new_defense = set_effective_stat(base: species.base_values.defense,iv: individual_values.defense,ev: effort_values.defense,lvl: level,nature: (nature_coeff[nature]?.defense)!)
              let new_special_attack = set_effective_stat(base: species.base_values.special_attack,iv: individual_values.special_attack,ev: effort_values.special_attack,lvl: level,nature: (nature_coeff[nature]?.defense)!)
              let new_special_defense = set_effective_stat(base: species.base_values.special_defense,iv: individual_values.special_defense,ev: effort_values.special_defense,lvl: level,nature: (nature_coeff[nature]?.defense)!)
              let new_speed = set_effective_stat(base: species.base_values.speed,iv: individual_values.speed,ev: effort_values.speed,lvl: level,nature: (nature_coeff[nature]?.defense)!)
              return Stats(hitpoints: new_hitpoints,attack: new_attack,defense: new_defense,special_attack: new_special_attack,special_defense:new_special_defense ,speed: new_speed)
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

let tableau_modifier_type: [Type: [Type: Double]] = [
   .normal:   [.normal:1, .fighting:1,    .flying:1, .poison:1, .ground:1, .rock:0.5, .bug:1, .ghost:0, .steel:0.5, .fire:1, .water:1, .grass:1, .electric:1, .psychic:1, .ice:1, .dragon:1, .dark:1],
   .fighting: [.normal:2, .fighting:1,    .flying:0.5, .poison:0.5, .ground:1, .rock:2, .bug:0.5, .ghost:0, .steel:2, .fire:1, .water:1, .grass:1, .electric:1, .psychic:0.5, .ice:2, .dragon:1, .dark:2],
   .flying:   [.normal:1, .fighting:2,    .flying:1, .poison:1, .ground:1, .rock:0.5, .bug:2, .ghost:1, .steel:0.5, .fire:1, .water:1, .grass:2, .electric:0.5, .psychic:1, .ice:1, .dragon:1, .dark:1],
   .poison:   [.normal:1, .fighting:1,    .flying:1, .poison:0.5, .ground:0.5, .rock:0.5, .bug:1, .ghost:0.5, .steel:0, .fire:1, .water:1, .grass:2, .electric:1, .psychic:1, .ice:1, .dragon:1, .dark:1],
   .ground:   [.normal:1, .fighting:1,    .flying:0, .poison:2, .ground:1, .rock:2, .bug:0.5, .ghost:1, .steel:2, .fire:2, .water:1, .grass:0.5, .electric:2, .psychic:1, .ice:1, .dragon:1, .dark:1],
   .rock:     [.normal:1, .fighting:0.5,  .flying:2, .poison:1, .ground:0.5, .rock:1, .bug:2, .ghost:1, .steel:0.5, .fire:2, .water:1, .grass:1, .electric:1, .psychic:1, .ice:2, .dragon:1, .dark:1],
   .bug:      [.normal:1, .fighting:0.5,  .flying:0.5, .poison:0.5, .ground:1, .rock:1, .bug:1, .ghost:0.5, .steel:0.5, .fire:0.5, .water:1, .grass:2, .electric:1, .psychic:2, .ice:1, .dragon:1, .dark:2],
   .ghost:    [.normal:0, .fighting:1,    .flying:1, .poison:1, .ground:1, .rock:1, .bug:1, .ghost:2, .steel:1, .fire:1, .water:1, .grass:1, .electric:1, .psychic:2, .ice:1, .dragon:1, .dark:0.5],
   .steel:    [.normal:1, .fighting:1,    .flying:1, .poison:1, .ground:1, .rock:2, .bug:1, .ghost:1, .steel:0.5, .fire:0.5, .water:0.5, .grass:1, .electric:0.5, .psychic:1, .ice:2, .dragon:1, .dark:1],
   .fire:     [.normal:1, .fighting:1,    .flying:1, .poison:1, .ground:1, .rock:0.5, .bug:2, .ghost:1, .steel:2, .fire:0.5, .water:0.5, .grass:2, .electric:1, .psychic:1, .ice:2, .dragon:0.5, .dark:1],
   .water:    [.normal:1, .fighting:1,    .flying:1, .poison:1, .ground:2, .rock:2, .bug:1, .ghost:1, .steel:1, .fire:2, .water:0.5, .grass:0.5, .electric:1, .psychic:1, .ice:1, .dragon:0.5, .dark:1],
   .grass:    [.normal:1, .fighting:1,    .flying:0.5, .poison:0.5, .ground:2, .rock:2, .bug:0.5, .ghost:1, .steel:0.5, .fire:0.5, .water:2, .grass:0.5, .electric:1, .psychic:1, .ice:1, .dragon:0.5, .dark:1],
   .electric: [.normal:1, .fighting:1,    .flying:2, .poison:1, .ground:0, .rock:1, .bug:1, .ghost:1, .steel:1, .fire:1, .water:2, .grass:0.5, .electric:0.5, .psychic:1, .ice:1, .dragon:0.5, .dark:1],
   .psychic:  [.normal:1, .fighting:2,    .flying:1, .poison:2, .ground:1, .rock:1, .bug:1, .ghost:1, .steel:0.5, .fire:1, .water:1, .grass:1, .electric:1, .psychic:0.5, .ice:1, .dragon:1, .dark:0],
   .ice:      [.normal:1, .fighting:1,    .flying:2, .poison:1, .ground:2, .rock:1, .bug:1, .ghost:1, .steel:0.5, .fire:0.5, .water:0.5, .grass:2, .electric:1, .psychic:1, .ice:0.5, .dragon:2, .dark:1],
   .dragon:   [.normal:1, .fighting:1,    .flying:1, .poison:1, .ground:1, .rock:1, .bug:1, .ghost:1, .steel:0.5, .fire:1, .water:1, .grass:1, .electric:1, .psychic:1, .ice:1, .dragon:2, .dark:1],
   .dark:     [.normal:1, .fighting:0.5,  .flying:1, .poison:1, .ground:1, .rock:1, .bug:1, .ghost:2, .steel:1, .fire:1, .water:1, .grass:1, .electric:1, .psychic:2, .ice:1, .dragon:1, .dark:0.5],
   .fairy:    [.normal:1, .fighting:2,    .flying:1, .poison:0.5, .ground:1, .rock:1, .bug:1, .ghost:1, .steel:0.5, .fire:0.5, .water:1, .grass:1, .electric:1, .psychic:1, .ice:1, .dragon:2, .dark:2]
]
// http://bulbapedia.bulbagarden.net/wiki/Type/Type_chart
func typeModifier(attacking: Type, defending : Type) -> Double {
    return (tableau_modifier_type[attacking]?[defending])!
}

// http://bulbapedia.bulbagarden.net/wiki/Damage
// let lugia = Species(id: 249,name: "maria",evolutions: speciesEmpty,attacks: Attaque,type: (Type.flying, Type.psychic),base_values: Values)

func damage(environment : Environment, pokemon: Pokemon, move: Move, target: Pokemon) -> Int {
   let attaque = Double(move.category == .physical ? pokemon.effective_stats.attack : pokemon.effective_stats.special_attack)
   let defense = Double(move.category == .physical ? target.effective_stats.defense : target.effective_stats.special_defense)

   var power_damage = Double(move.power)
   let STAB: Double



   #if os(Linux)
      let random_critical = Int(random() % 10)
      let random_damage = Double(rand()) / Double(UINT32_MAX) * 0.15 + 0.85
   #else
      let random_critical = Int(arc4random_uniform(10))
      let random_damage = Double(arc4random()) / Double(UINT32_MAX) * 0.15 + 0.85
   #endif

   var critical: Double = 2
   if (random_critical != 2)
   {
     critical = 1
   }

   //STAB
   if move.type == pokemon.species.type.0 || move.type == pokemon.species.type.1 {
      STAB = 1.5
   } else {
      STAB = 1
   }

   let type_effectiveness: Double
   if let second = target.species.type.1
   {
      type_effectiveness = typeModifier(attacking: move.type, defending: target.species.type.0) * typeModifier(attacking: move.type, defending: second)
   } else
   {
      type_effectiveness = typeModifier(attacking: move.type, defending: target.species.type.0)
   }

   var other: Double = 1
   switch environment.weather {
      case .harsh_sunlight(let extremely):
         if move.type == .fire {
            power_damage *= 1.5
         }
         if move.type == .water {
            if extremely {
               other = 0
            } else {
               power_damage *= 0.5
            }
         }
      case .rain(let heavy):
         if move.type == .water {
            power_damage *= 1.5
         }
         if move.type == .fire {
            if heavy {
               other = 0
            } else {
               power_damage *= 0.5
            }
         }
      case .mysterious_air_current:
         if ((target.species.type.0 == .flying || target.species.type.1 == .flying) && type_effectiveness == 2) {
            other *= 0.5
         }
      default:
         break
   }

   let damage_part1 = Double((2*pokemon.level/5) + 2) * power_damage * attaque / defense / 50 + 2
   let modifier = critical * random_damage * STAB * type_effectiveness * other

   return Int((damage_part1) * modifier)
}

/*
struct State {
    // TODO: describe a battle state
    //entraineur, pokemon actif, pokemon en arriere,
}

func battle(trainers: inout [Trainer], behavior: (State, Trainer) -> Move) -> () {
    // TODO: simulate battle

    */
