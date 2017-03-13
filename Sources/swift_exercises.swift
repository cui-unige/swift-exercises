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
let pound_move = Move(id:1,name:"pound",description:"touch ",category:Category.physical,type:Type.normal,power:40,accuracy:100,powerpoints:35,priority:0)
let karate_move = Move(id:2,name:"karate chop",description:"touch ",category:Category.physical,type:Type.fighting,power:50,accuracy:100,powerpoints:25,prioriy:0)
let ice_punch_move = Move(id:8,name:"ice punch",description:" beautiful",category:Category.physical,type:Type.normal,power:75,accuracy:100,powerpoints:15,priority:0)
let fly_move = Move(id:19,name:"fly",description:" clever",category:Category.physical,type:Type.flying,power:90,accuracy:95,powerpoints:15,priority:0)
let switch_move = Move(id:14,name:"Swords dance",description:" beautiful",category:Category.status,type:Type.normal,power:20,accuracy:0,powerpoints:0,priority:0)

let florizarre_specie = Species(id:001 ,name: "florizarre", evolutions:[],attacks:[pound_move,switch_move],type:( Type.poison ,nil), base_values:Stats(hitpoints:80,attack:82,defense:83,special_attack:100,special_defense:100,speed:80))
let herbizarre_specie = Species(id:002, name:"herbizzare",evolutions:[florizarre_specie],attacks:[karate_move,fly_move],type:(Type.poison,nil),base_values:Stats(hitpoints:60,attack:62,defense:63,special_attack:80,special_defense:80,speed:60))
let bulbizarre_specie = Species(id:003, name:"bulbizarre", evolutions:[florizarre_specie,herbizarre_specie],attacks:[pound_move,fly_move],type:(Type.poison,nil),base_values:Stats(hitpoints:45,attack:49,defense:49,special_attack:65,special_defense:65,speed:45) )
let poissiroy_specie = Species(id:119,name:"poissiroy",evolutions:[],attacks:[switch_move ,pound_move],type:(Type.water,nil),base_values:Stats(hitpoints:140,atack:87,defense:63,special_attack:63,special_defense:76,speed:65))


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
    // var effective_stats   : Stats {
    // }
    let base :Stats(Species.base_values.hitpoints,Species.base_values.attack,Species.base_values.defense,
    Species.base_values.special_attack,Species.base_values.special_defense,Species.base_values.speed)
    let iv :Stats(individual_values.hitpoints,individual_values.attack,individual_values.defense,
    individual_values.special_attack,individual_values.special_defense,individual_values.speed)
    let ev :Stats(effort_values.hitpoints,effort_values.attack,effort_values.defense,effort_values.special_attack,
    effort_values.special_defense,effort_values.speed)

    func other_stat(base:int , iv:int, ev:int ,levl : int)-> int{
    let ostat = (((base + iv )*2 + ev/4)*levl/100)+ levl +10
    return int(ostat)
    }
    fun point_vie(base:int , iv:int, ev:int ,levl : int)-> int{
      let pv = (((base + iv )*2 + ev/4)*levl/100)+5
      return int(pv)
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
