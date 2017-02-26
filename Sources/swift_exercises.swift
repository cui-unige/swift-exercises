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

// ############### NATURE COEFFICIENT MODIFIER ############### //

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

// ############################################################ //

// ############### SPECIES ############### //

/* We only implement a few moves for Charizard - at the moment - */

let moveAirSlash = Move(id: 403, name: "Air Slash", description: "Air Slash deals damage and has a 30% chance of causing the target to flinch", category: Category.special, type: Type.flying, power: 75, accuracy: 95, powerpoints: 20, priority: 0)

let moveDragonClaw = Move(id: 337, name: "Dragon Claw", description: "Dragon Claw deals damage with no additional effect.", category: Category.physical, type: Type.dragon, power: 80, accuracy: 100, powerpoints: 15, priority: 0)

let moveEmber = Move(id: 52, name: "Ember", description: "Ember deals damage and has a 10% chance of burning the target.", category: Category.special, type: Type.fire, power: 40, accuracy: 100, powerpoints: 25, priority: 0)

let moveFlareBlitz = Move(id: 394, name: "Flare Blitz", description: "Flare Blitz deals damage and has a 10% chance of burning the target, but the user receives 1⁄3 of the damage it inflicted in recoil. In other words, if the attack does 90 HP damage to the opponent, the user will lose 30 HP.", category: Category.physical, type: Type.fire, power: 120, accuracy: 100, powerpoints: 15, priority: 0)

let moveGrowl = Move(id: 45, name: "Growl", description: "Growl lowers the target's Attack by one stage.", category: Category.status, type: Type.normal, power: 0, accuracy: 100, powerpoints: 40, priority: 0)

let moveHeatWave = Move(id: 257, name: "Heat Wave", description: "Heat Wave deals damage and has a 10% chance of burning the target.", category: Category.special, type: Type.fire, power: 95, accuracy: 90, powerpoints: 10, priority: 0)

let charizardBaseValues = Stats(hitpoints: 78, attack: 84, defense: 78, special_attack: 109, special_defense: 85, speed: 100)

let charizardEffortValues = Stats(hitpoints: 0, attack: 0, defense: 0, special_attack: 3, special_defense: 0, speed: 0)

let charizard = Species(id: 006, name: "Charizard", evolutions: [], attacks: [moveAirSlash, moveDragonClaw, moveEmber, moveFlareBlitz, moveGrowl, moveHeatWave], type: (Type.fire, Type.flying), base_values: charizardBaseValues)

// ###################################### //

// ############### COMPUTING EFFECTIVE STATS ############### //

func setEffectiveStat(lvl: Int, base: Int, individual: Int, effort: Int, nature_mode: Double) -> Int {
    return Int(floor((Double((2 * base + individual + effort) * lvl))/Double(100) + 5) * nature_mode)
}
func setEffectiveHp(lvl: Int, base: Int, individual: Int, effort: Int) -> Int {
    return Int((Double((2 * base + individual + effort) * lvl)) / Double(100)) + lvl + 10
}

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
            let effectiveHitpoints = setEffectiveHp(lvl: level, base: species.base_values.hitpoints, individual: individual_values.hitpoints, effort: effort_values.hitpoints)
            let effectiveAttack = setEffectiveStat(lvl: level, base: species.base_values.attack, individual: individual_values.attack, effort: effort_values.attack, nature_mode: (nature_coeff[nature]?.attack)!)
            let effectiveDefense = setEffectiveStat(lvl: level, base: species.base_values.defense, individual: individual_values.defense, effort: effort_values.defense, nature_mode: (nature_coeff[nature]?.defense)!)
            let effectiveSpecialAttack = setEffectiveStat(lvl: level, base: species.base_values.special_attack, individual: individual_values.special_attack, effort: effort_values.special_attack, nature_mode: (nature_coeff[nature]?.special_attack)!)
            let effectiveSpecialDefense = setEffectiveStat(lvl: level, base: species.base_values.special_defense, individual: individual_values.special_defense, effort: effort_values.special_defense, nature_mode: (nature_coeff[nature]?.special_defense)!)
            let effectiveSpeed = setEffectiveStat(lvl: level, base: species.base_values.speed, individual: individual_values.speed, effort: effort_values.speed, nature_mode: (nature_coeff[nature]?.speed)!)
            return Stats(hitpoints: effectiveHitpoints, attack: effectiveAttack, defense: effectiveDefense, special_attack: effectiveSpecialAttack, special_defense: effectiveSpecialDefense, speed: effectiveSpeed)
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

// ############### TYPE COEFFICIENT MODIFIER ############### //

let type_mode: [Type: [Type: Double]] = [
    Type.normal: [.normal: 1, .fighting: 1, .flying: 1, .poison: 1, .ground: 1, .rock: 0.5, .bug: 1, .ghost:0, .steel: 0.5, .fire: 1, .water: 1, .grass: 1, .electric: 1, .psychic: 1, .ice: 1, .dragon: 1, .dark: 1, .fairy: 1],
    Type.fighting: [.normal: 2, .fighting: 1, .flying: 0.5, .poison: 0.5, .ground: 1, .rock: 2, .bug: 0.5, .ghost:0, .steel: 2, .fire: 1, .water: 1, .grass: 1, .electric: 1, .psychic: 0.5, .ice: 2, .dragon: 1, .dark: 2, .fairy: 0.5],
    Type.flying: [.normal: 1, .fighting: 2, .flying: 1, .poison: 1, .ground: 1, .rock: 0.5, .bug: 2, .ghost: 1, .steel: 0.5, .fire: 1, .water: 1, .grass: 2, .electric: 0.5, .psychic: 1, .ice: 1, .dragon: 1, .dark: 1, .fairy: 1],
    Type.poison: [.normal: 1, .fighting: 1, .flying: 1, .poison: 0.5, .ground: 0.5, .rock: 0.5, .bug: 1, .ghost: 0.5, .steel:0, .fire: 1, .water: 1, .grass: 2, .electric: 1, .psychic: 1, .ice: 1, .dragon: 1, .dark: 1, .fairy: 2],
    Type.ground: [.normal: 1, .fighting: 1, .flying:0, .poison: 2, .ground: 1, .rock: 2, .bug: 0.5, .ghost: 1, .steel: 2, .fire: 2, .water: 1, .grass: 0.5, .electric: 2, .psychic: 1, .ice: 1, .dragon: 1, .dark: 1, .fairy: 1],
    Type.rock: [.normal: 1, .fighting: 0.5, .flying: 2, .poison: 1, .ground: 0.5, .rock: 1, .bug: 2, .ghost: 1, .steel: 0.5, .fire: 2, .water: 1, .grass: 1, .electric: 1, .psychic: 1, .ice: 2, .dragon: 1, .dark: 1, .fairy: 1],
    Type.bug: [.normal: 1, .fighting: 0.5, .flying: 0.5, .poison: 0.5, .ground: 1, .rock: 1, .bug: 1, .ghost: 0.5, .steel: 0.5, .fire: 0.5, .water: 1, .grass: 2, .electric: 1, .psychic: 2, .ice: 1, .dragon: 1, .dark: 2, .fairy: 0.5],
    Type.ghost: [.normal:0, .fighting: 1, .flying: 1, .poison: 1, .ground: 1, .rock: 1, .bug: 1, .ghost: 2, .steel: 1, .fire: 1, .water: 1, .grass: 1, .electric: 1, .psychic: 2, .ice: 1, .dragon: 1, .dark: 0.5, .fairy: 1],
    Type.steel: [.normal: 1, .fighting: 1, .flying: 1, .poison: 1, .ground: 1, .rock: 2, .bug: 1, .ghost: 1, .steel: 0.5, .fire: 0.5, .water: 0.5, .grass: 1, .electric: 0.5, .psychic: 1, .ice: 2, .dragon: 1, .dark: 1, .fairy: 2],
    Type.fire: [.normal: 1, .fighting: 1, .flying: 1, .poison: 1, .ground: 1, .rock: 0.5, .bug: 2, .ghost: 1, .steel: 2, .fire: 0.5, .water: 0.5, .grass: 2, .electric: 1, .psychic: 1, .ice: 2, .dragon: 0.5, .dark: 1, .fairy: 1],
    Type.water: [.normal: 1, .fighting: 1, .flying: 1, .poison: 1, .ground: 2, .rock: 2, .bug: 1, .ghost: 1, .steel: 1, .fire: 2, .water: 0.5, .grass: 0.5, .electric: 1, .psychic: 1, .ice: 1, .dragon: 0.5, .dark: 1, .fairy: 1],
    Type.grass: [.normal: 1, .fighting: 1, .flying: 0.5, .poison: 0.5, .ground: 2, .rock: 2, .bug: 0.5, .ghost: 1, .steel: 0.5, .fire: 0.5, .water: 2, .grass: 0.5, .electric: 1, .psychic: 1, .ice: 1, .dragon: 0.5, .dark: 1, .fairy: 1],
    Type.electric: [.normal: 1, .fighting: 1, .flying: 2, .poison: 1, .ground:0, .rock: 1, .bug: 1, .ghost: 1, .steel: 1, .fire: 1, .water: 2, .grass: 0.5, .electric: 0.5, .psychic: 1, .ice: 1, .dragon: 0.5, .dark: 1, .fairy: 1],
    Type.psychic: [.normal: 1, .fighting: 2, .flying: 1, .poison: 2, .ground: 1, .rock: 1, .bug: 1, .ghost: 1, .steel: 0.5, .fire: 1, .water: 1, .grass: 1, .electric: 1, .psychic: 0.5, .ice: 1, .dragon: 1, .dark:0, .fairy: 1],
    Type.ice: [.normal: 1, .fighting: 1, .flying: 2, .poison: 1, .ground: 2, .rock: 1, .bug: 1, .ghost: 1, .steel: 0.5, .fire: 0.5, .water: 0.5, .grass: 2, .electric: 1, .psychic: 1, .ice: 0.5, .dragon: 2, .dark: 1, .fairy: 1],
    Type.dragon: [.normal: 1, .fighting: 1, .flying: 1, .poison: 1, .ground: 1, .rock: 1, .bug: 1, .ghost: 1, .steel: 0.5, .fire: 1, .water: 1, .grass: 1, .electric: 1, .psychic: 1, .ice: 1, .dragon: 2, .dark: 1, .fairy:0],
    Type.dark: [.normal: 1, .fighting: 0.5, .flying: 1, .poison: 1, .ground: 1, .rock: 1, .bug: 1, .ghost: 2, .steel: 1, .fire: 1, .water: 1, .grass: 1, .electric: 1, .psychic: 2, .ice: 1, .dragon: 1, .dark: 0.5, .fairy: 0.5],
    Type.fairy: [.normal: 1, .fighting: 2, .flying: 1, .poison: 0.5, .ground: 1, .rock: 1, .bug: 1, .ghost: 1, .steel: 0.5, .fire: 0.5, .water: 1, .grass: 1, .electric: 1, .psychic: 1, .ice: 1, .dragon: 2, .dark: 2, .fairy: 1]
]

// ###################################### //

func typeModifier(attacking: Type, defending : Type) -> Double {
     return (type_mode[attacking]?[defending])!
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
