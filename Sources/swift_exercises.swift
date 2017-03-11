//210 Granbull
import Glibc


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

//attacks:

let play_rough_move = Move(
  id: 0,
  name: "play rough",
  description: " The user plays rough with the target and attacks it. This may also lower the target's Attack stat. ",
  category: .physical,
  type: .fairy,
  power: 90,
  accuracy: 90,
  powerpoints:10,
  priority: 0
)

let fire_blast_move = Move(
  id: 0,
  name: "fire blast",
  description: "  The target is attacked with an intense blast of all-consuming fire. This may also leave the target with a burn.  ",
  category: .special,
  type: .fire,
  power: 110,
  accuracy: 85,
  powerpoints:5,
  priority: 0
)



// TODO: create some species
// Do you use an enum, a map or constants/variables?
// http://bulbapedia.bulbagarden.net/wiki/List_of_Pokémon_by_National_Pokédex_number

let granbull_species = Species(
  id: 210,
  name: "Granbull",
  evolutions: [],
  attacks: [fire_blast_move, play_rough_move],
  type: (.fairy, nil),
  base_values:Stats(
    hitpoints: 90,
    attack: 120,
    defense: 75,
    special_attack: 60,
    special_defense: 60,
    speed: 45
  )

  )

  func calcul_stat_hp(base_stat: Int, iv: Int, ev: Int, level: Int ) -> Int{
    //J'ai du ajouter une variable temporaire pour que le compilateur ne timeout pas sur une expression
    var temp:Int=((2 * level + iv + (ev / 4)) * level) //Je ne sais pas si ev/4 arrondit correctement.
    temp=(temp / 100) //idem
    return temp + level + 10
  }

  func calcul_stat_other(base_stat: Int, iv: Int, ev: Int, level: Int, nature: Float ) -> Int{
    var temp:Int=((2 * level + iv + (ev / 4)) * level)
    temp=(temp / 100) + 5
    return Int(Float(temp) * nature)
  }
  //Je met des valeurs 9 ou 10 ou 11 pour pouvoir retourner un type Stats qui prends des int à l'intérieur, je cast et divise plus tard.
  func calcul_modif_nature(nature: Nature) -> Stats{

    switch (nature){
    case .hardy: return Stats(
      hitpoints: 10,
      attack: 10,
      defense: 10,
      special_attack: 10,
      special_defense: 10,
      speed:10
    )

    case .lonely: return Stats(
      hitpoints: 10,
      attack: 11,
      defense: 9,
      special_attack: 10,
      special_defense: 10,
      speed:10
    )

    case .brave: return Stats(
      hitpoints: 10,
      attack: 11,
      defense: 10,
      special_attack: 10,
      special_defense: 10,
      speed:9
    )

  case .adamant: return Stats(
    hitpoints: 10,
    attack: 11,
    defense: 10,
    special_attack: 9,
    special_defense: 10,
    speed:10
  )

  case .naughty: return Stats(
    hitpoints: 10,
    attack: 11,
    defense: 10,
    special_attack: 10,
    special_defense: 9,
    speed:10
  )

case .bold: return Stats(
  hitpoints: 10,
  attack: 9,
  defense: 11,
  special_attack: 10,
  special_defense: 10,
  speed:10
)

case .docile: return Stats(
  hitpoints: 10,
  attack: 10,
  defense: 10,
  special_attack: 10,
  special_defense: 10,
  speed:10
)

case .relaxed: return Stats(
  hitpoints: 10,
  attack: 10,
  defense: 11,
  special_attack: 10,
  special_defense: 10,
  speed:9
)

case .impish: return Stats(
  hitpoints: 10,
  attack: 10,
  defense: 11,
  special_attack: 9,
  special_defense: 10,
  speed:10
)

case .lax: return Stats(
  hitpoints: 10,
  attack: 10,
  defense: 11,
  special_attack: 10,
  special_defense: 9,
  speed:10
)

case .timid: return Stats(
  hitpoints: 10,
  attack: 9,
  defense: 10,
  special_attack: 10,
  special_defense: 10,
  speed:11
)

case .hasty: return Stats(
  hitpoints: 10,
  attack: 10,
  defense: 9,
  special_attack: 10,
  special_defense: 10,
  speed:11
)

case .serious: return Stats(
  hitpoints: 10,
  attack: 10,
  defense: 10,
  special_attack: 10,
  special_defense: 10,
  speed:10
)

case .jolly: return Stats(
  hitpoints: 10,
  attack: 10,
  defense: 10,
  special_attack: 9,
  special_defense: 10,
  speed:11
)

case .naive: return Stats(
  hitpoints: 10,
  attack: 10,
  defense: 10,
  special_attack: 10,
  special_defense: 9,
  speed:11
)

case .modest: return Stats(
  hitpoints: 10,
  attack: 9,
  defense: 10,
  special_attack: 11,
  special_defense: 10,
  speed:10
)

case .mild: return Stats(
  hitpoints: 10,
  attack: 10,
  defense: 9,
  special_attack: 11,
  special_defense: 10,
  speed:10
)

case .quiet: return Stats(
  hitpoints: 10,
  attack: 10,
  defense: 10,
  special_attack: 11,
  special_defense: 10,
  speed:9
)

case .bashful: return Stats(
  hitpoints: 10,
  attack: 10,
  defense: 10,
  special_attack: 10,
  special_defense: 10,
  speed:10
)

case .rash: return Stats(
  hitpoints: 10,
  attack: 10,
  defense: 10,
  special_attack: 11,
  special_defense: 9,
  speed:10
)

case .calm: return Stats(
  hitpoints: 10,
  attack: 9,
  defense: 10,
  special_attack: 10,
  special_defense: 11,
  speed:10
)

case .gentle: return Stats(
  hitpoints: 10,
  attack: 10,
  defense: 9,
  special_attack: 10,
  special_defense: 11,
  speed:10
)

case .sassy: return Stats(
  hitpoints: 10,
  attack: 10,
  defense: 10,
  special_attack: 10,
  special_defense: 11,
  speed:9
)

case .careful: return Stats(
  hitpoints: 10,
  attack: 10,
  defense: 10,
  special_attack: 9,
  special_defense: 11,
  speed:10
)

case .quirky: return Stats(
  hitpoints: 10,
  attack: 10,
  defense: 10,
  special_attack: 10,
  special_defense: 10,
  speed:10
)
    }


  }

struct Pokemon {
    let nickname          : String?
    let damages           : Int // hitpoints loses
    let size              : Int
    let weight            : Int
    let experience        : Int
    let level             : Int
    let nature            : Nature
    let species           : Species
    let moves             : [Move: Int] // Move -> remaining powerpoints
    let individual_values : Stats
    let effort_values     : Stats
    // DONE: implement the effective stats as a computed property:
    // https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID259
    // DONE add nature
     var effective_stats   : Stats {
       return Stats(
         hitpoints:       calcul_stat_hp(   base_stat: species.base_values.hitpoints,       iv: individual_values.hitpoints,       ev: effort_values.hitpoints,       level:level ),
         attack:          calcul_stat_other(base_stat: species.base_values.attack,          iv: individual_values.attack,          ev: effort_values.attack,          level:level, nature: Float(calcul_modif_nature(nature: nature).attack)/10 ),
         defense:         calcul_stat_other(base_stat: species.base_values.defense,         iv: individual_values.defense,         ev: effort_values.defense,         level:level, nature: Float(calcul_modif_nature(nature: nature).defense)/10),
         special_attack:  calcul_stat_other(base_stat: species.base_values.special_attack,  iv: individual_values.special_attack,  ev: effort_values.special_attack,  level:level, nature: Float(calcul_modif_nature(nature: nature).special_attack)/10),
         special_defense: calcul_stat_other(base_stat: species.base_values.special_defense, iv: individual_values.special_defense, ev: effort_values.special_defense, level:level, nature: Float(calcul_modif_nature(nature: nature).special_defense)/10),
         speed:           calcul_stat_other(base_stat: species.base_values.speed,           iv: individual_values.speed,           ev: effort_values.speed,           level:level, nature: Float(calcul_modif_nature(nature: nature).speed)/10))

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
//DONE!
func typeModifier(attacking: Type, defending : Type) -> Double {
    switch (attacking, defending){
    case (.normal  , .normal  ): return 1
    case (.normal  , .fighting): return 1
    case (.normal  , .flying  ): return 1
    case (.normal  , .poison  ): return 1
    case (.normal  , .ground  ): return 1
    case (.normal  , .rock    ): return 0.5
    case (.normal  , .bug     ): return 1
    case (.normal  , .ghost   ): return 0
    case (.normal  , .steel   ): return 0.5
    case (.normal  , .fire    ): return 1
    case (.normal  , .water   ): return 1
    case (.normal  , .grass   ): return 1
    case (.normal  , .electric): return 1
    case (.normal  , .psychic ): return 1
    case (.normal  , .ice     ): return 1
    case (.normal  , .dragon  ): return 1
    case (.normal  , .dark    ): return 1
    case (.normal  , .fairy   ): return 1

    case (.fighting, .normal  ): return 2
    case (.fighting, .fighting): return 1
    case (.fighting, .flying  ): return 0.5
    case (.fighting, .poison  ): return 0.5
    case (.fighting, .ground  ): return 1
    case (.fighting, .rock    ): return 2
    case (.fighting, .bug     ): return 0.5
    case (.fighting, .ghost   ): return 0
    case (.fighting, .steel   ): return 2
    case (.fighting, .fire    ): return 1
    case (.fighting, .water   ): return 1
    case (.fighting, .grass   ): return 1
    case (.fighting, .electric): return 1
    case (.fighting, .psychic ): return 0.5
    case (.fighting, .ice     ): return 2
    case (.fighting, .dragon  ): return 1
    case (.fighting, .dark    ): return 2
    case (.fighting, .fairy   ): return 0.5

    case (.flying  , .normal  ): return 1
    case (.flying  , .fighting): return 2
    case (.flying  , .flying  ): return 1
    case (.flying  , .poison  ): return 1
    case (.flying  , .ground  ): return 1
    case (.flying  , .rock    ): return 0.5
    case (.flying  , .bug     ): return 2
    case (.flying  , .ghost   ): return 1
    case (.flying  , .steel   ): return 0.5
    case (.flying  , .fire    ): return 1
    case (.flying  , .water   ): return 1
    case (.flying  , .grass   ): return 2
    case (.flying  , .electric): return 0.5
    case (.flying  , .psychic ): return 1
    case (.flying  , .ice     ): return 1
    case (.flying  , .dragon  ): return 1
    case (.flying  , .dark    ): return 1
    case (.flying  , .fairy   ): return 1

    case (.poison  , .normal  ): return 1
    case (.poison  , .fighting): return 1
    case (.poison  , .flying  ): return 1
    case (.poison  , .poison  ): return 0.5
    case (.poison  , .ground  ): return 0.5
    case (.poison  , .rock    ): return 0.5
    case (.poison  , .bug     ): return 1
    case (.poison  , .ghost   ): return 0.5
    case (.poison  , .steel   ): return 0
    case (.poison  , .fire    ): return 1
    case (.poison  , .water   ): return 1
    case (.poison  , .grass   ): return 2
    case (.poison  , .electric): return 1
    case (.poison  , .psychic ): return 1
    case (.poison  , .ice     ): return 1
    case (.poison  , .dragon  ): return 1
    case (.poison  , .dark    ): return 1
    case (.poison  , .fairy   ): return 2

    case (.ground  , .normal  ): return 1
    case (.ground  , .fighting): return 1
    case (.ground  , .flying  ): return 0
    case (.ground  , .poison  ): return 2
    case (.ground  , .ground  ): return 1
    case (.ground  , .rock    ): return 2
    case (.ground  , .bug     ): return 0.5
    case (.ground  , .ghost   ): return 1
    case (.ground  , .steel   ): return 2
    case (.ground  , .fire    ): return 2
    case (.ground  , .water   ): return 1
    case (.ground  , .grass   ): return 0.5
    case (.ground  , .electric): return 2
    case (.ground  , .psychic ): return 1
    case (.ground  , .ice     ): return 1
    case (.ground  , .dragon  ): return 1
    case (.ground  , .dark    ): return 1
    case (.ground  , .fairy   ): return 1

    case (.rock    , .normal  ): return 1
    case (.rock    , .fighting): return 0.5
    case (.rock    , .flying  ): return 2
    case (.rock    , .poison  ): return 1
    case (.rock    , .ground  ): return 0.5
    case (.rock    , .rock    ): return 1
    case (.rock    , .bug     ): return 2
    case (.rock    , .ghost   ): return 1
    case (.rock    , .steel   ): return 0.5
    case (.rock    , .fire    ): return 2
    case (.rock    , .water   ): return 1
    case (.rock    , .grass   ): return 1
    case (.rock    , .electric): return 1
    case (.rock    , .psychic ): return 1
    case (.rock    , .ice     ): return 2
    case (.rock    , .dragon  ): return 1
    case (.rock    , .dark    ): return 1
    case (.rock    , .fairy   ): return 1

    case (.bug     , .normal  ): return 1
    case (.bug     , .fighting): return 0.5
    case (.bug     , .flying  ): return 0.5
    case (.bug     , .poison  ): return 0.5
    case (.bug     , .ground  ): return 1
    case (.bug     , .rock    ): return 1
    case (.bug     , .bug     ): return 1
    case (.bug     , .ghost   ): return 0.5
    case (.bug     , .steel   ): return 0.5
    case (.bug     , .fire    ): return 0.5
    case (.bug     , .water   ): return 1
    case (.bug     , .grass   ): return 2
    case (.bug     , .electric): return 1
    case (.bug     , .psychic ): return 2
    case (.bug     , .ice     ): return 1
    case (.bug     , .dragon  ): return 1
    case (.bug     , .dark    ): return 2
    case (.bug     , .fairy   ): return 0.5

    case (.ghost   , .normal  ): return 0
    case (.ghost   , .fighting): return 1
    case (.ghost   , .flying  ): return 1
    case (.ghost   , .poison  ): return 1
    case (.ghost   , .ground  ): return 1
    case (.ghost   , .rock    ): return 1
    case (.ghost   , .bug     ): return 1
    case (.ghost   , .ghost   ): return 2
    case (.ghost   , .steel   ): return 1
    case (.ghost   , .fire    ): return 1
    case (.ghost   , .water   ): return 1
    case (.ghost   , .grass   ): return 1
    case (.ghost   , .electric): return 1
    case (.ghost   , .psychic ): return 2
    case (.ghost   , .ice     ): return 1
    case (.ghost   , .dragon  ): return 1
    case (.ghost   , .dark    ): return 0.5
    case (.ghost   , .fairy   ): return 1

    case (.steel   , .normal  ): return 1
    case (.steel   , .fighting): return 1
    case (.steel   , .flying  ): return 1
    case (.steel   , .poison  ): return 1
    case (.steel   , .ground  ): return 1
    case (.steel   , .rock    ): return 2
    case (.steel   , .bug     ): return 1
    case (.steel   , .ghost   ): return 1
    case (.steel   , .steel   ): return 0.5
    case (.steel   , .fire    ): return 0.5
    case (.steel   , .water   ): return 0.5
    case (.steel   , .grass   ): return 1
    case (.steel   , .electric): return 0.5
    case (.steel   , .psychic ): return 1
    case (.steel   , .ice     ): return 2
    case (.steel   , .dragon  ): return 1
    case (.steel   , .dark    ): return 1
    case (.steel   , .fairy   ): return 2

    case (.fire    , .normal  ): return 1
    case (.fire    , .fighting): return 1
    case (.fire    , .flying  ): return 1
    case (.fire    , .poison  ): return 1
    case (.fire    , .ground  ): return 1
    case (.fire    , .rock    ): return 0.5
    case (.fire    , .bug     ): return 2
    case (.fire    , .ghost   ): return 1
    case (.fire    , .steel   ): return 2
    case (.fire    , .fire    ): return 0.5
    case (.fire    , .water   ): return 0.5
    case (.fire    , .grass   ): return 2
    case (.fire    , .electric): return 1
    case (.fire    , .psychic ): return 1
    case (.fire    , .ice     ): return 2
    case (.fire    , .dragon  ): return 0.5
    case (.fire    , .dark    ): return 1
    case (.fire    , .fairy   ): return 1

    case (.water   , .normal  ): return 1
    case (.water   , .fighting): return 1
    case (.water   , .flying  ): return 1
    case (.water   , .poison  ): return 1
    case (.water   , .ground  ): return 2
    case (.water   , .rock    ): return 2
    case (.water   , .bug     ): return 1
    case (.water   , .ghost   ): return 1
    case (.water   , .steel   ): return 1
    case (.water   , .fire    ): return 2
    case (.water   , .water   ): return 0.5
    case (.water   , .grass   ): return 0.5
    case (.water   , .electric): return 1
    case (.water   , .psychic ): return 1
    case (.water   , .ice     ): return 1
    case (.water   , .dragon  ): return 0.5
    case (.water   , .dark    ): return 1
    case (.water   , .fairy   ): return 1

    case (.grass   , .normal  ): return 1
    case (.grass   , .fighting): return 1
    case (.grass   , .flying  ): return 0.5
    case (.grass   , .poison  ): return 0.5
    case (.grass   , .ground  ): return 2
    case (.grass   , .rock    ): return 2
    case (.grass   , .bug     ): return 0.5
    case (.grass   , .ghost   ): return 1
    case (.grass   , .steel   ): return 0.5
    case (.grass   , .fire    ): return 0.5
    case (.grass   , .water   ): return 2
    case (.grass   , .grass   ): return 0.5
    case (.grass   , .electric): return 1
    case (.grass   , .psychic ): return 1
    case (.grass   , .ice     ): return 1
    case (.grass   , .dragon  ): return 0.5
    case (.grass   , .dark    ): return 1
    case (.grass   , .fairy   ): return 1

    case (.electric, .normal  ): return 1
    case (.electric, .fighting): return 1
    case (.electric, .flying  ): return 2
    case (.electric, .poison  ): return 1
    case (.electric, .ground  ): return 0
    case (.electric, .rock    ): return 1
    case (.electric, .bug     ): return 1
    case (.electric, .ghost   ): return 1
    case (.electric, .steel   ): return 1
    case (.electric, .fire    ): return 1
    case (.electric, .water   ): return 2
    case (.electric, .grass   ): return 0.5
    case (.electric, .electric): return 0.5
    case (.electric, .psychic ): return 1
    case (.electric, .ice     ): return 1
    case (.electric, .dragon  ): return 0.5
    case (.electric, .dark    ): return 1
    case (.electric, .fairy   ): return 1

    case (.psychic , .normal  ): return 1
    case (.psychic , .fighting): return 1
    case (.psychic , .flying  ): return 1
    case (.psychic , .poison  ): return 2
    case (.psychic , .ground  ): return 1
    case (.psychic , .rock    ): return 1
    case (.psychic , .bug     ): return 1
    case (.psychic , .ghost   ): return 1
    case (.psychic , .steel   ): return 0.5
    case (.psychic , .fire    ): return 1
    case (.psychic , .water   ): return 1
    case (.psychic , .grass   ): return 1
    case (.psychic , .electric): return 1
    case (.psychic , .psychic ): return 0.5
    case (.psychic , .ice     ): return 1
    case (.psychic , .dragon  ): return 1
    case (.psychic , .dark    ): return 0
    case (.psychic , .fairy   ): return 1

    case (.ice     , .normal  ): return 1
    case (.ice     , .fighting): return 1
    case (.ice     , .flying  ): return 2
    case (.ice     , .poison  ): return 1
    case (.ice     , .ground  ): return 2
    case (.ice     , .rock    ): return 1
    case (.ice     , .bug     ): return 1
    case (.ice     , .ghost   ): return 1
    case (.ice     , .steel   ): return 0.5
    case (.ice     , .fire    ): return 0.5
    case (.ice     , .water   ): return 0.5
    case (.ice     , .grass   ): return 2
    case (.ice     , .electric): return 1
    case (.ice     , .psychic ): return 1
    case (.ice     , .ice     ): return 0.5
    case (.ice     , .dragon  ): return 2
    case (.ice     , .dark    ): return 1
    case (.ice     , .fairy   ): return 1

    case (.dragon  , .normal  ): return 1
    case (.dragon  , .fighting): return 1
    case (.dragon  , .flying  ): return 1
    case (.dragon  , .poison  ): return 1
    case (.dragon  , .ground  ): return 1
    case (.dragon  , .rock    ): return 1
    case (.dragon  , .bug     ): return 1
    case (.dragon  , .ghost   ): return 1
    case (.dragon  , .steel   ): return 0.5
    case (.dragon  , .fire    ): return 1
    case (.dragon  , .water   ): return 1
    case (.dragon  , .grass   ): return 1
    case (.dragon  , .electric): return 1
    case (.dragon  , .psychic ): return 1
    case (.dragon  , .ice     ): return 1
    case (.dragon  , .dragon  ): return 2
    case (.dragon  , .dark    ): return 1
    case (.dragon  , .fairy   ): return 0

    case (.dark    , .normal  ): return 1
    case (.dark    , .fighting): return 0.5
    case (.dark    , .flying  ): return 1
    case (.dark    , .poison  ): return 1
    case (.dark    , .ground  ): return 1
    case (.dark    , .rock    ): return 1
    case (.dark    , .bug     ): return 1
    case (.dark    , .ghost   ): return 2
    case (.dark    , .steel   ): return 1
    case (.dark    , .fire    ): return 1
    case (.dark    , .water   ): return 1
    case (.dark    , .grass   ): return 1
    case (.dark    , .electric): return 1
    case (.dark    , .psychic ): return 2
    case (.dark    , .ice     ): return 1
    case (.dark    , .dragon  ): return 1
    case (.dark    , .dark    ): return 0.5
    case (.dark    , .fairy   ): return 0.5

    case (.fairy   , .normal  ): return 1
    case (.fairy   , .fighting): return 2
    case (.fairy   , .flying  ): return 1
    case (.fairy   , .poison  ): return 0.5
    case (.fairy   , .ground  ): return 1
    case (.fairy   , .rock    ): return 1
    case (.fairy   , .bug     ): return 1
    case (.fairy   , .ghost   ): return 1
    case (.fairy   , .steel   ): return 0.5
    case (.fairy   , .fire    ): return 0.5
    case (.fairy   , .water   ): return 1
    case (.fairy   , .grass   ): return 1
    case (.fairy   , .electric): return 1
    case (.fairy   , .psychic ): return 1
    case (.fairy   , .ice     ): return 1
    case (.fairy   , .dragon  ): return 2
    case (.fairy   , .dark    ): return 2
    case (.fairy   , .fairy   ): return 1


    }

}

// http://bulbapedia.bulbagarden.net/wiki/Damage
func damage(environment : Environment, pokemon: Pokemon, move: Move, target: Pokemon) -> Int {

    var damage: Int = 2*pokemon.level
    damage = Int((Float(damage)/5)+2)*move.power

    switch (move.category){
    case .physical:
      damage = damage*Int(Float(pokemon.effective_stats.attack)/Float(pokemon.effective_stats.defense))
    case .special:
      damage = damage*Int(Float(pokemon.effective_stats.special_attack)/Float(pokemon.effective_stats.special_defense))
    case .status:
      damage = 0//Ne devrait jamais arriver, on pourait throw une exeption
    }

    damage = Int(Float(damage)/50.0)+2

    var modifier: Int = 1










    return damage

}

struct State {
    // TODO: describe a battle state
}

func battle(trainers: inout [Trainer], behavior: (State, Trainer) -> Move) -> () {
    // TODO: simulate battle
}
