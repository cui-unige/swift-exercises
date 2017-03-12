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

struct Move_temp {
  var move1 : [Move]
}
var moves_pokemon1_temp = Move_temp(
  move1 : []
)
var moves_pokemon2_temp = Move_temp(
  move1 : []
)


func ==(lhs: Move, rhs: Move) -> Bool {
    return lhs.id == rhs.id
}

// http://bulbapedia.bulbagarden.net/wiki/Statistic
struct Stats {
    var hitpoints       : Int
    var attack          : Int
    var defense         : Int
    var special_attack  : Int
    var special_defense : Int
    var speed           : Int
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
  let moves             : [Move?]
  let individual_values : Stats
  let effort_values     : Stats
  var effective_stats   : Stats
  var effective_stats1  : Stats {

    get {
      let effective_hitpoints       = effective_stats_HP(Base : species.base_values.hitpoints, IV : individual_values.hitpoints, EV: effort_values.hitpoints, level: level)
      let effective_attack          = effective_stats_other(Base : species.base_values.attack, IV : individual_values.attack, EV: effort_values.attack, level: level, nature_multiplier: (nature_coeff[nature]?.attack)!)
      let effective_defense         = effective_stats_other(Base : species.base_values.defense, IV : individual_values.defense, EV: effort_values.defense, level: level, nature_multiplier: (nature_coeff[nature]?.defense)!)
      let effective_special_attack  = effective_stats_other(Base : species.base_values.special_attack, IV : individual_values.special_attack, EV: effort_values.special_attack, level: level, nature_multiplier: (nature_coeff[nature]?.special_attack)!)
      let effective_special_defense = effective_stats_other(Base : species.base_values.special_defense, IV : individual_values.special_defense, EV: effort_values.special_defense, level: level, nature_multiplier: (nature_coeff[nature]?.special_defense)!)
      let effective_speed           = effective_stats_other(Base : species.base_values.speed, IV : individual_values.speed, EV: effort_values.speed, level: level, nature_multiplier: (nature_coeff[nature]?.speed)!)
      return Stats (
        hitpoints : effective_hitpoints,
        attack : effective_attack,
        defense : effective_defense,
        special_attack : effective_special_attack,
        special_defense : effective_special_defense,
        speed : effective_speed
      )
    }
    set{
      effective_stats.hitpoints = effective_stats1.hitpoints
      effective_stats.attack = effective_stats1.attack
      effective_stats.defense = effective_stats1.defense
      effective_stats.special_attack = effective_stats1.special_attack
      effective_stats.special_defense = effective_stats1.special_defense
      effective_stats.speed = effective_stats1.speed
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
************************** MON POKEMON : Tyranitar ****************************
******************************************************************************/


let move_earthquake = Move(
  id : 89,
  name : "Earthquake",
  description : "An attack that inflicts the damage by shaking the ground. It is useless against Flying type Pokémon.",
  category : .physical,
  type : .ground,
  power : 100,
  accuracy : 100,
  powerpoints : 10,
  priority : 0
)

let move_stone_edge = Move(
  id : 444,
  name : "Stone Edge",
  description : "The user stabs the foe with a sharpened stone. It has a high critical-hit ratio.",
  category : .physical,
  type : .rock,
  power : 100,
  accuracy : 80,
  powerpoints : 5,
  priority : 0
)

let move_bite = Move(
  id : 44,
  name : "Bite",
  description : "A bite made using sharp fangs. This may cause the opponent to flinch, and it might not attack.",
  category  : .physical,
  type : .dark,
  power : 60,
  accuracy : 100,
  powerpoints : 25,
  priority : 0
)

let move_fire_fang = Move(
  id : 424,
  name : "Fire Fang",
  description : "The user bites with flame-cloaked fangs. It may also make the foe flinch or sustain a burn.",
  category : .physical,
  type : .fire,
  power : 65,
  accuracy : 100,
  powerpoints : 15,
  priority : 0
)


/******************************* SPECIES TYRANITAR ****************************/
/******************************************************************************/
let species_TyranitarStats = Stats(
  hitpoints : 100,
  attack : 134,
  defense : 110,
  special_attack : 95,
  special_defense : 100,
  speed : 61)

let species_Tyranitar = Species(
  id : 248,
  name : "Tyranitar",
  evolutions : [],
  attacks : [],
  type : (.rock, .dark),
  base_values : species_TyranitarStats
)
/******************************************************************************/
/******************************************************************************/

let Tyranitar_IV = Stats(hitpoints : 5, attack : 6, defense : 5, special_attack : 5, special_defense : 5, speed : 5)
let Tyranitar_EV = Stats(hitpoints : 0, attack : 0, defense : 0, special_attack : 0, special_defense : 0, speed : 0)


var pokemon_Tyranitar = Pokemon(
  nickname : nil,
  hitpoints : effective_stats_HP(Base:species_TyranitarStats.hitpoints, IV:Tyranitar_IV.hitpoints, EV:Tyranitar_EV.hitpoints, level:50),
  size : 2,
  weight : 202,
  experience : 1,
  level : 50,
  nature : .hardy,
  species : species_Tyranitar,
  moves : [move_earthquake,
          move_stone_edge,
          move_bite,
          move_fire_fang],
  individual_values : Stats(hitpoints : 5, attack : 6, defense : 5, special_attack : 5, special_defense : 5, speed : 5),
  effort_values : Stats(hitpoints : 0, attack : 0, defense : 0, special_attack : 0, special_defense : 0, speed : 0),
  effective_stats : Stats(
    hitpoints : 100,
    attack : 134,
    defense : 110,
    special_attack : 95,
    special_defense : 100,
    speed : 61
  )
)


/******************************************************************************
*******************************************************************************
******************************************************************************/


/****************************** STATE Struct *********************************/
struct State {
    var pokemon1_hp : Int
    var pokemon2_hp : Int
}

var Battle_State = State(
  pokemon1_hp : 0,
  pokemon2_hp : 0
)
/******************************************************************************/



/*************************** Check state of combat ****************************/
func check_state(_ combat_state : State) -> Bool {
  if (combat_state.pokemon1_hp <= 0) {
    return true
  } else if (combat_state.pokemon2_hp <= 0){
    return true
  } else{
    return false
  }
}
/******************************************************************************/



/*********************** Environment modifier *********************************/
func Environment_Modifier(_ environment : Environment, _ move : Move) -> Double {
  var Modifier : Double = 1
  switch (environment.weather, move.type) {
    case(.harsh_sunlight, .fire) : Modifier = 1.5
    case(.harsh_sunlight, .water) : Modifier = 0.5
    case(.rain, .fire) : Modifier = 0.5
    case(.rain, .water) : Modifier = 1.5
    default : Modifier = 1
    }
  return Modifier
}
/******************************************************************************/



/*********************** Critical chance calculator ***************************/
func critical(_ pokemon : Pokemon) -> Double{
  let crit_base = pokemon.species.base_values.speed / 2

  #if os(Linux)
    let random1 = Int(random() % 256)
  #else
    let random1 = Int(arc4random_uniform(256))
  #endif

  let crit : Double = crit_base < random1 ? 2 : 1
  return crit
}
/*******************************************************************************/



/********************************** Damage ************************************/
// http://bulbapedia.bulbagarden.net/wiki/Damage
func damage(_ environment : Environment, _ pokemon: Pokemon, _ move: Move, _ target: Pokemon) -> Int {

  /* Random for the modifier calculations */
  #if os(Linux)
    let val_random2 = Double(rand()) / Double(UINT32_MAX) * 0.15 + 0.85
  #else
    let val_random2 = Double(arc4random()) / Double(UINT32_MAX) * 0.15 + 0.85
  #endif
  /* STAB value */
  let STAB : Double
  if move.type == pokemon.species.type.0 || move.type == pokemon.species.type.1 {
           STAB = 1.5
        } else {
           STAB = 1
  }

    let modifier : Double = 1 * Environment_Modifier(environment, move) * critical(pokemon) * val_random2 * STAB
    let help1 : Int = ((2 * pokemon.level / 5) + 2) * move.power
    let help2 : Int = (help1 * (pokemon.effective_stats.attack / target.effective_stats.defense)) / 50
    let help3 : Double = ((Double)(help2) + 2.0) * modifier

    let damage = Int(floor(help3))
    return damage
}
/******************************************************************************/



/**************************** Check order *************************************/
let first_random : Int = 1

func check_order(_ pokemon1 : Pokemon, _ move1 : Move, _ pokemon2 : Pokemon, _ move2 : Move, _ first_random : Int) -> Int{

  var first_move : Int = first_random
  if (move1.priority > move2.priority) {
    first_move = 1
  }
  else if (move1.priority < move2.priority) {
    first_move = 2
  }
  else if (move1.priority == move2.priority) {
    if (pokemon1.effective_stats.speed > pokemon2.effective_stats.speed){
      first_move = 1
    }
    else if (pokemon1.effective_stats.speed < pokemon2.effective_stats.speed){
      first_move = 2
    }
    else {
      if (first_move == 1) {
        first_move = 2
      }
      else if (first_move == 2) {
        first_move = 1
      }
    }
  }
  return first_move
}
/******************************************************************************/



/****************************** Chose attack **********************************/
func chose_attack(_ pokemon1 : Pokemon, _ pokemon2 : Pokemon) -> (Int, Int) {
  /* Chose attack for 1st Pokemon */
  print("Chose attack for \(pokemon1.species.name) between :")
  print("1: \(pokemon1.moves[0])")
  print("2: \(pokemon1.moves[1])")
  print("3: \(pokemon1.moves[2])")
  print("4: \(pokemon1.moves[3])")
  print("Please input the Integer of the move :")
  let move_pokemon1 = readLine()


  /* Chose attack for 2nd pokemon */
  print("Chose attack for \(pokemon2.species.name) between :")
  print("1: \(pokemon2.moves[0])")
  print("2: \(pokemon2.moves[1])")
  print("3: \(pokemon2.moves[2])")
  print("4: \(pokemon2.moves[3])")
  print("Please input the Integer of the move :")
  let move_pokemon2 = readLine()


  /* Return values of attacks */
  return (Int(move_pokemon1!)!, Int(move_pokemon2!)!)
}
/******************************************************************************/



/****************************** One trun **************************************/
func one_turn(_ pokemon1 : Pokemon, _ moves_pokemon1_temp : Move_temp, _ pokemon2 : Pokemon , _ moves_pokemon2_temp : Move_temp, _ environment : Environment) -> Bool{


  let chosen_attacks : (Int, Int) = chose_attack(pokemon1, pokemon2)
  let move_used_pokemon1 : Int = chosen_attacks.0 - 1
  let move_used_pokemon2 : Int = chosen_attacks.1 - 1
  let pokemon_priority : Int = check_order(pokemon1, moves_pokemon1_temp.move1[move_used_pokemon1], pokemon2, moves_pokemon2_temp.move1[move_used_pokemon2], first_random)

  // Pokemon 1 attacks first
  if (pokemon_priority == 1) {
    let dmg : Int = damage(environment, pokemon1, moves_pokemon1_temp.move1[move_used_pokemon1], pokemon2)
    Battle_State.pokemon2_hp = Battle_State.pokemon2_hp - dmg
    if check_state(Battle_State){
      return true
    } else {
      let dmg : Int = damage(environment, pokemon2, moves_pokemon2_temp.move1[move_used_pokemon2], pokemon1)
      Battle_State.pokemon1_hp = Battle_State.pokemon1_hp - dmg
      if check_state(Battle_State){
        return true
      }
    }
  } // Pokemon 2 attacks first
  else {
    let dmg : Int = damage(environment, pokemon2, moves_pokemon2_temp.move1[move_used_pokemon2], pokemon1)
    Battle_State.pokemon1_hp = Battle_State.pokemon1_hp - dmg
    if check_state(Battle_State){
      return true
    } else {
      let dmg : Int = damage(environment, pokemon1, moves_pokemon1_temp.move1[move_used_pokemon1], pokemon2)
      Battle_State.pokemon2_hp = Battle_State.pokemon2_hp - dmg
      if check_state(Battle_State){
        return true
      }
    }
  }
  return false
}
/******************************************************************************/



/************************** Switch pokemon ************************************/

func switch_pokemon (_  what_trainer : Trainer) -> Int{

  print("Trainer \(what_trainer.name) wishes to change pokemon ? (y / n)")
  let answer = readLine()

  if (answer! == "y"){
    print("What pokemon do you wish to use ?")
    for k in 0...5{
      print("\(k+1) : \(what_trainer.pokemons[k].species.name)")
    }
    let pokemon_to_put = readLine()
    let pokemon_int : Int = (Int)(pokemon_to_put!)!
    return pokemon_int
  }
  return 0
}

/******************************************************************************/



/************************** Pokemon Battle ************************************/
func pokemon_battle(_ pokemon1 : Pokemon, _ pokemon2 : Pokemon, _ environment_battle : Environment, _ trainer1 : Trainer, _ trainer2 : Trainer) -> () {

  var var_pokemon1 : Pokemon = pokemon1
  var var_pokemon2 : Pokemon = pokemon2


  var end_battle : Bool = false
  var Test_variable_battle : Int = 0

  while !(end_battle){

    let switch_1 = switch_pokemon(trainer1)

    switch (switch_1){
      case 1 : var_pokemon1 = trainer1.pokemons[0]
      case 2 : var_pokemon1 = trainer1.pokemons[1]
      case 3 : var_pokemon1 = trainer1.pokemons[2]
      case 4 : var_pokemon1 = trainer1.pokemons[3]
      case 5 : var_pokemon1 = trainer1.pokemons[4]
      case 6 : var_pokemon1 = trainer1.pokemons[5]
    default : Test_variable_battle = 1
    }

    let switch_2 = switch_pokemon(trainer2)
    switch (switch_2){
      case 1 : var_pokemon2 = trainer2.pokemons[0]
      case 2 : var_pokemon2 = trainer2.pokemons[1]
      case 3 : var_pokemon2 = trainer2.pokemons[2]
      case 4 : var_pokemon2 = trainer2.pokemons[3]
      case 5 : var_pokemon2 = trainer2.pokemons[4]
      case 6 : var_pokemon2 = trainer2.pokemons[5]
      default : Test_variable_battle = 1
    }

    if (Test_variable_battle == 0) {

      Battle_State.pokemon1_hp = var_pokemon1.hitpoints
      Battle_State.pokemon2_hp = var_pokemon2.hitpoints

      /* pokemon 1 moves into temp moves 1 */
      moves_pokemon1_temp.move1[0] = var_pokemon1.moves[0]!
      moves_pokemon1_temp.move1[1] = var_pokemon1.moves[1]!
      moves_pokemon1_temp.move1[2] = var_pokemon1.moves[2]!
      moves_pokemon1_temp.move1[3] = var_pokemon1.moves[3]!

      /* pokemon 2 moves into temp moves 2 */
      moves_pokemon2_temp.move1[0] = var_pokemon2.moves[0]!
      moves_pokemon2_temp.move1[1] = var_pokemon2.moves[1]!
      moves_pokemon2_temp.move1[2] = var_pokemon2.moves[2]!
      moves_pokemon2_temp.move1[3] = var_pokemon2.moves[3]!

      Test_variable_battle = 1
    }

    chose_attack(pokemon1, pokemon2)
    end_battle = one_turn(var_pokemon1, moves_pokemon1_temp, var_pokemon2, moves_pokemon2_temp, environment_battle)

    /* Reset of test variable */
    Test_variable_battle = 0

  }

}
/******************************************************************************/



/*func trainer_battle(_ trainer1 : Trainer, _ trainer2 : Trainer, environment_battle : Environment) {




}*/
