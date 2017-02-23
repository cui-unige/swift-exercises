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

// Collection to get stat modifiers based on nature
let nature_modifiers: [Nature: Stats] = [
   hardy: Stats(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:1, speed:1),
   lonely: Stats(hitpoints:1, attack:1.1, defense:0.9, special_attack:1, special_defense:1, speed:1),
   brave: Stats(hitpoints:1, attack:1.1, defense:1, special_attack:1, special_defense:1, speed:0.9),
   adamant: Stats(hitpoints:1, attack:1.1, defense:1, special_attack:0.9, special_defense:1, speed:1),
   naughty: Stats(hitpoints:1, attack:1.1, defense:1, special_attack:1, special_defense:0.9, speed:1),
   bold: Stats(hitpoints:1, attack:0.9, defense:1.1, special_attack:1, special_defense:1, speed:1),
   docile: Stats(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:1, speed:1),
   relaxed: Stats(hitpoints:1, attack:1, defense:1.1, special_attack:1, special_defense:1, speed:0.9),
   impish: Stats(hitpoints:1, attack:1, defense:1.1, special_attack:0.9, special_defense:1, speed:1),
   lax: Stats(hitpoints:1, attack:1, defense:1.1, special_attack:1, special_defense:0.9, speed:1),
   timid: Stats(hitpoints:1, attack:0.9, defense:1, special_attack:1, special_defense:1, speed:1.1),
   hasty: Stats(hitpoints:1, attack:1, defense:0.9, special_attack:1, special_defense:1, speed:1.1),
   serious: Stats(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:1, speed:1),
   jolly: Stats(hitpoints:1, attack:1, defense:1, special_attack:0.9, special_defense:1, speed:1.1),
   naive: Stats(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:0.9, speed:1.1),
   modest: Stats(hitpoints:1, attack:0.9, defense:1, special_attack:1.1, special_defense:1, speed:1),
   mild: Stats(hitpoints:1, attack:1, defense:0.9, special_attack:1.1, special_defense:1, speed:1),
   quiet: Stats(hitpoints:1, attack:1, defense:1, special_attack:1.1, special_defense:1, speed:0.9),
   bashful: Stats(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:1, speed:1),
   rash: Stats(hitpoints:1, attack:1, defense:1, special_attack:1.1, special_defense:0.9, speed:1),
   calm: Stats(hitpoints:1, attack:0.9, defense:1, special_attack:1, special_defense:1.1, speed:1),
   gentle: Stats(hitpoints:1, attack:1, defense:0.9, special_attack:1, special_defense:1.1, speed:1),
   sassy: Stats(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:1.1, speed:0.9),
   careful: Stats(hitpoints:1, attack:1, defense:1, special_attack:0.9, special_defense:1.1, speed:1),
   quirky: Stats(hitpoints:1, attack:1, defense:1, special_attack:1, special_defense:1, speed:1)
]

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

// http://bulbapedia.bulbagarden.net/wiki/List_of_Pokémon_by_National_Pokédex_number
let move_tackle = Move(
   id: 738,
   name: "Tackle",
   description: "A Normal-type attack. Many Pokemons know this attack right from the start.",
   category: .physical,
   type: .normal,
   power: 40,
   accuracy: 100,
   powerpoints: 35,
   priority: 0
)

let move_vine_whip = Move(
   id: 606,
   name: "Vine Whip",
   description: "Inflicts damage on the target.",
   category: .physical,
   type: .grass,
   power: 45,
   accuracy: 100,
   powerpoints: 25,
   priority: 0
)

let species_venusaur = Species(
   id: 003,
   name: "Venusaur",
   evolutions: [],
   attacks: [move_tackle, move_vine_whip],
   type: (.grass, .poison),
   base_values: Stats(
      hitpoints: 80,
      attack: 82,
      defense: 83,
      special_attack: 100,
      special_defense: 100,
      speed: 80
   )
)

let species_ivysaur = Species(
   id: 002,
   name: "Ivysaur",
   evolutions: [species_venusaur],
   attacks: [move_tackle, move_vine_whip],
   type: (.grass, .poison),
   base_values: Stats(
      hitpoints: 60,
      attack: 62,
      defense: 63,
      special_attack: 80,
      special_defense: 80,
      speed: 60
   )
)

let species_bulbasaur = Species(
   id: 001,
   name: "Bulbasaur",
   evolutions: [species_ivysaur, species_venusaur],
   attacks: [move_tackle, move_vine_whip],
   type: (.grass, .poison),
   base_values: Stats(
      hitpoints: 45,
      attack: 49,
      defense: 49,
      special_attack: 65,
      special_defense: 65,
      speed: 45
   )
)

// Algorithm for effective stat computation (hitpoints excluded)
func effective_stat_set(lvl L: Int, base B: Int, individual I: Int, effort E: Int, nat_mod N: Int){
   Int(Int( Double((2 * B + I + E) * L) / Double(100) + 5) * N)
}

struct Pokemon {
    let nickname          : String?
    var hitpoints         : Int // remaining hitpoints
    let size              : Int
    let weight            : Int
    var experience        : Int
    var level             : Int
    let nature            : Nature
    let species           : Species
    var moves             : [Move: Int] // Move -> remaining powerpoints
    let individual_values : Stats
    var effort_values     : Stats
    var temp_modifiers    : Stats
    var effective_stats   : Stats {
      get {
         return Stats(
            hitpoints: Int(Double((2 * species.base_values.hitpoints + individual_values.hitpoints + effort_values.hitpoints) * level) / Double(100) + level + 10) + temp_modifiers.hitpoints,
            attack: effective_stat_set(lvl: level, base: species.base_values.attack, individual: individual_values.attack, effort: effort_values.attack, nat_mod: nature_modifiers[nature].attack) + temp_modifiers.attack,
            defense: effective_stat_set(lvl: level, base: species.base_values.defense, individual: individual_values.defense, effort: effort_values.defense, nat_mod: nature_modifiers[nature].defense) + temp_modifiers.defense,
            special_attack: effective_stat_set(lvl: level, base: species.base_values.special_attack, individual: individual_values.special_attack, effort: effort_values.special_attack, nat_mod: nature_modifiers[nature].special_attack) + temp_modifiers.special_attack,
            special_defense: effective_stat_set(lvl: level, base: species.base_values.special_defense, individual: individual_values.special_defense, effort: effort_values.special_defense, nat_mod: nature_modifiers[nature].special_defense) + temp_modifiers.special_defense,
            speed: effective_stat_set(lvl: level, base: species.base_values.speed, individual: individual_values.speed, effort: effort_values.speed, nat_mod: nature_modifiers[nature].speed) + temp_modifiers.speed
         )
      }
      set(new_effective_stats){
         temp_modifiers.hitpoints += new_effective_stats.hitpoints - effective_stats.hitpoints
         temp_modifiers.attack += new_effective_stats.attack - effective_stats.attack
         temp_modifiers.defense += new_effective_stats.defense - effective_stats.defense
         temp_modifiers.special_attack += new_effective_stats.special_attack - effective_stats.special_attack
         temp_modifiers.special_defense += new_effective_stats.special_defense - effective_stats.special_defense
         temp_modifiers.speed += new_effective_stats.speed - effective_stats.speed
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
