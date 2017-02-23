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

let curse = Move(id: 1,name: "curse",description: "Curse (Japanese: のろい Curse/Slow) is a non-damaging Ghost-type move introduced in Generation II. Prior to Generation V, it was a ???-type move, and the only move of that type. It was TM03 in Generation II. ",category: Category.status,type: Type.ghost,power: 0,accuracy: 0,powerpoints: 10,priority: 0)
let aeroblast = Move(id: 2,name: "aeroblast",description: "Aeroblast (Japanese: エアロブラスト Aeroblast) is a damage-dealing Flying-type move introduced in Generation II. It is the signature move of Lugia. ",category: Category.special,type: Type.flying,power: 100,accuracy: 95,powerpoints: 5,priority: 0)
let earthquake = Move(id: 3,name: "earthquake",description: "Earthquake (Japanese: じしん Earthquake) is a damage-dealing Ground-type move introduced in Generation I. It is TM26 in all generations so far. ",category: Category.physical,type: Type.ground,power: 100,accuracy: 100,powerpoints: 10,priority: 0)
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
