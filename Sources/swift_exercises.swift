/* Import for the floor function. */
import Foundation

/**********************************************/
/* Types and others informations on pokemons. */
/**********************************************/

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

enum Category {
    case physical
    case special
    case status
}

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

/* Coefficient for the changes of stats by the nature of pokemons. */
let coeff_nature: [Nature: StatsDouble] = [
    .hardy:   StatsDouble(hitpoints: 1, attack: 1  , defense: 1  , special_attack: 1  , special_defense: 1  , speed: 1),
    .lonely:  StatsDouble(hitpoints: 1, attack: 1.1, defense: 0.9, special_attack: 1  , special_defense: 1  , speed: 1),
    .brave:   StatsDouble(hitpoints: 1, attack: 1.1, defense: 1  , special_attack: 1  , special_defense: 1  , speed: 0.9),
    .adamant: StatsDouble(hitpoints: 1, attack: 1.1, defense: 1  , special_attack: 0.9, special_defense: 1  , speed: 1),
    .naughty: StatsDouble(hitpoints: 1, attack: 1.1, defense: 1  , special_attack: 1  , special_defense: 0.9, speed: 1),
    .bold: 	  StatsDouble(hitpoints: 1, attack: 0.9, defense: 1.1, special_attack: 1  , special_defense: 1  , speed: 1),
    .docile:  StatsDouble(hitpoints: 1, attack: 1  , defense: 1  , special_attack: 1  , special_defense: 1  , speed: 1),
    .relaxed: StatsDouble(hitpoints: 1, attack: 1  , defense: 1.1, special_attack: 1  , special_defense: 1  , speed: 0.9),
    .impish:  StatsDouble(hitpoints: 1, attack: 1  , defense: 1.1, special_attack: 0.9, special_defense: 1  , speed: 1),
    .lax: 	  StatsDouble(hitpoints: 1, attack: 1  , defense: 1.1, special_attack: 1  , special_defense: 0.9, speed: 1),
    .timid:   StatsDouble(hitpoints: 1, attack: 0.9, defense: 1  , special_attack: 1  , special_defense: 1  , speed: 1.1),
    .hasty:   StatsDouble(hitpoints: 1, attack: 1  , defense: 0.9, special_attack: 1  , special_defense: 1  , speed: 1.1),
    .serious: StatsDouble(hitpoints: 1, attack: 1  , defense: 1  , special_attack: 1  , special_defense: 1  , speed: 1),
    .jolly:   StatsDouble(hitpoints: 1, attack: 1  , defense: 1  , special_attack: 0.9, special_defense: 1  , speed: 1.1),
    .naive:   StatsDouble(hitpoints: 1, attack: 1  , defense: 1  , special_attack: 1  , special_defense: 0.9, speed: 1.1),
    .modest:  StatsDouble(hitpoints: 1, attack: 0.9, defense: 1  , special_attack: 1.1, special_defense: 1  , speed: 1),
    .mild: 	  StatsDouble(hitpoints: 1, attack: 1  , defense: 0.9, special_attack: 1.1, special_defense: 1  , speed: 1),
    .quiet:   StatsDouble(hitpoints: 1, attack: 1  , defense: 1  , special_attack: 1.1, special_defense: 1  , speed: 0.9),
    .bashful: StatsDouble(hitpoints: 1, attack: 1  , defense: 1  , special_attack: 1  , special_defense: 1  , speed: 1),
    .rash: 	  StatsDouble(hitpoints: 1, attack: 1  , defense: 1  , special_attack: 1.1, special_defense: 0.9, speed: 1),
    .calm: 	  StatsDouble(hitpoints: 1, attack: 0.9, defense: 1  , special_attack: 1  , special_defense: 1.1, speed: 1),
    .gentle:  StatsDouble(hitpoints: 1, attack: 1  , defense: 0.9, special_attack: 1  , special_defense: 1.1, speed: 1),
    .sassy:   StatsDouble(hitpoints: 1, attack: 1  , defense: 1  , special_attack: 1  , special_defense: 1.1, speed: 0.9),
    .careful: StatsDouble(hitpoints: 1, attack: 1  , defense: 1  , special_attack: 0.9, special_defense: 1.1, speed: 1),
    .quirky:  StatsDouble(hitpoints: 1, attack: 1  , defense: 1  , special_attack: 1  , special_defense: 1  , speed: 1)]

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

/******************************************************************/
/* Initialisation of moves, base values and species of a pokemon. */
/******************************************************************/
let FireBlast = Move(
    id: 1,
    name: "Fire Blast",
    description: "A fiery blast that scorches all. May cause a burn.",
    category: Category.special,
    type: Type.fire,
    power: 110, accuracy: 85,
    powerpoints: 5,
    priority: 0
)

let SolarBeam = Move(
    id: 2,
    name: "Solar Beam",
    description: "Absorbs light in one turn, then attacks next turn.",
    category: Category.special,
    type: Type.grass,
    power: 120,
    accuracy: 100,
    powerpoints: 10,
    priority: 0
)

let SunnyDay = Move(
    id: 3,
    name: "Sunny Day",
    description: "Boosts the power of FIRE- type moves for 5 turns.",
    category: Category.status,
    type: Type.fire,
    power: 0,
    accuracy: 0,
    powerpoints: 5,
    priority: 0
)

let Rest = Move(
    id: 4,
    name: "Rest",
    description: "Power increases with happiness, up to a maximum of 102.",
    category: Category.physical,
    type: Type.normal,
    power: 0,
    accuracy: 100,
    powerpoints: 20,
    priority: 0
)

let allMovesEntei = [FireBlast, SolarBeam, SunnyDay, Rest]

let BaseValue = Stats(
    hitpoints: 115,
    attack: 115,
    defense: 85,
    special_attack: 90,
    special_defense: 75,
    speed: 100
)

let entei_species = Species(
    id: 244,
    name: "Entei",
    evolutions: [],
    attacks: allMovesEntei,
    type: (Type.fire, nil),
    base_values: BaseValue
)

/* Fonctions to change values of effective stats. */
func effective_stats_HP(Base: Int, IV: Int, EV: Int, lvl: Int) -> Int {
    // let HP: Int = floor((((2*Base + IV + floor(EV/4))*lvl)/100) + lvl + 10)
    let help_EV   : Int = (Int)(floor((Double)(EV/4)))
    let help_Base : Int = Base*2
    let help      : Int = ((((help_Base + IV + help_EV)*lvl)/100) + lvl + 10)
    let HP        : Int = (Int)(floor((Double)(help)))
    return HP
}

func effective_stats_(Base: Int, IV: Int, EV: Int, lvl: Int, nature_multiplier: Double) -> Int {
    // let stat: Int = floor((((2*Base + IV + floor(EV/4))*lvl)/100) + 5)*nature_multiplier
    let help_EV   : Int = (Int)(floor((Double)(EV/4)))
    let help_Base : Int = Base*2
    let help      : Double = (Double)((((help_Base + IV + help_EV)*lvl)/100) + 5)
    let stat      : Int = (Int)(floor(help*nature_multiplier))
    return stat
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
    let moves             : [Move] // Move -> remaining powerpoints
    let individual_values : Stats
    let effort_values     : Stats
    var effective_stats   : Stats {
       get {
         var effective_hitpoints       = effective_stats_HP(Base: species.base_values.hitpoints, IV: individual_values.hitpoints, EV: effort_values.hitpoints, lvl: level)
         var effective_attack          = effective_stats_(Base:   species.base_values.attack, IV: individual_values.attack, EV: effort_values.attack, lvl: level, nature_multiplier: (coeff_nature[nature]?.attack)!)
         var effective_defense         = effective_stats_(Base:   species.base_values.defense, IV: individual_values.defense, EV: effort_values.defense, lvl: level, nature_multiplier: (coeff_nature[nature]?.defense)!)
         var effective_special_attack  = effective_stats_(Base:   species.base_values.special_attack, IV: individual_values.special_attack, EV: effort_values.special_attack, lvl: level, nature_multiplier: (coeff_nature[nature]?.special_attack)!)
         var effective_special_defense = effective_stats_(Base:   species.base_values.special_defense, IV: individual_values.special_defense, EV: effort_values.special_defense, lvl: level, nature_multiplier: (coeff_nature[nature]?.special_defense)!)
         var effective_speed           = effective_stats_(Base:   species.base_values.speed, IV: individual_values.speed, EV: effort_values.speed, lvl: level, nature_multiplier: (coeff_nature[nature]?.speed)!)

         return Stats(hitpoints: effective_hitpoints, attack: effective_attack, defense: effective_defense, special_attack: effective_special_attack, special_defense: effective_special_defense, speed: effective_speed)
       }
     }
}


/********************************/
/* Initialisation of a pokemon. */
/********************************/
let IVs_Entei = Stats(
    hitpoints: 19,
    attack: 8,
    defense: 13,
    special_attack: 17,
    special_defense: 12,
    speed: 14
)

let EVs_Entei = Stats(
    hitpoints: 1,
    attack: 2,
    defense: 0,
    special_attack: 0,
    special_defense: 0,
    speed: 0
)

let Entei_pokemon = Pokemon (
    nickname: "Moah",
    hitpoints: 115,
    size: 2,
    weight: 198,
    experience: 1,
    level: 1,
    nature: .naughty,
    species: entei_species,
    moves: [FireBlast, SolarBeam, SunnyDay, Rest],
    individual_values: IVs_Entei,
    effort_values: EVs_Entei
)

struct Trainer {
    let name : String
    let pokemons : [Pokemon]
}

struct Environment {
    let weather : Weather
    let terrain : Terrain
}

let type_modifier: [Type: [Type: Double]] = [
.normal:   [.normal: 1  ,.fighting: 1  ,.flying: 1  ,.poison: 1  ,.ground: 1  ,.rock: 0.5,.bug: 1  ,.ghost: 0  ,.steel: 0.5,.fire: 1  ,.water: 1  ,.grass: 1  ,.electric: 1  ,.psychic: 1  ,.ice: 1  ,.dragon: 1  ,.dark: 1  ,.fairy: 1  ],
.fighting: [.normal: 2  ,.fighting: 1  ,.flying: 0.5,.poison: 0.5,.ground: 1  ,.rock: 2  ,.bug: 0.5,.ghost: 0  ,.steel: 2  ,.fire: 1  ,.water: 1  ,.grass: 1  ,.electric: 1  ,.psychic: 0.5,.ice: 2  ,.dragon: 1  ,.dark: 2  ,.fairy: 0.5],
.flying:   [.normal: 1  ,.fighting: 2  ,.flying: 1  ,.poison: 1  ,.ground: 1  ,.rock: 0.5,.bug: 2  ,.ghost: 1  ,.steel: 0.5,.fire: 1  ,.water: 1  ,.grass: 2  ,.electric: 0.5,.psychic: 1  ,.ice: 1  ,.dragon: 1  ,.dark: 1  ,.fairy: 1],
.poison:   [.normal: 1  ,.fighting: 1  ,.flying: 1  ,.poison: 0.5,.ground: 0.5,.rock: 0.5,.bug: 1  ,.ghost: 0.5,.steel: 0  ,.fire: 1  ,.water: 1  ,.grass: 2  ,.electric: 1  ,.psychic: 1  ,.ice: 1  ,.dragon: 1  ,.dark: 1  ,.fairy: 2],
.ground:   [.normal: 1  ,.fighting: 1  ,.flying: 0  ,.poison: 2  ,.ground: 1  ,.rock: 2  ,.bug: 0.5,.ghost: 1  ,.steel: 2  ,.fire: 2  ,.water: 1  ,.grass: 0.5,.electric: 2  ,.psychic: 1  ,.ice: 1  ,.dragon: 1  ,.dark: 1  ,.fairy: 1],
.rock:     [.normal: 1  ,.fighting: 0.5,.flying: 2  ,.poison: 1  ,.ground: 0.5,.rock: 1  ,.bug: 2  ,.ghost: 1  ,.steel: 0.5,.fire: 2  ,.water: 1  ,.grass: 1  ,.electric: 1  ,.psychic: 1  ,.ice: 2  ,.dragon: 1  ,.dark: 1  ,.fairy: 1],
.bug:      [.normal: 1  ,.fighting: 0.5,.flying: 0.5,.poison: 0.5,.ground: 1  ,.rock: 1  ,.bug: 1  ,.ghost: 0.5,.steel: 0.5,.fire: 0.5,.water: 1  ,.grass: 2  ,.electric: 1  ,.psychic: 2  ,.ice: 1  ,.dragon: 1  ,.dark: 2  ,.fairy: 0.5],
.ghost:    [.normal: 0  ,.fighting: 1  ,.flying: 1  ,.poison: 1  ,.ground: 1  ,.rock: 1  ,.bug: 1  ,.ghost: 2  ,.steel: 1  ,.fire: 1  ,.water: 1  ,.grass: 1  ,.electric: 1  ,.psychic: 2  ,.ice: 1  ,.dragon: 1  ,.dark: 0.5,.fairy: 1],
.steel:    [.normal: 1  ,.fighting: 1  ,.flying: 1  ,.poison: 1  ,.ground: 1  ,.rock: 2  ,.bug: 1  ,.ghost: 1  ,.steel: 0.5,.fire: 0.5,.water: 0.5,.grass: 1  ,.electric: 0.5,.psychic: 1  ,.ice: 2  ,.dragon: 1  ,.dark: 1  ,.fairy: 2],
.fire:     [.normal: 1  ,.fighting: 1  ,.flying: 1  ,.poison: 1  ,.ground: 1  ,.rock: 0.5,.bug: 2  ,.ghost: 1  ,.steel: 2  ,.fire: 0.5,.water: 0.5,.grass: 2  ,.electric: 1  ,.psychic: 1  ,.ice: 2  ,.dragon: 0.5,.dark: 1  ,.fairy: 1],
.water:    [.normal: 1  ,.fighting: 1  ,.flying: 1  ,.poison: 1  ,.ground: 2  ,.rock: 2  ,.bug: 1  ,.ghost: 1  ,.steel: 1  ,.fire: 2  ,.water: 0.5,.grass: 0.5,.electric: 1  ,.psychic: 1  ,.ice: 1  ,.dragon: 0.5,.dark: 1  ,.fairy: 1],
.grass:    [.normal: 1  ,.fighting: 1  ,.flying: 0.5,.poison: 0.5,.ground: 2  ,.rock: 2  ,.bug: 0.5,.ghost: 1  ,.steel: 0.5,.fire: 0.5,.water: 2  ,.grass: 0.5,.electric: 1  ,.psychic: 1  ,.ice: 1  ,.dragon: 0.5,.dark: 1  ,.fairy: 1],
.electric: [.normal: 1  ,.fighting: 1  ,.flying: 2  ,.poison: 1  ,.ground: 0  ,.rock: 1  ,.bug: 1  ,.ghost: 1  ,.steel: 1  ,.fire: 1  ,.water: 2  ,.grass: 0.5,.electric: 0.5,.psychic: 1  ,.ice: 1  ,.dragon: 0.5,.dark: 1  ,.fairy: 1],
.psychic:  [.normal: 1  ,.fighting: 2  ,.flying: 1  ,.poison: 2  ,.ground: 1  ,.rock: 1  ,.bug: 1  ,.ghost: 1  ,.steel: 0.5,.fire: 1  ,.water: 1  ,.grass: 1  ,.electric: 1  ,.psychic: 0.5,.ice: 1  ,.dragon: 1  ,.dark: 0  ,.fairy: 1],
.ice:      [.normal: 1  ,.fighting: 1  ,.flying: 2  ,.poison: 1  ,.ground: 2  ,.rock: 1  ,.bug: 1  ,.ghost: 1  ,.steel: 0.5,.fire: 0.5,.water: 0.5,.grass: 2  ,.electric: 1  ,.psychic: 1  ,.ice: 0.5,.dragon: 2  ,.dark: 1  ,.fairy: 1],
.dragon:   [.normal: 1  ,.fighting: 1  ,.flying: 1  ,.poison: 1  ,.ground: 1  ,.rock: 1  ,.bug: 1  ,.ghost: 1  ,.steel: 0.5,.fire: 1  ,.water: 1  ,.grass: 1  ,.electric: 1  ,.psychic: 1  ,.ice: 1  ,.dragon: 2  ,.dark: 1  ,.fairy: 0],
.dark:     [.normal: 1  ,.fighting: 0.5,.flying: 1  ,.poison: 1  ,.ground: 1  ,.rock: 1  ,.bug: 1  ,.ghost: 2  ,.steel: 1  ,.fire: 1  ,.water: 1  ,.grass: 1  ,.electric: 1  ,.psychic: 2  ,.ice: 1  ,.dragon: 1  ,.dark: 0.5,.fairy: 0.5],
.fairy:    [.normal: 1  ,.fighting: 2  ,.flying: 1  ,.poison: 0.5,.ground: 1  ,.rock: 1  ,.bug: 1  ,.ghost: 1  ,.steel: 0.5,.fire: 0.5,.water: 1  ,.grass: 1  ,.electric: 1  ,.psychic: 1  ,.ice: 1  ,.dragon: 2  ,.dark: 2  ,.fairy: 1]]

func typeModifier(attacking: Type, defending: Type) -> Double {
    return (type_modifier[attacking]?[defending])!
}

// http://bulbapedia.bulbagarden.net/wiki/Damage
func damage(environment : Environment, pokemon: Pokemon, move: Move, target: Pokemon) -> Int {
    let Level = pokemon.level
    let Power: Double = Double(move.power)

    let A = Double(move.category == .physical ? pokemon.effective_stats.attack : pokemon.effective_stats.special_attack)
    let D = Double(move.category == .physical ? pokemon.effective_stats.defense : pokemon.effective_stats.special_defense)

    /* For the modifier value */
    var Weather_boost = Double(move.power)
    switch environment.weather {
        case .rain:
            if move.type == .fire {
                Weather_boost = Weather_boost*0.5
            }
            if move.type == .water {
                Weather_boost =  Weather_boost*1.5
            }

        case .harsh_sunlight:
            if move.type == .water {
                Weather_boost = Weather_boost*0.5
            }
            if move.type == .fire {
                Weather_boost = Weather_boost*1.5
            }
        default:
            Weather_boost = Weather_boost*1
    }

    let threshold = pokemon.species.base_values.speed/2
    let test = Int(random() % 256)
    let critical: Double

    if (test < threshold) {
        critical = 2
    }
    else {
        critical = 1
    }

    let random1 = Int(random() % 38) + 217
    let random_value = Double(random1/255)

    let STAD: Double
    if (move.type == pokemon.species.type.0) || (move.type == pokemon.species.type.1) {
        STAD = 1.5
    }
    else {
        STAD = 1
    }

    let type_effectivness: Double
    if let secound_type = target.species.type.1 {
        type_effectivness = typeModifier(attacking: move.type, defending: target.species.type.0)*typeModifier(attacking: move.type, defending: secound_type)
    }
    else {
        type_effectivness = typeModifier(attacking: move.type, defending: target.species.type.0)
    }


    let damage_modifier = Weather_boost * critical * random_value * STAD * type_effectivness
    let temporary = (Double((2 * Level / 5) + 2) * Power * A/D) / 50
    let damage_output = Int((temporary + 2) * damage_modifier)

    return damage_output
}

struct State {
    let trainer1: Trainer
    var pokemon1: Pokemon
    var pokemon1_move: Move

    let trianer_computer: Trainer
    var pokemon_c: Pokemon
    var pokemon_c_move: Move
}

func battle(trainers: inout [Trainer], behavior: (State, Trainer) -> Move) -> () {
    // TODO: simulate battle
}
