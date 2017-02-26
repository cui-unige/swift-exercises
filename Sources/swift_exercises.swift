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
    
    
    // All the following variables are used to calculate the "modifier" variable in order to get the damage resulting from the attack performed by the pokemons
    
    let STAB: Double //STAB is the same-type attack bonus. This is equal to 1.5 if the attack is of the same type as the user, and 1 if otherwise.
    var other: Double = 1 //Counts for things like held items, Abilities, field advantages, and whether the battle is a Double Battle or Triple Battle or not.
    var rand1 = arc4random_uniform(85..100)
    let random: Double = rand1/100 //is a random number from 0.85 to 1.00.
    let rand2 = arc4random_uniform(2..4)
    let critical: Double = rand2/2 //Critical is 2 for a critical hit in Generations I-V, 1.5 for a critical hit from Generation VI onwards, and 1 otherwise.
    var base = Double(move.power)
    let type_effectiveness: Double
    
    let secondType = target.species.type.1 //If the target pokemon has 2 types, then we need to consider it
    if secondType {
        type_effectiveness = typeModifier(attacking: move.type, defending: target.species.type.0) * typeModifier(attacking: move.type, defending: secondType)
    } else { //If the pokemon has only one type
        type_effectiveness = typeModifier(attacking: move.type, defending: target.species.type.0)
    }
    
    
    if move.type == pokemon.species.type.0 || move.type == pokemon.species.type.1 { //Same type attack bonus?
        STAB = 1.5
    } else {
        STAB = 1
    }
    
    //Now, we determine the value of the variable "other" with a switch concerning the environment
    
    switch environment.weather{
        case .rain(let heavy):
            if move.type == .fire {
                if heavy {
                    other = 0 //Fire-type moves cannot be executed
                } else {
                    base = base * 0.5 //Fire-type moves do 50% less damage.
                }
            }
            if move.type == .water {
                base = base * 1.5 //Water-type moves do 50% more damage
            }
        
        case .harsh_sunlight(let extremely):
            if move.type == .water {
                if extremely {
                    other = 0 //Water-type moves cannot be executed
                }
                else {
                    base = base * 0.5 //Water-type moves do 50% less damage
                }
                if move.type == .fire {
                    base = base * 1.5 //Fire-type moves do 50% more damage
                }

            }
        case .mysterious_air_current: //A mysterious air current halves all super-effective damage done to Flying-type Pokémon
            if ((target.species.type.0 == .flying || target.species.type.1 == .flying) && type_effectiveness == 2) {
                other = other * 0.5
            }
        default:
            break
    }
    
    switch environment.terrain{
        case .normal:
            other = other //No changes
        case .electric:
            if (pokemon.moves.type == .electric && (pokemon.species.type.0 != .flying || pokemon.species.type.1 != .flying)) {
                other = other * 1.5 // Electric Terrain increases the power of Electric-type moves used by grounded Pokémon by 50%
            }
            if (target.species.type.0 == .electric || target.species.type.1 == .electric){
                other = other * 0.5 // Decreases the damages on targeted pokemon if he's of type electric
            }
        case .grassy:
            if (pokemon.moves.type == .grass && (pokemon.species.type.0 != .flying || pokemon.species.type.1 != .flying)) {
                other = other * 1.5 // Grassy Terrain increases the power of grass-type moves used by grounded Pokémon by 50%
            }
            if (target.species.type.0 == .grass || target.species.type.1 == .grass){
                other = other * 0.5 // Decreases the damages on targeted pokemon if he's of type grass
            }
        case .psychic:
            if (pokemon.moves.type == .psychic && (pokemon.species.type.0 != .flying || pokemon.species.type.1 != .flying)) {
                other = other * 1.5 // Psychic Terrain increases the power of psychic-type moves used by grounded Pokémon by 50%
            }
            if (target.species.type.0 == .psychic || target.species.type.1 == .psychic){
                other = other * 0.5 // Decreases the damages on targeted pokemon if he's of type psychic
            }
        case .misty:
            if (pokemon.moves.type == .dragon && (target.species.type.0 != .flying || target.species.type.1 != .flying)) {
                other = other * 0.5 // Mistic Terrain decreases the power of dragon-type moves against grounded pokemons by 50%
            }
    }
    
    //Now we can compute the final value of the damages done:
    
    let modifier = STAB * type_effectiveness * critical * other * random
    let finalDamage = Int(((Double(2*pokemon.level+10) * attack / defense / 250 * base) + 2) * modifier)
    
    return finalDamage
}

struct State {
    // TODO: describe a battle state
}

func battle(trainers: inout [Trainer], behavior: (State, Trainer) -> Move) -> () {
    // TODO: simulate battle
}
