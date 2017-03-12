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
    var powerpoints : Int
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
    let attacks     : [Move]
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

let curse = Move(id: 1,name: "curse",description: "Curse is a non-damaging Ghost-type move. ",category: Category.status,type: Type.ghost,power: 0,accuracy: 0,powerpoints: 10,priority: 0)
let aeroblast = Move(id: 2,name: "aeroblast",description: "Aeroblast is a damage-dealing Flying-type move. ",category: Category.special,type: Type.flying,power: 100,accuracy: 95,powerpoints: 5,priority: 0)
let earthquake = Move(id: 3,name: "earthquake",description: "Earthquake is a damage-dealing Gfloor-type move. ",category: Category.physical,type: Type.ground,power: 100,accuracy: 100,powerpoints: 10,priority: 0)
let recover = Move(id: 4,name: "recover",description: "Recover is a non-damaging Normal-type move. ",category: Category.status,type: Type.normal,power: 0,accuracy: 0,powerpoints: 10,priority: 0)

let speciesEmpty : Set<Species> = []
let Attaque_lugia = [curse, aeroblast, earthquake, recover]
let Values_lugia = Stats(hitpoints: 106,attack: 90,defense: 130,special_attack: 90,special_defense: 154,speed: 110)
let individual_Values_lugia = Stats(hitpoints: 106,attack: 90,defense: 130,special_attack: 90,special_defense: 154,speed: 110)
let lugia_EffortValues = Stats(
    hitpoints: 0,
    attack: 0,
    defense: 0,
    special_attack: 0,
    special_defense: 3,
    speed: 0
)
let lugia_spec = Species(id: 249,name: "lugia",evolutions: speciesEmpty,attacks: Attaque_lugia,type: (Type.flying, Type.psychic),base_values: Values_lugia)
let lugia = Pokemon(nickname: "Martin", hitpoints: 120, size: 5, weight: 230, experience: 0, level: 1, nature: Nature.naughty, species: lugia_spec, moves: Attaque_lugia, individual_values: individual_Values_lugia, effort_values: lugia_EffortValues)



//              pokemon autres
//pokemon 2
let SolarBeam  = Move(id: 2, name: "Solar Beam",  description: "Absorbs light in one turn, then attacks next turn.",      category: Category.special,  type: Type.grass,  power: 120, accuracy: 100, powerpoints: 10, priority: 0)
let SunnyDay   = Move(id: 3, name: "Sunny Day",   description: "Boosts the power of FIRE- type moves for 5 turns.",       category: Category.status,   type: Type.fire,   power: 0,   accuracy: 0,   powerpoints: 5,  priority: 0)
let ReturnRest = Move(id: 4, name: "Return/Rest", description: "Power increases with happiness, up to a maximum of 102.", category: Category.physical, type: Type.normal, power: 0,   accuracy: 100, powerpoints: 20, priority: 0)

let enteiBaseValues = Stats(hitpoints: 115, attack: 115, defense: 85, special_attack: 90, special_defense: 75, speed: 100)

let enteiIndividualValues = Stats(hitpoints: 115, attack: 115, defense: 85, special_attack: 90, special_defense: 75, speed: 100)

let enteiEffortValues = Stats(
    hitpoints: 1,
    attack: 2,
    defense: 0,
    special_attack: 0,
    special_defense: 0,
    speed: 0
)

let allAttacksEntei = [FireBlast, SolarBeam, SunnyDay, ReturnRest]
let entei_Specie = Species(id: 244, name: "Entei", evolutions: [], attacks: allAttacksEntei, type: (.fire, nil), base_values: enteiBaseValues)
let entei = Pokemon(nickname: "Kiki", hitpoints: 120, size: 5, weight: 230, experience: 0, level: 1, nature: Nature.naughty, species: entei_Specie, moves: allAttacksEntei, individual_values: enteiIndividualValues, effort_values: enteiEffortValues)




//pokemon 3
let FireBlast = Move(id: 1, name: "Fire BLast", description: "30% chance to burn the target.", category: Category.special, type: Type.fire, power: 120, accuracy: 85, powerpoints: 5, priority: 0)
let BodySlam = Move(id: 2, name: "Roar", description: "30% chance to paralyze the target", category: Category.physical, type: Type.normal, power: 85, accuracy: 100, powerpoints: 15, priority: 0)
let HyperBeam = Move(id: 3, name: "Hyper Beam", description: "User cannot move next turn, unless opponent or Substitute was KOed.", category: Category.physical, type: Type.normal, power: 150, accuracy: 90, powerpoints: 5, priority: 0)
let Reflect = Move(id: 4, name: "Reflect", description: "Lowers the physical damage done to user.", category: Category.status, type: Type.psychic, power: 0, accuracy: 0, powerpoints: 20, priority: 0)
let stats_arca = Stats(hitpoints: 90, attack: 110, defense: 80, special_attack: 80, special_defense: 80, speed: 95)
let stats_arca_indiv = Stats(hitpoints: 90, attack: 110, defense: 80, special_attack: 80, special_defense: 80, speed: 95)

let arca_EffortValues = Stats(
    hitpoints: 0,
    attack: 2,
    defense: 0,
    special_attack: 0,
    special_defense: 0,
    speed: 0
)

let attacks_arca = [FireBlast, BodySlam, HyperBeam, Reflect]
let arcanine_spec = Species(id: 59, name: "arcanine", evolutions: [], attacks: attacks_arca, type: (Type.fire, nil), base_values: stats_arca)

let arcanine = Pokemon(nickname: "pepito", hitpoints: 60, size: 3, weight: 155, experience: 0, level: 1, nature: Nature.rash, species: arcanine_spec, moves: attacks_arca, individual_values: stats_arca_indiv, effort_values: arca_EffortValues)

//pokemon 4
let bubble = Move(id: 1, name: "Bubble", description: "A spray of countless bubbles is jetted at the opposing Pokémon. This may also lower their Speed stat.", category: Category.special, type: Type.water, power: 40, accuracy: 100, powerpoints: 30, priority: 1)

let water_gun = Move(id: 2, name: "Water Gun",description: "The target is blasted with a forceful shot of water.", category: Category.special, type: Type.water, power: 40, accuracy: 100, powerpoints: 25,priority: 1)

let allAttacksSquirtle = [bubble, water_gun]

/* Squirtle definition */
let squirtleBaseValues = Stats(
    hitpoints: 44,
    attack: 48,
    defense: 65,
    special_attack: 50,
    special_defense: 64,
    speed: 43
)

let squirtleIndividualValues = Stats(
    hitpoints: 47,
    attack: 42,
    defense: 69,
    special_attack: 47,
    special_defense: 61,
    speed: 41
)

let squirtleEffortValues = Stats(
    hitpoints: 0,
    attack: 0,
    defense: 1,
    special_attack: 0,
    special_defense: 0,
    speed: 0
)



let squirtleSpecie = Species(
    id: 007,
    name: "Squirtle",
    evolutions: [],
    attacks: [water_gun, bubble],
    type: (Type.water, nil),
    base_values: squirtleBaseValues
)



let squirtle = Pokemon(nickname: "Arthur", hitpoints: 47, size: 3, weight: 300, experience: 0, level: 1, nature: Nature.calm, species: squirtleSpecie, moves: allAttacksSquirtle, individual_values: squirtleIndividualValues, effort_values: squirtleEffortValues)

struct Pokemon {
    let nickname          : String?
    var hitpoints         : Int // remaining hitpoints
    let size              : Int
    let weight            : Int
    let experience        : Int
    let level             : Int
    let nature            : Nature
    let species           : Species
    var moves             : [Move] // Move -> remaining powerpoints
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
    var pokemons : [Pokemon]
}

struct Environment {
    var weather : Weather
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


struct State
{
  let player_1: Trainer
  let player_2: Trainer
  var pokemon_attack: Pokemon
  var pokemon_defense: Pokemon
  var pokemon_moveAttack: Move
  var pokemon_moveDefense: Move
  var pokemon_environment: Environment
}

var battle_part2: Int = 1
func battle(trainers: inout [Trainer]) -> ()
{
    print("--------------------------------------------------\n")
    if currentState.pokemon_attack.effective_stats.speed > currentState.pokemon_defense.effective_stats.speed && battle_part2 == 1
    {
      for i in 0...(currentState.pokemon_attack.moves.count - 1)
      {
          print("\(i) \(currentState.pokemon_attack.moves[i].name) | Remaining powerpoints for this attack: \(currentState.pokemon_attack.moves[i].powerpoints)")
      }
      print("\(currentState.pokemon_attack.moves.count) Run")
      print("\(currentState.pokemon_attack.moves.count + 1) Menu\n")

      //on dit que e joueur chosie 1
      print("on suppose que le joueur chosie 1 car on ne peut le demander sur linux\n")
      var choice_battle: Int = 1

        if (choice_battle > currentState.pokemon_attack.moves.count + 1)
        {
          print("Not possible\n")
          go()
        }
        else
        {
          if choice_battle == currentState.pokemon_attack.moves.count
          {
            print("You can't lose, if you don't fight ... \n ")
            abort()
          }
          else if choice_battle == currentState.pokemon_attack.moves.count + 1
          {
            go()
          }else
          {
            currentState.pokemon_moveAttack = currentState.pokemon_attack.moves[choice_battle] //Selecting appropriate move
            currentState.pokemon_moveAttack.powerpoints -= 1 //Decreasing PP
            martin_user.pokemons[currentPokemon].moves[choice_battle].powerpoints -= 1
            if (currentState.pokemon_moveAttack.powerpoints == 0)
            {
              print("\nNo PP for the move")
              currentState.pokemon_attack.moves.remove(at: choice_battle) //Removing move
              martin_user.pokemons[currentPokemon].moves.remove(at: choice_battle)//Updating bob's pokemon
            }
            else
            {
              currentState.pokemon_attack.moves[choice_battle] = currentState.pokemon_moveAttack //Updating global attacks list
            }
            if ((currentState.pokemon_attack.nickname == "Kiki") && (currentState.pokemon_moveAttack.id == 3))
            {
              currentState.pokemon_environment.weather = Weather.clear_skies //Updating conditions
            }
          }
        }
        damages = damage(environment: currentState.pokemon_environment, pokemon: currentState.pokemon_attack, move: currentState.pokemon_moveAttack, target: currentState.pokemon_defense)
        currentState.pokemon_defense.hitpoints = currentState.pokemon_defense.hitpoints - damages; //Remaining hitpoints

        if currentState.pokemon_defense.hitpoints <= 0 {
            print("Pokemon was killed !\n");
            abort(); //Exciting game
        }
    }
    else
    {
      damages = damage(environment: currentState.pokemon_environment, pokemon: currentState.pokemon_defense, move: currentState.pokemon_moveDefense, target: currentState.pokemon_attack)
      currentState.pokemon_attack.hitpoints = currentState.pokemon_attack.hitpoints - damages;

      currentState.pokemon_moveDefense.powerpoints -= 1 //Decreasing PP

      if (currentState.pokemon_moveDefense.powerpoints == 0){
          print("No PP for the move")
          currentState.pokemon_defense.moves.remove(at:  0) //Removing move
      }

      if currentState.pokemon_attack.hitpoints <= 0 {
          print("Pokemon was killed !\n")
          abort();
      }
    }



    if currentState.pokemon_attack.effective_stats.speed > currentState.pokemon_defense.effective_stats.speed && battle_part2 == 1
    {
        print("Pokemon Attack : \(currentState.pokemon_attack.nickname)\t| Specie: \(currentState.pokemon_attack.species.name)");
        print("Pokemon Defense : \(currentState.pokemon_defense.nickname)\t| Specie: \(currentState.pokemon_defense.species.name)\n");
        print("Selected move : \(currentState.pokemon_moveAttack.name). Damages done: \(damages) \n");
        battle_part2 = 0 //Changing player
    }
    else
    {
        print("Pokemon Attack: \(currentState.pokemon_defense.nickname)\t| Specie: \(currentState.pokemon_defense.species.name)");
        print("Pokemon Defense: \(currentState.pokemon_attack.nickname)\t| Specie: \(currentState.pokemon_attack.species.name) \n");
        print("Selected move: \(currentState.pokemon_moveDefense.name). Damages done: \(damages) \n");
        #if os(Linux)
           let random_currentstate = Int(random() % 3)
        #else
           let random_currentstate = Int(arc4random_uniform(3))
        #endif
        currentState.pokemon_moveDefense = currentState.pokemon_defense.moves[random_currentstate];
        battle_part2 = 1; //Changing player
    }
    print("Hitpoints : \(currentState.pokemon_attack.nickname) : \(currentState.pokemon_attack.hitpoints)");
    print("Hitpoints : \(currentState.pokemon_defense.nickname) : \(currentState.pokemon_defense.hitpoints) \n");
    battle(trainers: &trainers); //Next round
}

var martin_user = Trainer(pokemons: [lugia, entei])
var pepito_user = Trainer(pokemons: [arcanine, squirtle])
var trainers = [martin_user, pepito_user]
var currentPokemon = 0
var damages: Int = 0
let Game_environnement = Environment(weather: Weather.sandstorm, terrain: Terrain.grassy)

#if os(Linux)
   var rand_attaque = Int(random() % 3)
#else
   var rand_attaque = Int(arc4random_uniform(3))
#endif

var currentState = State(player_1: martin_user,
   player_2: pepito_user,
   pokemon_attack: martin_user.pokemons[0],
   pokemon_defense: pepito_user.pokemons[0],
   pokemon_moveAttack: martin_user.pokemons[0].moves[0],
   pokemon_moveDefense: pepito_user.pokemons[0].moves[rand_attaque],
 pokemon_environment: Game_environnement)


func go() -> ()
{
  print("\n=======================================================\n======================POKEMON==========================\n=======================================================\n")


  print("\n\nRIVAL would like to battle\n")
  print("RIVAL  sent out \(currentState.pokemon_defense.species.name)\n")

  print("   0: Fight     1: Pokemon\n   2: Run\n")
  var move_player: Int!


  //normalent on demande se que veut faire le joueur mais sur Linux la command ne marche pas.
  //move_player = readLine()

  #if os(Linux)
     move_player = Int(random() % 3)
  #else
     move_player = Int(arc4random_uniform(3))
  #endif

  move_player = 0

  if (move_player == 0)
  {
    battle(trainers: &trainers)
  }
  if (move_player == 1)
  {

      for i in 0...(martin_user.pokemons.count - 1){
          print("\(i+1) name: \(martin_user.pokemons[i].nickname)\t| specie: \(martin_user.pokemons[i].species.name)")
      }

      print("\nSur linux on ne peut pas utilisé readLine donc on prend toujours l'autre\n")

      #if os(Linux)
         var move_player_2 = Int(random() % 3)
      #else
         var move_player_2 = Int(arc4random_uniform(3))
      #endif

              if (move_player_2 > martin_user.pokemons.count){
                  print("Not possible\n")
                  //go()
              }else{
                  currentPokemon = (currentPokemon + 1) % 2
                  currentState.pokemon_attack = martin_user.pokemons[currentPokemon]
              }



      print("New Pokemon selected\n")

      //go()
  }

  if (move_player == 2)
  {
      print("You can't lose, if you don't fight ... \n")
      abort()
  }

}
