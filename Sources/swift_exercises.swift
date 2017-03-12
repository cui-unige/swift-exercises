
import Foundation //for the round fonction
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
//Table of nature modifiers Credits: Theo Giovanna







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
    var powerpoints : Int
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

//Nature modifiers  Credits Theo Giovanna
struct StatsDouble {
    let hitpoints       : Double
    let attack          : Double
    let defense         : Double
    let special_attack  : Double
    let special_defense : Double
    let speed           : Double
}

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

//pikachi and Raichu from Aslam Cader
// Raichu Stats
let raichuStats = Stats(hitpoints: 60, attack: 90, defense: 55, special_attack: 90,special_defense: 80, speed: 110)
// Raichu Species
let raichu = Species(id: 026,
       name: "Raichu",
       evolutions: [],
       attacks: [thunderShockAttack],
       type: (.electric, nil),
       base_values: raichuStats
)
// Pikachu Stats
let pikachuStats = Stats(hitpoints: 35, attack: 55, defense: 30, special_attack: 50,special_defense: 40, speed: 90)
// Pikachu moves
let thunderShockAttack = Move(id: 84,
                        name: "Thunder Shock",
                        description: "paralyze target",
                        category: .special,
                        type: .electric,
                        power:40,
                        accuracy:100,
                        powerpoints:30,
                        priority:0)
let quickattack = Move(id: 98,
                      name: "Quick attack",
                      description: "offensive quick attack",
                      category: .physical,
                      type: .normal,
                      power:40,
                      accuracy:100,
                      powerpoints:30,
                      priority:1 )
// Pikachu Species
let pikachu = Species(id: 025,
                     name: "Pikachu",
                     evolutions: [raichu],
                     attacks: [thunderShockAttack, quickattack],
                     type: (.electric, nil),
                     base_values: pikachuStats)

//Squirtle from theo Giovanna
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
/* Squirtle definition */

let squirtle_stat = Stats(
    hitpoints: 44,
    attack: 48,
    defense: 65,
    special_attack: 50,
    special_defense: 64,
    speed: 43
)
let squirtle = Species(
    id: 007,
    name: "Squirtle",
    evolutions: [],
    attacks: [water_gun, bubble],
    type: (Type.water, nil),
    base_values: squirtle_stat
)
//squirtle

//Ekans
let Ekans_stat = Stats(
hitpoints: 35,attack: 60,defense: 44,special_attack: 40,special_defense: 54,speed: 55)

let Warp = Move(id: 01,name : "Warp",description: "traps the target over two or three turns",category : Category.physical,type: Type.normal,power: 15,accuracy: 90,
                powerpoints: 20,priority: 0)

let Acid = Move(id: 02,name: "Acid",description: "has one  in three chance to lower targer defense", category: Category.special,type: Type.poison,power: 40,accuracy: 100,
                powerpoints: 30,priority: 1)

let Ekans = Species(id: 023 ,name: "Ekans",evolutions: [],attacks: [Warp,Acid],type: (Type.poison,nil),base_values: Ekans_stat)
///Ekans

// TODO: create some species
// Do you use an enum, a map or constants/variables?
// http://bulbapedia.bulbagarden.net/wiki/List_of_Pokémon_by_National_Pokédex_number
///computation of the effective_stats using functions that implement the formulas in the bulbapedia one to calculate hit points and the other for the rest of the Stats


func effHP(level : Int,base : Int ,individual_val : Int, effort_val : Int) -> Int {
return Int((Double((2 * base + individual_val + effort_val/4 ) * level)) / Double(100)) + level + 10
}

func OtherStat (level : Int,base : Int, individual_val : Int,effort_val : Int, nature_mod : Double) -> Int {
  return Int(floor(((Double((2 * base + individual_val + effort_val/4 ) * level)) / Double(100))*nature_mod))
}



struct Pokemon {
    let nickname          : String?
    var hitpoints         : Int // remaining hitpoints equal to zero at the beginning
    let size              : Int
    let weight            : Int
    let experience        : Int
    let level             : Int
    let nature            : Nature
    let species           : Species
    var moves             : [Move] // Move -> remaining powerpoints
    let individual_values : Stats
    let effort_values     : Stats
    // TODO: implement the effective stats as a computed property:
    // https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID

var effective_stats : Stats {
 // effective_stats for Generations IV and onward
 get {
      let eff_HP = effHP(level : level, base : species.base_values.hitpoints, individual_val: individual_values.hitpoints, effort_val: effort_values.hitpoints)
      let eff_attack = OtherStat(level : level, base : species.base_values.attack, individual_val : individual_values.attack , effort_val : effort_values.attack, nature_mod : (nature_coeff[nature]?.attack)! )
      let eff_speed = OtherStat(level : level, base : species.base_values.speed, individual_val : individual_values.speed , effort_val : effort_values.speed, nature_mod : (nature_coeff[nature]?.speed)!)
      let eff_defence = OtherStat(level : level, base : species.base_values.defense, individual_val : individual_values.defense , effort_val : effort_values.defense, nature_mod : (nature_coeff[nature]?.defense)!)
      let eff_specialatt = OtherStat(level : level, base : species.base_values.special_attack, individual_val : individual_values.special_attack , effort_val : effort_values.special_attack, nature_mod : (nature_coeff[nature]?.special_attack)!)
      let eff_specialdeff = OtherStat(level : level, base : species.base_values.special_defense, individual_val : individual_values.special_defense , effort_val : effort_values.special_defense, nature_mod : (nature_coeff[nature]?.special_defense)!)
      return Stats(hitpoints: eff_HP,attack: eff_attack,defense: eff_defence,special_attack:eff_specialatt,special_defense:eff_specialdeff,speed: eff_speed)

 }}}


struct Trainer {
    var pokemons : [Pokemon]
}

let Ash = Trainer(pokemons : [])

struct Environment {
    let weather : Weather
    let terrain : Terrain
}

// http://bulbapedia.bulbagarden.net/wiki/Type/Type_chart

    func typeModifier(attacking: Type, defending : Type) -> Double {
        // TODO: encode type/type chart
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

        case(.steel, .normal): return 1
        case(.steel, .fighting): return 1
        case(.steel, .flying): return 1
        case(.steel, .poison): return 1
        case(.steel, .ground): return 1
        case(.steel, .rock): return 2
        case(.steel, .bug): return 1
        case(.steel, .ghost): return 1
        case(.steel, .steel): return 0.5
        case(.steel, .fire): return 0.5
        case(.steel, .water): return 0.5
        case(.steel, .grass): return 1
        case(.steel, .electric): return 0.5
        case(.steel, .psychic): return 1
        case(.steel, .ice): return 2
        case(.steel, .dragon): return 1
        case(.steel, .dark): return 1
        case(.steel, .fairy): return 2

        /* Attacking Type: fire */

        case(.fire, .normal): return 1
        case(.fire, .fighting): return 1
        case(.fire, .flying): return 1
        case(.fire, .poison): return 1
        case(.fire, .ground): return 1
        case(.fire, .rock): return 0.5
        case(.fire, .bug): return 2
        case(.fire, .ghost): return 1
        case(.fire, .steel): return 2
        case(.fire, .fire): return 0.5
        case(.fire, .water): return 0.5
        case(.fire, .grass): return 2
        case(.fire, .electric): return 1
        case(.fire, .psychic): return 1
        case(.fire, .ice): return 2
        case(.fire, .dragon): return 0.5
        case(.fire, .dark): return 1
        case(.fire, .fairy): return 1

        /* Attacking Type: water */

        case(.water, .normal): return 1
        case(.water, .fighting): return 1
        case(.water, .flying): return 1
        case(.water, .poison): return 1
        case(.water, .ground): return 2
        case(.water, .rock): return 2
        case(.water, .bug): return 1
        case(.water, .ghost): return 1
        case(.water, .steel): return 1
        case(.water, .fire): return 2
        case(.water, .water): return 0.5
        case(.water, .grass): return 0.5
        case(.water, .electric): return 1
        case(.water, .psychic): return 1
        case(.water, .ice): return 1
        case(.water, .dragon): return 0.5
        case(.water, .dark): return 1
        case(.water, .fairy): return 1

        /* Attacking Type: grass */

        case(.grass, .normal): return 1
        case(.grass, .fighting): return 1
        case(.grass, .flying): return 0.5
        case(.grass, .poison): return 0.5
        case(.grass, .ground): return 2
        case(.grass, .rock): return 2
        case(.grass, .bug): return 0.5
        case(.grass, .ghost): return 1
        case(.grass, .steel): return 0.5
        case(.grass, .fire): return 0.5
        case(.grass, .water): return 2
        case(.grass, .grass): return 0.5
        case(.grass, .electric): return 1
        case(.grass, .psychic): return 1
        case(.grass, .ice): return 1
        case(.grass, .dragon): return 0.5
        case(.grass, .dark): return 1
        case(.grass, .fairy): return 1

        /* Attacking Type: electric */

        case(.electric, .normal): return 1
        case(.electric, .fighting): return 1
        case(.electric, .flying): return 2
        case(.electric, .poison): return 1
        case(.electric, .ground): return 0
        case(.electric, .rock): return 1
        case(.electric, .bug): return 1
        case(.electric, .ghost): return 1
        case(.electric, .steel): return 1
        case(.electric, .fire): return 1
        case(.electric, .water): return 2
        case(.electric, .grass): return 0.5
        case(.electric, .electric): return 0.5
        case(.electric, .psychic): return 1
        case(.electric, .ice): return 1
        case(.electric, .dragon): return 0.5
        case(.electric, .dark): return 1
        case(.electric, .fairy): return 1

        /* Attacking Type: psychic */

        case(.psychic, .normal): return 1
        case(.psychic, .fighting): return 2
        case(.psychic, .flying): return 1
        case(.psychic, .poison): return 2
        case(.psychic, .ground): return 1
        case(.psychic, .rock): return 1
        case(.psychic, .bug): return 1
        case(.psychic, .ghost): return 1
        case(.psychic, .steel): return 0.5
        case(.psychic, .fire): return 1
        case(.psychic, .water): return 1
        case(.psychic, .grass): return 1
        case(.psychic, .electric): return 1
        case(.psychic, .psychic): return 0.5
        case(.psychic, .ice): return 1
        case(.psychic, .dragon): return 1
        case(.psychic, .dark): return 0
        case(.psychic, .fairy): return 1

        /* Attacking Type: ice */

        case(.ice, .normal): return 1
        case(.ice, .fighting): return 1
        case(.ice, .flying): return 2
        case(.ice, .poison): return 1
        case(.ice, .ground): return 2
        case(.ice, .rock): return 1
        case(.ice, .bug): return 1
        case(.ice, .ghost): return 1
        case(.ice, .steel): return 0.5
        case(.ice, .fire): return 0.5
        case(.ice, .water): return 0.5
        case(.ice, .grass): return 2
        case(.ice, .electric): return 1
        case(.ice, .psychic): return 1
        case(.ice, .ice): return 0.5
        case(.ice, .dragon): return 2
        case(.ice, .dark): return 1
        case(.ice, .fairy): return 1

        /* Attacking Type: dragon */

        case(.dragon, .normal): return 1
        case(.dragon, .fighting): return 1
        case(.dragon, .flying): return 1
        case(.dragon, .poison): return 1
        case(.dragon, .ground): return 1
        case(.dragon, .rock): return 1
        case(.dragon, .bug): return 1
        case(.dragon, .ghost): return 1
        case(.dragon, .steel): return 0.5
        case(.dragon, .fire): return 1
        case(.dragon, .water): return 1
        case(.dragon, .grass): return 1
        case(.dragon, .electric): return 1
        case(.dragon, .psychic): return 1
        case(.dragon, .ice): return 1
        case(.dragon, .dragon): return 2
        case(.dragon, .dark): return 1
        case(.dragon, .fairy): return 0

        /* Attacking Type: dark */

        case(.dark, .normal): return 1
        case(.dark, .fighting): return 0.5
        case(.dark, .flying): return 1
        case(.dark, .poison): return 1
        case(.dark, .ground): return 1
        case(.dark, .rock): return 1
        case(.dark, .bug): return 1
        case(.dark, .ghost): return 2
        case(.dark, .steel): return 1
        case(.dark, .fire): return 1
        case(.dark, .water): return 1
        case(.dark, .grass): return 1
        case(.dark, .electric): return 1
        case(.dark, .psychic): return 2
        case(.dark, .ice): return 1
        case(.dark, .dragon): return 1
        case(.dark, .dark): return 0.5
        case(.dark, .fairy): return 0.5

        /* Attacking Type: fairy */

        case(.fairy, .normal): return 1
        case(.fairy, .fighting): return 2
        case(.fairy, .flying): return 1
        case(.fairy, .poison): return 0.5
        case(.fairy, .ground): return 1
        case(.fairy, .rock): return 1
        case(.fairy, .bug): return 1
        case(.fairy, .ghost): return 1
        case(.fairy, .steel): return 0.5
        case(.fairy, .fire): return 0.5
        case(.fairy, .water): return 1
        case(.fairy, .grass): return 1
        case(.fairy, .electric): return 1
        case(.fairy, .psychic): return 1
        case(.fairy, .ice): return 1
        case(.fairy, .dragon): return 2
        case(.fairy, .dark): return 2
        case(.fairy, .fairy): return 1

        }

    }
// http://bulbapedia.bulbagarden.net/wiki/Damage
func damage( pokemon: Pokemon, move: Move, target: Pokemon) -> Int {
    // TODO
    //function that calculates the damage i exclude the badge and critical hits
    //there are two types of damage physical or special
    // the damage delt is dependant to the level eff_attack
    //at the end there is also a modifier dependant on the environment and various element
    //For now equal to 1

    let type_mod: Double

    let attack = Double(move.category == .physical ? pokemon.effective_stats.attack : pokemon.effective_stats.special_attack)
    let defense = Double(move.category == .physical ? target.effective_stats.defense : target.effective_stats.special_defense)
    //Crital hits by way of the RNG
    //  let rand = Double(randomNumber)

    //typeModifier
    type_mod = typeModifier(attacking: move.type,defending: target.species.type.0)

    let Damage = Int((Double(2*pokemon.level+10)*attack/defense)*type_mod)

    //TODO environment hasards stab mod and other modifiers
    //NOTE the random Number doesnt work for some reason

    return Damage
}

struct State {
    // TODO: describe a battle state
    //pokemon being a turn based game i describe the battle as having 2 states the turn of the first player and the turn of the second player
    //PLAYER 2
    let player1: Trainer
    let player2: Trainer
    //they each have their pokemons
    var pokemon1: Pokemon
    var pokemon2: Pokemon
    //and a set of moves here i consider the slected move
    var pokemon1move : Move
    var pokemon2move : Move
}
////pokemons
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


let pikachuAllattacks = [thunderShockAttack,quickattack]
let pikachu_A = Pokemon(nickname:"pika",
                        hitpoints: 38,size: 2,weight:100,experience:0,level:1,
                      nature: Nature.docile,species:pikachu,moves: pikachuAllattacks ,individual_values: pikachuIndividualValues,effort_values: pikachuEffortValues)
//trainers

var ash = Trainer(pokemons: [pikachu_A])
var mystie = Trainer( pokemons: [pikachu_A])

var currentState = State(player1: ash,player2: mystie,pokemon1:ash.pokemons[0],pokemon2:mystie.pokemons[0],pokemon1move:ash.pokemons[0].moves[0],pokemon2move:mystie.pokemons[0].moves[0])
 var DMG: Int = 0
 var turn: Int = 1

func battle(trainers: inout [Trainer], behavior: (State, Trainer) -> Move) -> () {
    // TODO: simulate battle
 //1 for ash turn 2 for mystie turn ash always starts first


    print("player1 turn")
    print("please choose a Move")
    print("\(1) \(currentState.pokemon1.moves[1].name)")
    print("\(2) \(currentState.pokemon1.moves[2].name)")
    print("remaining pp for move 1 ")
    print("\(currentState.pokemon1.moves[1].powerpoints)")
    print("remaining pp for move 2 ")
    print("\(currentState.pokemon1.moves[2].powerpoints)")

  if let entry = readLine(){
    if let choice = Int(entry){
      if (choice > 2){
        print("no such move")
      }
      else{
        currentState.pokemon1move = currentState.pokemon1.moves[choice - 1]

      currentState.pokemon1move.powerpoints -= 1
      ash.pokemons[0].moves[choice - 1].powerpoints -= 1

      if (currentState.pokemon1move.powerpoints == 0) {
        currentState.pokemon1.moves.remove(at: choice - 1)
        ash.pokemons[0].moves.remove(at: choice - 1)
        print("the move has no more pp left")
      }
      }
    }
  }

DMG =  damage(pokemon: currentState.pokemon2,move:currentState.pokemon2move,target:currentState.pokemon1)
currentState.pokemon1.hitpoints = currentState.pokemon2.hitpoints - DMG;

//when the pokemon Faints

if currentState.pokemon2.hitpoints <= 0 {
  print("Msties pokemon fainted")
  print("Ash is the winner")
}

if turn == 2 {
  print("player2 turn")
  print("please choose a Move")
  print("\(1) \(currentState.pokemon2.moves[1].name)")
  print("\(2) \(currentState.pokemon2.moves[2].name)")
  print("remaining pp for move 1 ")
  print("\(currentState.pokemon2.moves[1].powerpoints)")
  print("remaining pp for move 2 ")
  print("\(currentState.pokemon2.moves[2].powerpoints)")

  if let entry = readLine(){
    if let choice = Int(entry){
      if (choice > 2){
        print("no such move")
      }
      else{
        currentState.pokemon2move = currentState.pokemon2.moves[choice - 1]

      currentState.pokemon2move.powerpoints -= 1
      mystie.pokemons[0].moves[choice - 1].powerpoints -= 1

      if (currentState.pokemon2move.powerpoints == 0) {
        currentState.pokemon2.moves.remove(at: choice - 1)
        mystie.pokemons[0].moves.remove(at: choice - 1)
        print("the move has no more pp left")
      }
      }
    }
  }

DMG =  damage(pokemon: currentState.pokemon1,move:currentState.pokemon1move,target:currentState.pokemon2)
currentState.pokemon2.hitpoints = currentState.pokemon1.hitpoints - DMG;
}

if currentState.pokemon1.hitpoints <= 0 {
  print("Ashs pokemon fainted")
  print("Mystie is the winner")
}

  }

  func go()->(){
    print("battle");
    print("\n select a pokemon \n");

   //NOTE Cant make it work correctly due to an error with wercker
   //Details : using wercker build starts downloading packages with each call
   //only managed to test the function once
   //rest of the time wercker would continue downloading packages until there is no space laeft
  }
