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
    var powerpoints : Int //We will decrease by 1 the powerpoints of the move once used
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

// ############### SPECIES ############### //

/* We only implement a few moves for Charizard - at the moment - */

let moveAirSlash = Move(id: 403, name: "Air Slash", description: "Air Slash deals damage and has a 30% chance of causing the target to flinch", category: Category.special, type: Type.flying, power: 75, accuracy: 95, powerpoints: 20, priority: 0)

let moveDragonClaw = Move(id: 337, name: "Dragon Claw", description: "Dragon Claw deals damage with no additional effect.", category: Category.physical, type: Type.dragon, power: 80, accuracy: 100, powerpoints: 15, priority: 0)

let moveEmber = Move(id: 52, name: "Ember", description: "Ember deals damage and has a 10% chance of burning the target.", category: Category.special, type: Type.fire, power: 40, accuracy: 100, powerpoints: 25, priority: 0)

let moveFlareBlitz = Move(id: 394, name: "Flare Blitz", description: "Flare Blitz deals damage and has a 10% chance of burning the target, but the user receives 1⁄3 of the damage it inflicted in recoil. In other words, if the attack does 90 HP damage to the opponent, the user will lose 30 HP.", category: Category.physical, type: Type.fire, power: 120, accuracy: 100, powerpoints: 15, priority: 0)

let moveGrowl = Move(id: 45, name: "Growl", description: "Growl lowers the target's Attack by one stage.", category: Category.status, type: Type.normal, power: 0, accuracy: 100, powerpoints: 40, priority: 0)

let moveHeatWave = Move(id: 257, name: "Heat Wave", description: "Heat Wave deals damage and has a 10% chance of burning the target.", category: Category.special, type: Type.fire, power: 95, accuracy: 90, powerpoints: 10, priority: 0)

let allAttacksCharizard = [moveAirSlash, moveDragonClaw, moveEmber, moveFlareBlitz, moveGrowl, moveHeatWave]

let charizardBaseValues = Stats(hitpoints: 78, attack: 84, defense: 78, special_attack: 109, special_defense: 85, speed: 100)

let charizardIndividualValues = Stats(hitpoints: 82, attack: 89, defense: 75, special_attack: 119, special_defense: 82, speed: 110)

let charizardEffortValues = Stats(hitpoints: 0, attack: 0, defense: 0, special_attack: 3, special_defense: 0, speed: 0)

let charizardSpecie = Species(id: 006, name: "Charizard", evolutions: [], attacks: allAttacksCharizard, type: (Type.fire, Type.flying), base_values: charizardBaseValues)

// ####### Other pokemons - given by Arthur ########## //

let bubble = Move(
    id: 1,
    name: "Bubble",
    description: "A spray of countless bubbles is jetted at the opposing Pokémon. This may also lower their Speed stat.",
    category: Category.special,
    type: Type.water,
    power: 40,
    accuracy: 100,
    powerpoints: 30,
    priority: 1
)

let water_gun = Move(
    id: 2,
    name: "Water Gun",
    description: "The target is blasted with a forceful shot of water.",
    category: Category.special,
    type: Type.water,
    power: 40,
    accuracy: 100,
    powerpoints: 25,
    priority: 1
)

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

// ####### Other pokemons - given by Aslam ########## //


// Raichu Stats
let raichuBaseValues = Stats(hitpoints: 60, attack: 90, defense: 55, special_attack: 90,special_defense: 80, speed: 110)

let raichuIndividualValues = Stats(
    hitpoints: 58,
    attack: 94,
    defense: 53,
    special_attack: 91,
    special_defense: 80,
    speed: 110
)

let raichuEffortValues = Stats(
    hitpoints: 0,
    attack: 0,
    defense: 0,
    special_attack: 0,
    special_defense: 0,
    speed: 3
)


// Raichu Species
let raichuSpecie = Species(id: 026,
                     name: "Raichu",
                     evolutions: [],
                     attacks: [thunderShockAttack],
                     type: (.electric, nil),
                     base_values: raichuBaseValues
)

// Pikachu Stats
let pikachuBaseValues = Stats(hitpoints: 35, attack: 55, defense: 30, special_attack: 50,special_defense: 40, speed: 90)

let pikachuIndividualValues = Stats(
    hitpoints: 33,
    attack: 53,
    defense: 34,
    special_attack: 51,
    special_defense: 39,
    speed: 93
)

let pikachuEffortValues = Stats(
    hitpoints: 0,
    attack: 0,
    defense: 0,
    special_attack: 0,
    special_defense: 0,
    speed: 2
)


// Pikachu moves
let thunderShockAttack = Move(id: 84,
                              name: "Thunder Shock",
                              description: "paralyze target",
                              category: .special,
                              type: .electric,
                              power:40,
                              accuracy:100,
                              powerpoints:30,
                              priority:0
)

// Pikachu Species
let pikachuSpecie = Species(id: 025,
                      name: "Pikachu",
                      evolutions: [raichuSpecie],
                      attacks: [thunderShockAttack],
                      type: (.electric, nil),
                      base_values: pikachuBaseValues
)

let allAttacksPikachu = [thunderShockAttack]

// ############### COMPUTING EFFECTIVE STATS ############### //

func setEffectiveStat(lvl: Int, base: Int, individual: Int, effort: Int, nature_mode: Double) -> Int {
    return Int(floor((Double((2 * base + individual + effort) * lvl))/Double(100) + 5) * nature_mode)
}
func setEffectiveHp(lvl: Int, base: Int, individual: Int, effort: Int) -> Int {
    return Int((Double((2 * base + individual + effort/4 ) * lvl)) / Double(100)) + lvl + 10
}

struct Pokemon {
    let nickname          : String
    var hitpoints         : Int // remaining hitpoints
    let size              : Int
    let weight            : Int
    let experience        : Int
    let level             : Int
    let nature            : Nature
    let species           : Species
    let moves             : [Move] // Move
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
    let name : String
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

//Function used to generate random numbers. Credits to http://stackoverflow.com/questions/24256564/generating-random-values-in-swift-between-two-integer-values

func randomNumber(min: Int, max: Int) -> Int {
    let randomNum = Int(arc4random_uniform(UInt32(max) - UInt32(min)) + UInt32(min))
    return randomNum
}


func typeModifier(attacking: Type, defending : Type) -> Double {
     return (type_mode[attacking]?[defending])!
}

// http://bulbapedia.bulbagarden.net/wiki/Damage

// ############### DAMAGE FUNCTION CALCULATION ############### //

func damage(environment : Environment, pokemon: Pokemon, move: Move, target: Pokemon) -> Int {
    
    let attack = Double(move.category == .physical ? pokemon.effective_stats.attack : pokemon.effective_stats.special_attack)
    let defense = Double(move.category == .physical ? target.effective_stats.defense : target.effective_stats.special_defense)
    
    // All the following variables are used to calculate the "modifier" variable in order to get the damage resulting from the attack performed by the pokemons
    
    let STAB: Double //STAB is the same-type attack bonus. This is equal to 1.5 if the attack is of the same type as the user, and 1 if otherwise.
    var other: Double = 1 //Counts for things like held items, Abilities, field advantages, and whether the battle is a Double Battle or Triple Battle or not.
    var base = Double(move.power)
    let type_effectiveness: Double
    
    let rand1 = Double(randomNumber(min: 85, max: 100))
    let random: Double = rand1/100 //is a random number from 0.85 to 1.00.
    let rand2 = Double(randomNumber(min: 2, max:4))
    let critical: Double = rand2/2 //Critical is 2 for a critical hit in Generations I-V, 1.5 for a critical hit from Generation VI onwards, and 1 otherwise.

    
    if let secondType = target.species.type.1 { //If the target pokemon has 2 types, then we need to consider it
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
        case .electric:
            if (move.type == .electric && (pokemon.species.type.0 != .flying || pokemon.species.type.1 != .flying)) {
                other = other * 1.5 // Electric Terrain increases the power of Electric-type moves used by grounded Pokémon by 50%
            }
            if (target.species.type.0 == .electric || target.species.type.1 == .electric){
                other = other * 0.5 // Decreases the damages on targeted pokemon if he's of type electric
            }
        case .grassy:
            if (move.type == .grass && (pokemon.species.type.0 != .flying || pokemon.species.type.1 != .flying)) {
                other = other * 1.5 // Grassy Terrain increases the power of grass-type moves used by grounded Pokémon by 50%
            }
            if (target.species.type.0 == .grass || target.species.type.1 == .grass){
                other = other * 0.5 // Decreases the damages on targeted pokemon if he's of type grass
            }
        case .psychic:
            if (move.type == .psychic && (pokemon.species.type.0 != .flying || pokemon.species.type.1 != .flying)) {
                other = other * 1.5 // Psychic Terrain increases the power of psychic-type moves used by grounded Pokémon by 50%
            }
            if (target.species.type.0 == .psychic || target.species.type.1 == .psychic){
                other = other * 0.5 // Decreases the damages on targeted pokemon if he's of type psychic
            }
        case .misty:
            if (move.type == .dragon && (target.species.type.0 != .flying || target.species.type.1 != .flying)) {
                other = other * 0.5 // Mistic Terrain decreases the power of dragon-type moves against grounded pokemons by 50%
            }
        default:
            break
    }
    
    //Now we can compute the final value of the damages done:
    
    let modifier = STAB * type_effectiveness * critical * other * random
    let finalDamage = Int(((Double(2*pokemon.level+10) * attack / defense / 250 * base) + 2) * modifier)
    
    return finalDamage
}

// ############### STRUCT STATE ############### //

struct State {
    let player1: Trainer
    let player2: Trainer
    var pokemonAttack: Pokemon
    var pokemonDefense: Pokemon
    var pokemonMoveAttack: Move
    var pokemonMoveDefense: Move
    var pokemonEnvironment: Environment
}

// ############### INITIALIZATION ############### //

// ############### POKEMONS ############# //

let charizard = Pokemon(nickname: "Jack",
                        hitpoints: 82, size: 12, weight: 3000, experience: 0, level: 1,
                        nature: Nature.sassy, species: charizardSpecie, moves: allAttacksCharizard,
                        individual_values: charizardIndividualValues, effort_values: charizardEffortValues)


let squirtle = Pokemon(nickname: "Arthur",
                          hitpoints: 47, size: 3, weight: 300, experience: 0, level: 1,
                          nature: Nature.calm, species: squirtleSpecie, moves: allAttacksSquirtle,
                          individual_values: squirtleIndividualValues, effort_values: squirtleEffortValues)

let raichu = Pokemon(nickname: "Aslam",
                       hitpoints: 62, size: 5, weight: 750, experience: 0, level: 1,
                       nature: Nature.rash, species: raichuSpecie, moves: allAttacksPikachu,
                       individual_values: raichuIndividualValues, effort_values: raichuEffortValues)

let pikachu = Pokemon(nickname: "Amir",
                       hitpoints: 36, size: 2, weight: 100, experience: 0, level: 1,
                       nature: Nature.docile, species: pikachuSpecie, moves: allAttacksPikachu,
                       individual_values: pikachuIndividualValues, effort_values: pikachuEffortValues)

// ####################################### //

let todaysEnvironnement = Environment(weather: Weather.sandstorm, terrain: Terrain.grassy)

var Bob = Trainer(name: "Bob", pokemons:[raichu, charizard, pikachu])
var Alice = Trainer(name: "Alice", pokemons: [squirtle])

var trainers=[Bob, Alice];

var damages: Int = 0
var round: Int=0
var userInput: String! = "";

// ############### BATTLE ############### //


let randInt = randomNumber(min:0, max: allAttacksSquirtle.count - 1) //So that we can randomly determine which attack is going to be perfomed

var currentState = State(player1: Bob, player2: Alice, pokemonAttack: Bob.pokemons[0], //Default pokemon selected for Bob : first one
                         pokemonDefense: Alice.pokemons[0], pokemonMoveAttack: allAttacksPikachu[randInt],
                         pokemonMoveDefense: allAttacksSquirtle[randInt], pokemonEnvironment: todaysEnvironnement)

var turn: Int = 1 //turn = 1 means player1 is attacking, otherwise player2

func firstPok(pokemonAttack: Pokemon, pokemonDefense: Pokemon, currentState: State) -> (){
    if currentState.pokemonAttack.effective_stats.speed > currentState.pokemonDefense.effective_stats.speed{ // Pour savoir qui commence
        turn = 1
    } else {
        turn = -1
    }
}

// In our implementation, we play the roll of Bob. Alice's pokemon and moves are randomly selected

func go() -> (){
    
    print("\n##### MAIN BATTLE SCREEN #####\n");
    print("Please select an option");
    print("1. Fight         2. Bag         3. Pokemon         4. Run\n")
    
    let choice: String!
    choice = readLine()
    
    if (choice == "4"){
        print("Player ran away (such a coward...) !\n")
        abort()
    }
    
    else if (choice == "2"){
        print("Nothing to display. Back to main menu\n")
        go()
    }
    
    else if (choice == "3"){
        print("Please select the Pokemon which you want to battle with :\n")
        
        //Getting user's entry to select pokemon
        
        for i in 0...(Bob.pokemons.count - 1){
            let currentPokemon = Bob.pokemons[i]
            print("\(i+1) name: \(currentPokemon.nickname) | specie: \(currentPokemon.species.name)")
        }
        
        if let typed = readLine() {
            if let num = Int(typed) {
                currentState.pokemonAttack = Bob.pokemons[num-1] //Selecting appropriate Pokemon
            }
        }
        
        print("Pokemon successfully selected. Back to main menu. Enter 1 to fight.\n")
        
        go()
    }
    
    else if (choice == "1"){
        firstPok(pokemonAttack: currentState.pokemonAttack, pokemonDefense: currentState.pokemonDefense,   currentState: currentState)
        battle(trainers: &trainers)
    }
    
    else {
        print("Specified option does not exist. Please pay attention !\n")
        go()
    }
    
}

func battle(trainers: inout [Trainer]) -> (){
    
    let randInt = randomNumber(min:0, max: allAttacksSquirtle.count - 1) //So that we can randomly determine which attack is going to be perfomed
    
    round += 1
    
    //Getting user's entry to select move
    
    if turn == 1 {
        print("Your turn! The following moves are available for your Pokemon. Please pick one.\n")
        for i in 0...(currentState.pokemonAttack.moves.count - 1){
            let currentMove = currentState.pokemonAttack.moves[i]
            print("\(i+1) \(currentMove.name) | Remaining powerpoints for this attack: \(currentMove.powerpoints)")
        }
        print("\n\(currentState.pokemonAttack.moves.count + 1). Run away!")
        print("\(currentState.pokemonAttack.moves.count + 2). Change Pokemon")
        if let typed = readLine() {
            if let num = Int(typed) {
                if num == currentState.pokemonAttack.moves.count + 1{ //Running away
                    print("You are a damn coward. Loser!")
                    abort()
                }else if num == currentState.pokemonAttack.moves.count + 2{ //Changing pokemon...
                    go()
                }else{
                currentState.pokemonMoveAttack = currentState.pokemonAttack.moves[num-1] //Selecting appropriate move
                currentState.pokemonMoveAttack.powerpoints -= 1
                }
            }
        }
        
        damages = damage(environment: todaysEnvironnement, pokemon: currentState.pokemonAttack, move: currentState.pokemonMoveAttack, target: currentState.pokemonDefense)
        currentState.pokemonDefense.hitpoints = currentState.pokemonDefense.hitpoints - damages; //Remaining hitpoints
        
        //Is the pokemon dead yet?
        
        if currentState.pokemonDefense.hitpoints <= 0 {
            print("Your adversary's Pokemon was killed by the last move \(currentState.pokemonMoveAttack.name) ! \(currentState.pokemonAttack.nickname) wins, \(currentState.pokemonDefense.nickname) defeated !\n");
            abort(); //Exciting game
        }
    } else{
        
        //Same but for Alice
        
        print("Alice's turn!\n")
        damages = damage(environment: todaysEnvironnement, pokemon: currentState.pokemonDefense, move: currentState.pokemonMoveDefense, target: currentState.pokemonAttack)
        currentState.pokemonAttack.hitpoints = currentState.pokemonAttack.hitpoints - damages;
        if currentState.pokemonAttack.hitpoints <= 0 {
            print("Your adversary's Pokemon was killed by the last move \(currentState.pokemonMoveDefense.name) ! \(currentState.pokemonDefense.nickname) wins , \(currentState.pokemonAttack.nickname) defeated !\n")
            abort();
        }
    }
    
    
    print("\n#############################");
    print("########## ROUND \(round) ##########");
    print("#############################\n");
    
    if turn == 1{
        print("\nPokemon Selected for Attack: \(currentState.pokemonAttack.nickname) | Specie: \(currentState.pokemonAttack.species.name) \n");
        print("Pokemon Selected for Defense: \(currentState.pokemonDefense.nickname) | Specie: \(currentState.pokemonDefense.species.name)\n");
    }else{
        print("\nPokemon Selected for Attack: \(currentState.pokemonDefense.nickname) | Specie: \(currentState.pokemonDefense.species.name) \n");
        print("Pokemon Selected for Defense: \(currentState.pokemonAttack.nickname) | Specie: \(currentState.pokemonAttack.species.name) \n");
    }
    
    print("Round started! Weather of the day: \(todaysEnvironnement.weather) \n");
    if turn == 1{
        print("Selected move: \(currentState.pokemonMoveAttack.name). Damages done: \(damages) \n");
    } else{
        print("Selected move: \(currentState.pokemonMoveDefense.name). Damages done: \(damages) \n");
    }
    
    
    if turn == 1{
        print("The targeted pokemon suffered several damages. Current hitpoints remaining before dying: \(currentState.pokemonDefense.nickname) : \(currentState.pokemonDefense.hitpoints)");
        print("Hitpoints of attacking pokemon remaining: \(currentState.pokemonAttack.nickname) : \(currentState.pokemonAttack.hitpoints) \n");
    }else{
        print("The targeted pokemon suffered several damages. Current hitpoints remaining before dying: \(currentState.pokemonAttack.nickname) : \(currentState.pokemonAttack.hitpoints)");
        print("Hitpoints of attacking pokemon remaining: \(currentState.pokemonDefense.nickname) : \(currentState.pokemonDefense.hitpoints) \n");
    }
    print("Press Enter for next round, or any other key followed by Enter to exit: ")

    
    if turn == -1 {
        
        //Updating Alice's next move
        
        currentState.pokemonMoveDefense = allAttacksSquirtle[randInt];
    }
    
    while userInput == ""{
        userInput = readLine(); //Read user's entry
        turn = turn*(-1); //Changing player
        battle(trainers: &trainers); //Next round
        }
}

