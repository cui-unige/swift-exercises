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

// ############### SPECIES ############### //

/* We only implement a few moves for Charizard - at the moment - */

let moveAirSlash = Move(id: 403, name: "Air Slash", description: "Air Slash deals damage and has a 30% chance of causing the target to flinch", category: Category.special, type: Type.flying, power: 75, accuracy: 95, powerpoints: 20, priority: 0)

let moveDragonClaw = Move(id: 337, name: "Dragon Claw", description: "Dragon Claw deals damage with no additional effect.", category: Category.physical, type: Type.dragon, power: 80, accuracy: 100, powerpoints: 15, priority: 0)

let moveEmber = Move(id: 52, name: "Ember", description: "Ember deals damage and has a 10% chance of burning the target.", category: Category.special, type: Type.fire, power: 40, accuracy: 100, powerpoints: 25, priority: 0)

let moveFlareBlitz = Move(id: 394, name: "Flare Blitz", description: "Flare Blitz deals damage and has a 10% chance of burning the target, but the user receives 1⁄3 of the damage it inflicted in recoil. In other words, if the attack does 90 HP damage to the opponent, the user will lose 30 HP.", category: Category.physical, type: Type.fire, power: 120, accuracy: 100, powerpoints: 15, priority: 0)

let moveGrowl = Move(id: 45, name: "Growl", description: "Growl lowers the target's Attack by one stage.", category: Category.status, type: Type.normal, power: 0, accuracy: 100, powerpoints: 40, priority: 0)

let moveHeatWave = Move(id: 257, name: "Heat Wave", description: "Heat Wave deals damage and has a 10% chance of burning the target.", category: Category.special, type: Type.fire, power: 95, accuracy: 90, priority: 0)

let charizardBaseValues = Stats(hitpoints: 78, attack: 84, defense: 78, special_attack: 109, special_defense: 85, speed: 100)

let charizardEffortValues = Stats(hitpoints: 0, attack: 0, defense: 0, special_attack: 3, special_defense: 0, speed: 0)

let charizard = Species(id: 006, name: "Charizard", evolutions: [], attacks: [moveAirSlash, moveDragonClaw, moveEmber, moveFlareBlitz, moveGrowl, moveHeatWave], type: (Type.fire, Type.flying), base_values: charizardBaseValues)

// ###################################### //

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
    var effective_stats   : Stats { //Computed property
        get {
            let hitpoints = ((2*species.base_values.hitpoints + individual_values.hitpoints + (effort_values.hitpoints/4).rouded())*level/100).rounded() + level + 10
            let attack = ((((2*species.base_values.attack + individual_values.attack + (effort_values.attack/4).rouded())*level/100).rounded() + 5)*nature).rounded()
            let defense = ((((2*species.base_values.defense + individual_values.defense + (effort_values.defense/4).rouded())*level/100).rounded() + 5)*nature).rounded()
            let special_attack = ((((2*species.base_values.special_attack + individual_values.special_attack + (effort_values.special_attack/4).rouded())*level/100).rounded() + 5)*nature).rounded()
            let special_defense = ((((2*species.base_values.special_defense + individual_values.special_defense + (effort_values.special_defense/4).rouded())*level/100).rounded() + 5)*nature).rounded()
            let speed = ((((2*species.base_values.speed + individual_values.speed + (effort_values.speed/4).rouded())*level/100).rounded() + 5)*nature).rounded()
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
}

func battle(trainers: inout [Trainer], behavior: (State, Trainer) -> Move) -> () {
    // TODO: simulate battle
}
