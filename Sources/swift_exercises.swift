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

    switch (attacking, defending){

/* Attacking Type normal */
    case (.normal, .normal) : return 1
    case (.normal, .fighting) : return 1
    case (.normal, .flying) : return 1
    case (.normal, .poison) : return 1
    case (.normal, .ground) : return 1
    case (.normal, .rock) : return 1
    case (.normal, .bug) : return 1
    case (.normal, .ghost) : return 1
    case (.normal, .steel) : return 1
    case (.normal, .fire) : return 1
    case (.normal, .water) : return 1
    case (.normal, .grass) : return 1
    case (.normal, .electric) : return 1
    case (.normal, .psychic) : return 1
    case (.normal, .ice) : return 1
    case (.normal, .dragon) : return 1
    case (.normal, .dark) : return 1
    case (.normal, .fairy) : return 1

  /* Attacking Type fighting */

    case(.fighting, .normal) : return 1
    case(.fighting, .fighting) : return 1
    case(.fighting, .flying) : return 1
    case(.fighting, .poison) : return 1
    case(.fighting, .ground) : return 1
    case(.fighting, .rock) : return 1
    case(.fighting, .bug) : return 1
    case(.fighting, .ghost) : return 1
    case(.fighting, .steel) : return 1
    case(.fighting, .fire) : return 1
    case(.fighting, .water) : return 1
    case(.fighting, .grass) : return 1
    case(.fighting, .electric) : return 1
    case(.fighting, .psychic) : return 1
    case(.fighting, .ice) : return 1
    case(.fighting, .dragon) : return 1
    case(.fighting, .dark) : return 1
    case(.fighting, .fairy) : return 1

  /* Attacking Type flying */
    case(.flying, .normal) : return 1
    case(.flying, .fighting) : return 1
    case(.flying, .flying) : return 1
    case(.flying, .poison) : return 1
    case(.flying, .ground) : return 1
    case(.flying, .rock) : return 1
    case(.flying, .bug) : return 1
    case(.flying, .ghost) : return 1
    case(.flying, .steel) : return 1
    case(.flying, .fire) : return 1
    case(.flying, .water) : return 1
    case(.flying, .grass) : return 1
    case(.flying, .electric) : return 1
    case(.flying, .psychic) : return 1
    case(.flying, .ice) : return 1
    case(.flying, .dragon) : return 1
    case(.flying, .dark) : return 1
    case(.flying, .fairy) : return 1

  /* Attacking Type poison */

    case (.poison, .normal) : return 1
    case (.poison, .fighting) : return 1
    case (.poison, .flying) : return 1
    case (.poison, .poison) : return 1
    case (.poison, .ground) : return 1
    case (.poison, .rock) : return 1
    case (.poison, .bug) : return 1
    case (.poison, .normal) : return 1
    case (.poison, .ghost) : return 1
    case (.poison, .steel) : return 1
    case (.poison, .fire) : return 1
    case (.poison, .water) : return 1
    case (.poison, .grass) : return 1
    case (.poison, .electric) : return 1
    case (.poison, .psychic) : return 1
    case (.poison, .ice) : return 1
    case (.poison, .dragon) : return 1
    case (.poison, .dark) : return 1
    case (.poison, .fairy) : return 1

  /* Attacking Type ground */

    case(.ground, .normal) : return 1
    case(.ground, .fighting) : return 1
    case(.ground, .flying) : return 1
    case(.ground, .poison) : return 1
    case(.ground, .ground) : return 1
    case(.ground, .rock) : return 1
    case(.ground, .bug) : return 1
    case(.ground, .ghost) : return 1
    case(.ground, .steel) : return 1
    case(.ground, .fire) : return 1
    case(.ground, .water) : return 1
    case(.ground, .grass) : return 1
    case(.ground, .electric) : return 1
    case(.ground, .psychic) : return 1
    case(.ground, .ice) : return 1
    case(.ground, .dragon) : return 1
    case(.ground, .dark) : return 1
    case(.ground, .fairy) : return 1

  /* Attacking Type rock */

    case(.rock, .normal) : return 1
    case(.rock, .fighting) : return 1
    case(.rock, .flying) : return 1
    case(.rock, .poison) : return 1
    case(.rock, .ground) : return 1
    case(.rock, .rock) : return 1
    case(.rock, .bug) : return 1
    case(.rock, .ghost) : return 1
    case(.rock, .steel) : return 1
    case(.rock, .fire) : return 1
    case(.rock, .water) : return 1
    case(.rock, .grass) : return 1
    case(.rock, .electric) : return 1
    case(.rock, .psychic) : return 1
    case(.rock, .ice) : return 1
    case(.rock, .dragon) : return 1
    case(.rock, .dark) : return 1
    case(.rock, .fairy) : return 1

  /*  Attacking Type bug */

    case(.bug, .normal) : return 1
    case(.bug, .fighting) : return 1
    case(.bug, .flying) : return 1
    case(.bug, .poison) : return 1
    case(.bug, .ground) : return 1
    case(.bug, .rock) : return 1
    case(.bug, .bug) : return 1
    case(.bug, .ghost) : return 1
    case(.bug, .steel) : return 1
    case(.bug, .fire) : return 1
    case(.bug, .water) : return 1
    case(.bug, .grass) : return 1
    case(.bug, .electric) : return 1
    case(.bug, .psychic) : return 1
    case(.bug, .ice) : return 1
    case(.bug, .dragon) : return 1
    case(.bug, .dark) : return 1
    case(.bug, .fairy) : return 1


  /* Attacking Type ghost */

    case(.ghost, .normal) : return 1
    case(.ghost, .fighting) : return 1
    case(.ghost, .flying) : return 1
    case(.ghost, .poison) : return 1
    case(.ghost, .ground) : return 1
    case(.ghost, .rock) : return 1
    case(.ghost, .bug) : return 1
    case(.ghost, .ghost) : return 1
    case(.ghost, .steel) : return 1
    case(.ghost, .fire) : return 1
    case(.ghost, .water) : return 1
    case(.ghost, .grass) : return 1
    case(.ghost, .electric) : return 1
    case(.ghost, .psychic) : return 1
    case(.ghost, .ice) : return 1
    case(.ghost, .dragon) : return 1
    case(.ghost, .dark) : return 1
    case(.ghost, .fairy) : return 1


    }

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
