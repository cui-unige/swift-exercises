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
let FireBlast = Move(id: 1, name: "Fire BLast", description: "30% chance to burn the target.", category: Category.special, type: Type.fire, power: 120, accuracy: 85, powerpoints: 5, priority: 0)
let BodySlam = Move(id: 2, name: "Roar", description: "30% chance to paralyze the target", category: Category.physical, type: Type.normal, power: 85, accuracy: 100, powerpoints: 15, priority: 0)
let HyperBeam = Move(id: 3, name: "Hyper Beam", description: "User cannot move next turn, unless opponent or Substitute was KOed.", category: Category.physical, type: Type.normal, power: 150, accuracy: 90, powerpoints: 5, priority: 0)
let Reflect = Move(id: 4, name: "Reflect", description: "Lowers the physical damage done to user.", category: Category.status, type: Type.psychic, power: 0, accuracy: 0, powerpoints: 20, priority: 0)
let stats = Stats(hitpoints: 90, attack: 110, defense: 80, special_attack: 80, special_defense: 80, speed: 95)

let attacks: Set = [FireBlast, BodySlam, HyperBeam, Reflect]
let arcanine = Species(id: 59, name: "Jack", evolutions: [], attacks: attacks, type: (Type.fire, nil), base_values: stats)

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
    var effective_stats   : Stats {
      get{
      let effective_HP = ( (2 * self.hitpoints + self.individual_values.hitpoints + floor(self.effort_values.hitpoints/4)) * level)/100)+level+10
      let effective_attack = ( (2 * self.attack + self.individual_values.attack + floor(self.effort_values.attack/4)) * level)/100)+level+10
      let effective_defense = ( (2 * self.defense + self.individual_values.defense + floor(self.effort_values.defense/4)) * level)/100) + level 10
      let effective_special_attack = ( (2 * self.special_attack + self.individual_values.special_attack + floor(self.effort_values.special_attack/4)) * level)/100)+level+10
      let effective_special_defense = ( (2 * self.special_defense + self.individual_values.special_defense + floor(self.effort_values.special_defense/4)) * level)/100)+level+10
      let effective_speed = ( (2 * self.speed + self.individual_values.speed + floor(self.effort_values.speed/4)) * level)/100)+level+10
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
    // 2 entraineurs, 2 pokemons actifs,
}

func battle(trainers: inout [Trainer], behavior: (State, Trainer) -> Move) -> () {
    // TODO: simulate battle
}
