import Foundation

/* TODO implémenter les moves, se pencher sur le combat en sois */

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

let nature_coeff: [Nature: StatsDouble] = [
    Nature.hardy:   StatsDouble(hitpoints: 1.0, attack: 1.0, defense: 1.0, special_attack: 1.0, special_defense: 1.0, speed: 1.0),
    Nature.lonely:  StatsDouble(hitpoints: 1.0, attack: 1.1, defense: 0.9, special_attack: 1.0, special_defense: 1.0, speed: 1.0),
    Nature.brave:   StatsDouble(hitpoints: 1.0, attack: 1.1, defense: 1.0, special_attack: 1.0, special_defense: 1.0, speed: 0.9),
    Nature.adamant: StatsDouble(hitpoints: 1.0, attack: 1.1, defense: 1.0, special_attack: 0.9, special_defense: 1.0, speed: 1.0),
    Nature.naughty: StatsDouble(hitpoints: 1.0, attack: 1.1, defense: 1.0, special_attack: 1.0, special_defense: 0.9, speed: 1.0),
    Nature.bold:    StatsDouble(hitpoints: 1.0, attack: 0.9, defense: 1.1, special_attack: 1.0, special_defense: 1.0, speed: 1.0),
    Nature.docile:  StatsDouble(hitpoints: 1.0, attack: 1.0, defense: 1.0, special_attack: 1.0, special_defense: 1.0, speed: 1.0),
    Nature.relaxed: StatsDouble(hitpoints: 1.0, attack: 1.0, defense: 1.1, special_attack: 1.0, special_defense: 1.0, speed: 0.9),
    Nature.impish:  StatsDouble(hitpoints: 1.0, attack: 1.0, defense: 1.1, special_attack: 0.9, special_defense: 1.0, speed: 1.0),
    Nature.lax:     StatsDouble(hitpoints: 1.0, attack: 1.0, defense: 1.1, special_attack: 1.0, special_defense: 0.9, speed: 1.0),
    Nature.timid:   StatsDouble(hitpoints: 1.0, attack: 0.9, defense: 1.0, special_attack: 1.0, special_defense: 1.0, speed: 1.1),
    Nature.hasty:   StatsDouble(hitpoints: 1.0, attack: 1.0, defense: 0.9, special_attack: 1.0, special_defense: 1.0, speed: 1.1),
    Nature.serious: StatsDouble(hitpoints: 1.0, attack: 1.0, defense: 1.0, special_attack: 1.0, special_defense: 1.0, speed: 1.0),
    Nature.jolly:   StatsDouble(hitpoints: 1.0, attack: 1.0, defense: 1.0, special_attack: 0.9, special_defense: 1.0, speed: 1.1),
    Nature.naive:   StatsDouble(hitpoints: 1.0, attack: 1.0, defense: 1.0, special_attack: 1.0, special_defense: 0.9, speed: 1.1),
    Nature.modest:  StatsDouble(hitpoints: 1.0, attack: 0.9, defense: 1.0, special_attack: 1.1, special_defense: 1.0, speed: 1.0),
    Nature.mild:    StatsDouble(hitpoints: 1.0, attack: 1.0, defense: 0.9, special_attack: 1.1, special_defense: 1.0, speed: 1.0),
    Nature.quiet:   StatsDouble(hitpoints: 1.0, attack: 1.0, defense: 1.0, special_attack: 1.1, special_defense: 1.0, speed: 0.9),
    Nature.bashful: StatsDouble(hitpoints: 1.0, attack: 1.0, defense: 1.0, special_attack: 1.0, special_defense: 1.0, speed: 1.0),
    Nature.rash:    StatsDouble(hitpoints: 1.0, attack: 1.0, defense: 1.0, special_attack: 1.1, special_defense: 0.9, speed: 1.0),
    Nature.calm:    StatsDouble(hitpoints: 1.0, attack: 0.9, defense: 1.0, special_attack: 1.0, special_defense: 1.1, speed: 1.0),
    Nature.sassy:   StatsDouble(hitpoints: 1.0, attack: 1.0, defense: 1.0, special_attack: 1.0, special_defense: 1.1, speed: 0.9),
    Nature.careful: StatsDouble(hitpoints: 1.0, attack: 1.0, defense: 1.0, special_attack: 0.9, special_defense: 1.1, speed: 1.0),
    Nature.quirky:  StatsDouble(hitpoints: 1.0, attack: 1.0, defense: 1.0, special_attack: 1.0, special_defense: 1.0, speed: 1.0),
    Nature.gentle:  StatsDouble(hitpoints: 1.0, attack: 1.0, defense: 0.9, special_attack: 1.0, special_defense: 1.1, speed: 1.0),
]

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


  let TyranitarStats = Stats(hitpoints : 100, attack : 134, defense : 110, special_attack : 95, special_defense : 100, speed : 61)
  let Tyranitar = Species (id : 248, name : "Tyranitar", evolutions : [], attacks : [] /* TODO Mettre des attaques !! */, type : (.rock, .dark), base_values : TyranitarStats)

func ==(lhs: Species, rhs: Species) -> Bool {
    return lhs.id == rhs.id
}

// TODO: create some species
// Do you use an enum, a map or constants/variables?
// http://bulbapedia.bulbagarden.net/wiki/List_of_Pokémon_by_National_Pokédex_number

func effective_stats_HP(Base: Int, IV: Int, EV: Int, level: Int) -> Int {
    let EV_help : Int = (Int)(floor((Double)(EV/4)))
    let Base_help : Int = Base*2
    let HP_help : Int = (((Base_help + IV + EV_help)*level)/100) + level
    let HP : Int = (Int)(floor((Double)(HP_help)) + 10)
    return HP
}

func effective_stats_other(Base: Int, IV: Int, EV: Int, level: Int, nature_multiplier: Double) -> Int {
    let EV_help : Int = (Int)(floor((Double)(EV/4)))
    let Base_help : Int = Base*2
    let help: Double = (Double)((((Base_help + IV + EV_help)*level)/100)) + 5
    let stat_other : Int = (Int)(floor(help*nature_multiplier))
    return stat_other
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

    /*  Ici je definis mon Pokemon

    let Tyranitar_IV = Stats()
    let Tyranitar_EV = Stats(hitpoints : 0, attack : 0, defense : 0, special_attack : 0, special_defense : 0, speed : 0)
    let TyranitarPokemon = Pokemon(nickname : nil, hitpoints : )
    */
}


func effective_stats(Pokemon : Pokemon, nature_multiplier : Double)   -> Stats {

    let effective_hitpoints       = effective_stats_HP(Base : Pokemon.species.base_values.hitpoints, IV : Pokemon.individual_values.hitpoints, EV: Pokemon.effort_values.hitpoints, level: Pokemon.level)
    let effective_attack          = effective_stats_other(Base : Pokemon.species.base_values.attack, IV : Pokemon.individual_values.attack, EV: Pokemon.effort_values.attack, level: Pokemon.level, nature_multiplier: (nature_coeff[Pokemon.nature]?.attack)!)
    let effective_defense         = effective_stats_other(Base : Pokemon.species.base_values.defense, IV : Pokemon.individual_values.defense, EV: Pokemon.effort_values.defense, level: Pokemon.level, nature_multiplier: (nature_coeff[Pokemon.nature]?.defense)!)
    let effective_special_attack  = effective_stats_other(Base : Pokemon.species.base_values.special_attack, IV : Pokemon.individual_values.special_attack, EV: Pokemon.effort_values.special_attack, level: Pokemon.level, nature_multiplier: (nature_coeff[Pokemon.nature]?.special_attack)!)
    let effective_special_defense = effective_stats_other(Base : Pokemon.species.base_values.special_defense, IV : Pokemon.individual_values.special_defense, EV: Pokemon.effort_values.special_defense, level: Pokemon.level, nature_multiplier: (nature_coeff[Pokemon.nature]?.special_defense)!)
    let effective_speed           = effective_stats_other(Base : Pokemon.species.base_values.speed, IV : Pokemon.individual_values.speed, EV: Pokemon.effort_values.speed, level: Pokemon.level, nature_multiplier: (nature_coeff[Pokemon.nature]?.speed)!)

  let effective_stats_return = Stats(hitpoints : effective_hitpoints, attack : effective_attack, defense : effective_defense, special_attack : effective_special_attack, special_defense : effective_special_defense, speed : effective_speed)
  return effective_stats_return

}
// let TyranitarStast_effectives = effective_stats()


struct Trainer {
    let pokemons : [Pokemon]
}

struct Environment {
    let weather : Weather
    let terrain : Terrain
}

// http://bulbapedia.bulbagarden.net/wiki/Type/Type_chart
func typeModifier(attacking: Type, defending : Type) -> Double {

    switch (attacking, defending){

/* Attacking Type normal */
    case (.normal, .normal)   : return 1
    case (.normal, .fighting) : return 1
    case (.normal, .flying)   : return 1
    case (.normal, .poison)   : return 1
    case (.normal, .ground)   : return 1
    case (.normal, .rock)     : return 0.5
    case (.normal, .bug)      : return 1
    case (.normal, .ghost)    : return 0
    case (.normal, .steel)    : return 0.5
    case (.normal, .fire)     : return 1
    case (.normal, .water)    : return 1
    case (.normal, .grass)    : return 1
    case (.normal, .electric) : return 1
    case (.normal, .psychic)  : return 1
    case (.normal, .ice)      : return 1
    case (.normal, .dragon)   : return 1
    case (.normal, .dark)     : return 1
    case (.normal, .fairy)    : return 1

  /* Attacking Type fighting */

    case(.fighting, .normal)   : return 2
    case(.fighting, .fighting) : return 1
    case(.fighting, .flying)   : return 0.5
    case(.fighting, .poison)   : return 0.5
    case(.fighting, .ground)   : return 1
    case(.fighting, .rock)     : return 2
    case(.fighting, .bug)      : return 0.5
    case(.fighting, .ghost)    : return 0
    case(.fighting, .steel)    : return 2
    case(.fighting, .fire)     : return 1
    case(.fighting, .water)    : return 1
    case(.fighting, .grass)    : return 1
    case(.fighting, .electric) : return 1
    case(.fighting, .psychic)  : return 0.5
    case(.fighting, .ice)      : return 2
    case(.fighting, .dragon)   : return 1
    case(.fighting, .dark)     : return 2
    case(.fighting, .fairy)    : return 0.5

  /* Attacking Type flying */

    case(.flying, .normal)   : return 1
    case(.flying, .fighting) : return 2
    case(.flying, .flying)   : return 1
    case(.flying, .poison)   : return 1
    case(.flying, .ground)   : return 1
    case(.flying, .rock)     : return 0.5
    case(.flying, .bug)      : return 2
    case(.flying, .ghost)    : return 1
    case(.flying, .steel)    : return 0.5
    case(.flying, .fire)     : return 1
    case(.flying, .water)    : return 1
    case(.flying, .grass)    : return 2
    case(.flying, .electric) : return 0.5
    case(.flying, .psychic)  : return 1
    case(.flying, .ice)      : return 1
    case(.flying, .dragon)   : return 1
    case(.flying, .dark)     : return 1
    case(.flying, .fairy)    : return 1

  /* Attacking Type poison */

    case (.poison, .normal)   : return 1
    case (.poison, .fighting) : return 1
    case (.poison, .flying)   : return 1
    case (.poison, .poison)   : return 0.5
    case (.poison, .ground)   : return 0.5
    case (.poison, .rock)     : return 0.5
    case (.poison, .bug)      : return 1
    case (.poison, .ghost)    : return 0.5
    case (.poison, .steel)    : return 0
    case (.poison, .fire)     : return 1
    case (.poison, .water)    : return 1
    case (.poison, .grass)    : return 2
    case (.poison, .electric) : return 1
    case (.poison, .psychic)  : return 1
    case (.poison, .ice)      : return 1
    case (.poison, .dragon)   : return 1
    case (.poison, .dark)     : return 1
    case (.poison, .fairy)    : return 2

  /* Attacking Type ground */

    case(.ground, .normal)   : return 1
    case(.ground, .fighting) : return 1
    case(.ground, .flying)   : return 0
    case(.ground, .poison)   : return 2
    case(.ground, .ground)   : return 1
    case(.ground, .rock)     : return 2
    case(.ground, .bug)      : return 0.5
    case(.ground, .ghost)    : return 1
    case(.ground, .steel)    : return 2
    case(.ground, .fire)     : return 2
    case(.ground, .water)    : return 1
    case(.ground, .grass)    : return 0.5
    case(.ground, .electric) : return 2
    case(.ground, .psychic)  : return 1
    case(.ground, .ice)      : return 1
    case(.ground, .dragon)   : return 1
    case(.ground, .dark)     : return 1
    case(.ground, .fairy)    : return 1

  /* Attacking Type rock */

    case(.rock, .normal)   : return 1
    case(.rock, .fighting) : return 0.5
    case(.rock, .flying)   : return 2
    case(.rock, .poison)   : return 1
    case(.rock, .ground)   : return 0.5
    case(.rock, .rock)     : return 1
    case(.rock, .bug)      : return 2
    case(.rock, .ghost)    : return 1
    case(.rock, .steel)    : return 0.5
    case(.rock, .fire)     : return 2
    case(.rock, .water)    : return 1
    case(.rock, .grass)    : return 1
    case(.rock, .electric) : return 1
    case(.rock, .psychic)  : return 1
    case(.rock, .ice)      : return 2
    case(.rock, .dragon)   : return 1
    case(.rock, .dark)     : return 1
    case(.rock, .fairy)    : return 1

  /*  Attacking Type bug */

    case(.bug, .normal)   : return 1
    case(.bug, .fighting) : return 0.5
    case(.bug, .flying)   : return 0.5
    case(.bug, .poison)   : return 0.5
    case(.bug, .ground)   : return 1
    case(.bug, .rock)     : return 1
    case(.bug, .bug)      : return 1
    case(.bug, .ghost)    : return 0.5
    case(.bug, .steel)    : return 0.5
    case(.bug, .fire)     : return 0.5
    case(.bug, .water)    : return 1
    case(.bug, .grass)    : return 2
    case(.bug, .electric) : return 1
    case(.bug, .psychic)  : return 2
    case(.bug, .ice)      : return 1
    case(.bug, .dragon)   : return 1
    case(.bug, .dark)     : return 2
    case(.bug, .fairy)    : return 0.5


  /* Attacking Type ghost */

    case(.ghost, .normal)   : return 0
    case(.ghost, .fighting) : return 1
    case(.ghost, .flying)   : return 1
    case(.ghost, .poison)   : return 1
    case(.ghost, .ground)   : return 1
    case(.ghost, .rock)     : return 1
    case(.ghost, .bug)      : return 1
    case(.ghost, .ghost)    : return 2
    case(.ghost, .steel)    : return 1
    case(.ghost, .fire)     : return 1
    case(.ghost, .water)    : return 1
    case(.ghost, .grass)    : return 1
    case(.ghost, .electric) : return 1
    case(.ghost, .psychic)  : return 2
    case(.ghost, .ice)      : return 1
    case(.ghost, .dragon)   : return 1
    case(.ghost, .dark)     : return 0.5
    case(.ghost, .fairy)    : return 1

  /* Attacking Type: steel */

    case(.steel, .normal)   : return 1
    case(.steel, .fighting) : return 1
    case(.steel, .flying)   : return 1
    case(.steel, .poison)   : return 1
    case(.steel, .ground)   : return 1
    case(.steel, .rock)     : return 2
    case(.steel, .bug)      : return 1
    case(.steel, .ghost)    : return 1
    case(.steel, .steel)    : return 0.5
    case(.steel, .fire)     : return 0.5
    case(.steel, .water)    : return 0.5
    case(.steel, .grass)    : return 1
    case(.steel, .electric) : return 0.5
    case(.steel, .psychic)  : return 1
    case(.steel, .ice)      : return 2
    case(.steel, .dragon)   : return 1
    case(.steel, .dark)     : return 1
    case(.steel, .fairy)    : return 2

  /* Attacking Type: fire */

    case(.fire, .normal)   : return 1
    case(.fire, .fighting) : return 1
    case(.fire, .flying)   : return 1
    case(.fire, .poison)   : return 1
    case(.fire, .ground)   : return 1
    case(.fire, .rock)     : return 0.5
    case(.fire, .bug)      : return 2
    case(.fire, .ghost)    : return 1
    case(.fire, .steel)    : return 2
    case(.fire, .fire)     : return 0.5
    case(.fire, .water)    : return 0.5
    case(.fire, .grass)    : return 2
    case(.fire, .electric) : return 1
    case(.fire, .psychic)  : return 1
    case(.fire, .ice)      : return 2
    case(.fire, .dragon)   : return 0.5
    case(.fire, .dark)     : return 1
    case(.fire, .fairy)    : return 1

  /* Attacking Type: water */

    case(.water, .normal)   : return 1
    case(.water, .fighting) : return 1
    case(.water, .flying)   : return 1
    case(.water, .poison)   : return 1
    case(.water, .ground)   : return 2
    case(.water, .rock)     : return 2
    case(.water, .bug)      : return 1
    case(.water, .ghost)    : return 1
    case(.water, .steel)    : return 1
    case(.water, .fire)     : return 2
    case(.water, .water)    : return 0.5
    case(.water, .grass)    : return 0.5
    case(.water, .electric) : return 1
    case(.water, .psychic)  : return 1
    case(.water, .ice)      : return 1
    case(.water, .dragon)   : return 0.5
    case(.water, .dark)     : return 1
    case(.water, .fairy)    : return 1

  /* Attacking Type: grass */

    case(.grass, .normal)   : return 1
    case(.grass, .fighting) : return 1
    case(.grass, .flying)   : return 0.5
    case(.grass, .poison)   : return 0.5
    case(.grass, .ground)   : return 2
    case(.grass, .rock)     : return 2
    case(.grass, .bug)      : return 0.5
    case(.grass, .ghost)    : return 1
    case(.grass, .steel)    : return 0.5
    case(.grass, .fire)     : return 0.5
    case(.grass, .water)    : return 2
    case(.grass, .grass)    : return 0.5
    case(.grass, .electric) : return 1
    case(.grass, .psychic)  : return 1
    case(.grass, .ice)      : return 1
    case(.grass, .dragon)   : return 0.5
    case(.grass, .dark)     : return 1
    case(.grass, .fairy)    : return 1

  /* Attacking Type: electric */

    case(.electric, .normal)   : return 1
    case(.electric, .fighting) : return 1
    case(.electric, .flying)   : return 2
    case(.electric, .poison)   : return 1
    case(.electric, .ground)   : return 0
    case(.electric, .rock)     : return 1
    case(.electric, .bug)      : return 1
    case(.electric, .ghost)    : return 1
    case(.electric, .steel)    : return 1
    case(.electric, .fire)     : return 1
    case(.electric, .water)    : return 2
    case(.electric, .grass)    : return 0.5
    case(.electric, .electric) : return 0.5
    case(.electric, .psychic)  : return 1
    case(.electric, .ice)      : return 1
    case(.electric, .dragon)   : return 0.5
    case(.electric, .dark)     : return 1
    case(.electric, .fairy)    : return 1

  /* Attacking Type: psychic */

    case(.psychic, .normal)   : return 1
    case(.psychic, .fighting) : return 2
    case(.psychic, .flying)   : return 1
    case(.psychic, .poison)   : return 2
    case(.psychic, .ground)   : return 1
    case(.psychic, .rock)     : return 1
    case(.psychic, .bug)      : return 1
    case(.psychic, .ghost)    : return 1
    case(.psychic, .steel)    : return 0.5
    case(.psychic, .fire)     : return 1
    case(.psychic, .water)    : return 1
    case(.psychic, .grass)    : return 1
    case(.psychic, .electric) : return 1
    case(.psychic, .psychic)  : return 0.5
    case(.psychic, .ice)      : return 1
    case(.psychic, .dragon)   : return 1
    case(.psychic, .dark)     : return 0
    case(.psychic, .fairy)    : return 1

  /* Attacking Type: ice */

    case(.ice, .normal)   : return 1
    case(.ice, .fighting) : return 1
    case(.ice, .flying)   : return 2
    case(.ice, .poison)   : return 1
    case(.ice, .ground)   : return 2
    case(.ice, .rock)     : return 1
    case(.ice, .bug)      : return 1
    case(.ice, .ghost)    : return 1
    case(.ice, .steel)    : return 0.5
    case(.ice, .fire)     : return 0.5
    case(.ice, .water)    : return 0.5
    case(.ice, .grass)    : return 2
    case(.ice, .electric) : return 1
    case(.ice, .psychic)  : return 1
    case(.ice, .ice)      : return 0.5
    case(.ice, .dragon)   : return 2
    case(.ice, .dark)     : return 1
    case(.ice, .fairy)    : return 1

  /* Attacking Type: dragon */

    case(.dragon, .normal)   : return 1
    case(.dragon, .fighting) : return 1
    case(.dragon, .flying)   : return 1
    case(.dragon, .poison)   : return 1
    case(.dragon, .ground)   : return 1
    case(.dragon, .rock)     : return 1
    case(.dragon, .bug)      : return 1
    case(.dragon, .ghost)    : return 1
    case(.dragon, .steel)    : return 0.5
    case(.dragon, .fire)     : return 1
    case(.dragon, .water)    : return 1
    case(.dragon, .grass)    : return 1
    case(.dragon, .electric) : return 1
    case(.dragon, .psychic)  : return 1
    case(.dragon, .ice)      : return 1
    case(.dragon, .dragon)   : return 2
    case(.dragon, .dark)     : return 1
    case(.dragon, .fairy)    : return 0

  /* Attacking Type: dark */

    case(.dark, .normal)   : return 1
    case(.dark, .fighting) : return 0.5
    case(.dark, .flying)   : return 1
    case(.dark, .poison)   : return 1
    case(.dark, .ground)   : return 1
    case(.dark, .rock)     : return 1
    case(.dark, .bug)      : return 1
    case(.dark, .ghost)    : return 2
    case(.dark, .steel)    : return 1
    case(.dark, .fire)     : return 1
    case(.dark, .water)    : return 1
    case(.dark, .grass)    : return 1
    case(.dark, .electric) : return 1
    case(.dark, .psychic)  : return 2
    case(.dark, .ice)      : return 1
    case(.dark, .dragon)   : return 1
    case(.dark, .dark)     : return 0.5
    case(.dark, .fairy)    : return 0.5

  /* Attacking Type: fairy */

    case(.fairy, .normal)   : return 1
    case(.fairy, .fighting) : return 2
    case(.fairy, .flying)   : return 1
    case(.fairy, .poison)   : return 0.5
    case(.fairy, .ground)   : return 1
    case(.fairy, .rock)     : return 1
    case(.fairy, .bug)      : return 1
    case(.fairy, .ghost)    : return 1
    case(.fairy, .steel)    : return 0.5
    case(.fairy, .fire)     : return 0.5
    case(.fairy, .water)    : return 1
    case(.fairy, .grass)    : return 1
    case(.fairy, .electric) : return 1
    case(.fairy, .psychic)  : return 1
    case(.fairy, .ice)      : return 1
    case(.fairy, .dragon)   : return 2
    case(.fairy, .dark)     : return 2
    case(.fairy, .fairy)    : return 1

    }

}


/******************************************************************************
******************************** MON POKEMON **********************************
******************************************************************************/


let move_earthquake : Move{
  id = 482,
  name = "Earthquake",
  description = "An attack that inflicts the damage by shaking the ground. It is useless against Flying type Pokémon.",
  category = .physical,
  type = .ground,
  power = 100,
  accuracy = 100,
  powerpoints = 10,
  priority = 0
}

let move_stone_edge : Move {
  id = 168,
  name = "Stone Edge",
  decription = "The user stabs the foe with a sharpened stone. It has a high critical-hit ratio.",
  category = .physical,
  type = .rock,
  power = 100,
  accuracy = 80,
  powerpoints = 5,
  priority = 0,
}

let move_bite : Move {
  id = 510,
  name = "Bite",
  description = "A bite made using sharp fangs. This may cause the opponent to flinch, and it might not attack.",
  category  = .physical
  type = .dark,
  power = 60,
  accuracy = 100,
  powerpoints = 25,
  priority = 0

}

let move_fire_fang : Move {
  id = 742,
  name = "Fire Fang",
  description = "The user bites with flame-cloaked fangs. It may also make the foe flinch or sustain a burn.",
  category = .physical,
  type = .fire,
  power = 65,
  accuracy = 100,
  powerpoints = 15,
  priority = 0

}









/******************************************************************************
******************************** MON POKEMON **********************************
******************************************************************************/

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
