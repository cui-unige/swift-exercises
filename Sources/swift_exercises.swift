//210 Granbull
//import Foundation


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

let granbull_species = Species(
  id: 210,
  name: "Granbull",
  evolutions: [],
  attacks: [],
  type: (.fairy, nil),
  base_values:Stats(
    hitpoints: 90,
    attack: 120,
    defense: 75,
    special_attack: 60,
    special_defense: 60,
    speed: 45
  )

  )

  func calcul_stat_hp(base_stat: Int, iv: Int, ev: Int, level: Int ) -> Int{
    //J'ai du ajouter une variable temporaire pour que le compilateur ne timeout pas sur une expression
    var temp:Int=((2 * level + iv + (ev / 4)) * level) //Je ne sais pas si ev/4 arrondit correctement.
    temp=(temp / 100) //idem
    return temp + level + 10
  }

  func calcul_stat_other(base_stat: Int, iv: Int, ev: Int, level: Int, nature: Float ) -> Int{
    var temp:Int=((2 * level + iv + (ev / 4)) * level)
    temp=(temp / 100) + 5
    return Int(Float(temp) * nature)
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
    // TODO add nature
     var effective_stats   : Stats {


       return Stats(
         hitpoints: calcul_stat_hp(base_stat: species.base_values.hitpoints, iv: individual_values.hitpoints, ev: effort_values.hitpoints, level:level ),
         attack: calcul_stat_other(base_stat: species.base_values.attack, iv: individual_values.attack, ev: effort_values.attack, level:level, nature:1),
         defense: calcul_stat_other(base_stat: species.base_values.defense, iv: individual_values.defense, ev: effort_values.defense, level:level, nature:1),
         special_attack: calcul_stat_other(base_stat: species.base_values.special_attack, iv: individual_values.special_attack, ev: effort_values.special_attack, level:level, nature:1),
         special_defense: calcul_stat_other(base_stat: species.base_values.special_defense, iv: individual_values.special_defense, ev: effort_values.special_defense, level:level, nature:1),
         speed: calcul_stat_other(base_stat: species.base_values.speed, iv: individual_values.speed, ev: effort_values.speed, level:level, nature:1))

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
func typeModifier(attacking: Type, defending : Type) -> Double {
    // TODO: encode type/type chart
    return 1
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
