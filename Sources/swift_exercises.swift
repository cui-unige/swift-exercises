import Darwin // Mathematical functions

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


/* Some moves/attacks definition */
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

let hydro_pump = Move(
  id: 3,
  name: "Hydro Pump Motherfuckaaa",
  description: "The target is blasted by a huge volume of water launched under great pressure, therefore crying his momma.",
  category: Category.special,
  type: Type.water,
  power: 110,
  accuracy: 80,
  powerpoints: 5,
  priority: 9999
)

let aqua_tail = Move(
  id: 4,
  name: "Aqua tail",
  description: "The user attacks by swinging its tail as if it were a vicious wave in a raging storm.",
  category: Category.physical,
  type: Type.water,
  power: 90,
  accuracy: 90,
  powerpoints: 10,
  priority: 1
)


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

// : create some species
// Do you use an enum, a map or constants/variables?
// http://bulbapedia.bulbagarden.net/wiki/List_of_Pokémon_by_National_Pokédex_number

/* Blastoise definition (third evolution of Squirtle) */

let blastoise_stat = Stats(
  hitpoints: 79,
  attack: 83,
  defense: 100,
  special_attack: 85,
  special_defense: 105,
  speed: 78
)

let blastoise = Species(
  id: 009,
  name: "Blastoise",
  evolutions: [],
  attacks: [bubble, water_gun, hydro_pump, aqua_tail],
  type: (Type.water, nil),
  base_values: blastoise_stat
)

/* Wartortle definition (second evolution of Squirtle) */

let wartortle_stat = Stats(
  hitpoints: 59,
  attack: 63,
  defense: 80,
  special_attack: 65,
  special_defense: 80,
  speed: 58
)

let  wartortle = Species(
  id: 008,
  name: "Wartortle",
  evolutions: [blastoise],
  attacks: [water_gun, aqua_tail, bubble],
  type: (Type.water, nil),
  base_values: wartortle_stat
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
  evolutions: [wartortle, blastoise],
  attacks: [water_gun, bubble],
  type: (Type.water, nil),
  base_values: squirtle_stat
)


func computeHp (_ pokemon: Pokemon) -> Int {
  // Split expressions to make the job easier for the compiler
  let sub1: Int = 2*pokemon.species.base_values.hitpoints+pokemon.individual_values.hitpoints
  let sub2: Int = Int(pokemon.effort_values.hitpoints/4)*pokemon.level
  let sub3: Int = Int((sub1+sub2)/100)
  // Final result
  return sub3 + pokemon.level + 10
}


/* Returns the "nature" coefficient (increases or decreases certain attributes of the pokemon ) */
func getNatureCoeff (_ nature: Nature, stat: String) -> Float {

  //credits for retreiving the table: Theo Giovanna
let nature_coeff: [(nature: Nature, multiplier: (hitpoints: Float, attack: Float, defense: Float, special_attack: Float, special_defense: Float, speed: Float))] = [
    (nature: Nature.hardy, multiplier: (hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1, speed: 1)),
    (nature: Nature.lonely, multiplier: (hitpoints: 1, attack: 1.1, defense: 0.9, special_attack: 1, special_defense: 1, speed: 1)),
    (nature: Nature.brave, multiplier: (hitpoints: 1, attack: 1.1, defense: 1, special_attack: 1, special_defense: 1, speed: 0.9)),
    (nature: Nature.adamant, multiplier: (hitpoints: 1, attack: 1.1, defense: 1, special_attack: 0.9, special_defense: 1, speed: 1)),
    (nature: Nature.naughty, multiplier: (hitpoints: 1, attack: 1.1, defense: 1, special_attack: 1, special_defense: 0.9, speed: 1)),
    (nature: Nature.bold, multiplier: (hitpoints: 1, attack: 0.9, defense: 1.1, special_attack: 1, special_defense: 1, speed: 1)),
    (nature: Nature.docile, multiplier: (hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1, speed: 1)),
    (nature: Nature.relaxed, multiplier: (hitpoints: 1, attack: 1, defense: 1.1, special_attack: 1, special_defense: 1, speed: 0.9)),
    (nature: Nature.impish, multiplier: (hitpoints: 1, attack: 1, defense: 1.1, special_attack: 0.9, special_defense: 1, speed: 1)),
    (nature: Nature.lax, multiplier: (hitpoints: 1, attack: 1, defense: 1.1, special_attack: 1, special_defense: 0.9, speed: 1)),
    (nature: Nature.timid, multiplier: (hitpoints: 1, attack: 0.9, defense: 1, special_attack: 1, special_defense: 1, speed: 1.1)),
    (nature: Nature.hasty, multiplier: (hitpoints: 1, attack: 1, defense: 0.9, special_attack: 1, special_defense: 1, speed: 1.1)),
    (nature: Nature.serious, multiplier: (hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1, speed: 1)),
    (nature: Nature.jolly, multiplier: (hitpoints: 1, attack: 1, defense: 1, special_attack: 0.9, special_defense: 1, speed: 1.1)),
    (nature: Nature.naive, multiplier: (hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 0.9, speed: 1.1)),
    (nature: Nature.modest, multiplier: (hitpoints: 1, attack: 0.9, defense: 1, special_attack: 1.1, special_defense: 1, speed: 1)),
    (nature: Nature.mild, multiplier: (hitpoints: 1, attack: 1, defense: 0.9, special_attack: 1.1, special_defense: 1, speed: 1)),
    (nature: Nature.quiet, multiplier: (hitpoints: 1, attack: 1, defense: 1, special_attack: 1.1, special_defense: 1, speed: 0.9)),
    (nature: Nature.bashful, multiplier: (hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1, speed: 1)),
    (nature: Nature.rash, multiplier: (hitpoints: 1, attack: 1, defense: 1, special_attack: 1.1, special_defense: 0.9, speed: 1)),
    (nature: Nature.calm, multiplier: (hitpoints: 1, attack: 0.9, defense: 1, special_attack: 1, special_defense: 1.1, speed: 1)),
    (nature: Nature.gentle, multiplier: (hitpoints: 1, attack: 1, defense: 0.9, special_attack: 1, special_defense: 1.1, speed: 1)),
    (nature: Nature.sassy, multiplier: (hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1.1, speed: 0.9)),
    (nature: Nature.careful, multiplier: (hitpoints: 1, attack: 1, defense: 1, special_attack: 0.9, special_defense: 1.1, speed: 1)),
    (nature: Nature.quirky, multiplier: (hitpoints: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1, speed: 1))
  ]

  // Should return the index of the array which first element is Nature.nature
  let ind: Int? = nature_coeff.index(where: {$0.nature == nature})
  let index_nature: Int!

  if ind == nil {
    //Error: nature not found -> Returns 1 as safety
    return 1
  } else {
    //We found the index, we can make our index non optionnal
     index_nature = ind
  }





  switch stat {
  case "attack":
    return Float(nature_coeff[index_nature].multiplier.attack)
  case "defense":
    return Float(nature_coeff[index_nature].multiplier.defense)
  case "special_attack":
    return Float(nature_coeff[index_nature].multiplier.special_attack)
  case "special_defense":
    return Float(nature_coeff[index_nature].multiplier.special_defense)
  case "speed":
    return Float(nature_coeff[index_nature].multiplier.speed)
  default:
    return 1.0
  }

}


func computeStat(_ pokemon: Pokemon, base base_value: Int, effort effort_value: Int, individual individual_value: Int, stat_name: String) -> Int {
  let nature: Float = getNatureCoeff(pokemon.nature, stat: stat_name)
  // Split expressions to make the job easier for the compiler
  let sub1: Int = Int(effort_value/4)
  let sub2: Int = 2*base_value + individual_value + sub1
  let sub3: Int = Int((sub2 * pokemon.level)/100)
  return Int(Float(sub3 + 5) * nature)
}
/**func computeStat(_ pokemon: Pokemon,_ stat: Any) -> Int {
  let nature = 1
  return Int((Int(((2*pokemon.species.base_values.stat + pokemon.individual_values.stat + Int(pokemon.effort_values.stat/4)) * pokemon.level)/100) + 5) * nature)
}**/


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
    var effective_stats: Stats {
      get {

        let stats = Stats(
            hitpoints: computeHp(self),
            attack: computeStat(self, base: self.species.base_values.attack, effort: self.effort_values.attack,
              individual: self.individual_values.attack, stat_name: "attack"),
            defense: computeStat(self, base: self.species.base_values.defense, effort: self.effort_values.defense,
              individual: self.individual_values.defense, stat_name: "defense"),
            special_attack: computeStat(self, base: self.species.base_values.special_attack, effort: self.effort_values.special_attack,
              individual: self.individual_values.special_attack, stat_name: "special_attack"),
            special_defense: computeStat(self, base: self.species.base_values.special_defense, effort: self.effort_values.special_defense,
              individual: self.individual_values.special_defense, stat_name: "special_defense"),
            speed: computeStat(self, base: self.species.base_values.speed, effort: self.effort_values.speed,
              individual: self.individual_values.speed, stat_name: "speed")
        )
        /**
        let stats = Stats(
          hitpoints: computeHp(self)
          attack: computeStat(self, attack)
          defense: computeStat(self, defense)
          special_attack: computeStat(self, special_attack)
          special_defense: computeStat(self, special_defense)
          speed: computeStat(self, speed)
        )
        **/

        return stats
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

//
func typeModifier(attacking: Type, defending : Type) -> Float {
    /*
    2d array with order normal, fighting, flying, poison, ground, rock, bug, ghost, steel, fire,
    water, grass, electric, psychic, ice, dragon, dark, fairy
    Give the multiplier coefficient for each combinaison: type_type_chart[attacking][defending]
    ex:  attacking is normal and defending is flying, then multplier is type_type_chart[0][2]

    Reference: http://bulbapedia.bulbagarden.net/wiki/Type#Type_chart
    */
    let type_type_chart: [[String]] = [["1","1","1","1","1","0.5","1","0","0.5","1","1","1","1","1","1","1"],
    ["1","2","1","0.5","0.5","1","2","0.5","0","2","1","1","1","1","0.5","2"],
    ["2","0.5","1","2","1","1","1","0.5","2","1","0.5","1","1","2","0.5","1"],
    ["1","1","1","1","1","1","0.5","0.5","0.5","1","0.5","0","1","1","2","1"],
    ["1","1","1","2","1","1","0","2","1","2","0.5","1","2","2","1","0.5"],
    ["1","1","1","1","1","1","0.5","2","1","0.5","1","2","1","0.5","2","1"],
    ["1","1","2","1","1","1","1","0.5","0.5","0.5","1","1","1","0.5","0.5","0.5"],
    ["2","1","2","1","1","2","0.5","0","1","1","1","1","1","1","2","1"],
    ["1","1","1","2","1","1","0.5","1","1","1","1","1","1","2","1","1"],
    ["0.5","0.5","1","0.5","1","2","1","1","2","1","1","1","1","1","0.5","2"],
    ["2","0.5","0.5","2","1","1","2","0.5","1","1","1","1","1","1","2","2"],
    ["1","1","2","0.5","0.5","1","1","1","0.5","1","1","1","1","0.5","0.5","2"],
    ["0.5","1","0.5","0.5","2","0.5","1","1","1","0.5","1","1","1","1","2","1"],
    ["1","1","1","1","1","2","0.5","0.5","1","1","0.5","1","1","1","2","1"],
    ["1","1","1","1","0.5","1","1","1","1","0.5","1","1","0","1","1","1"],
    ["1","2","1","1","1","0.5","0.5","0.5","2","1","1","0.5","2","1","1","1"],
    ["1","1","1","1","1","1","0.5","1","1","1","1","1","1","2","1","0"],
    ["0.5","1","1","1","1","1","2","1","1","1","1","1","2","1","1","0.5"],
    ["1","2","1","0.5","1","1","1","1","0.5","0.5","1","1","1","1","1","2"]]

    // Types array
    let types_array: [Type] = [Type.normal, Type.fighting, Type.flying, Type.poison, Type.ground, Type.rock, Type.bug, Type.ghost, Type.steel, Type.fire,
    Type.water, Type.grass, Type.electric, Type.psychic, Type.ice, Type.dragon, Type.dark, Type.fairy]

    let first_ind = types_array.index(of: attacking)!
    let second_ind = types_array.index(of: defending)!

    return Float(type_type_chart[first_ind][second_ind])!
}

// http://bulbapedia.bulbagarden.net/wiki/Damage
func damage(environment : Environment, pokemon: Pokemon, move: Move, target: Pokemon) -> Int {
    /*
    There are three cases: special, physical or status
    Case special: attack_special and defense_special are used
    Case Physical: attack and defense are used
    Case status: no damage (the move alters something else)
    */

    let attack: Int
    let defense: Int

    switch move.category {
    case .physical:
      attack = pokemon.effective_stats.attack
      defense = target.effective_stats.defense

    case .special:
      attack = pokemon.effective_stats.special_attack
      defense = target.effective_stats.special_defense

    case .status:
      return 0
    }

    let base: Float = Float(move.power)

    // Modifier computation
    // If attack is of same type as pokemon -> *1.5, *1 otherwise
    let stab: Float = (move.type == pokemon.species.type.0) || (move.type == pokemon.species.type.1) ? 1.5 : 1.0

    // Bonus/malus based on both types (first type if a pokemon has 2 types)
    var type: Float = typeModifier(attacking: move.type, defending: target.species.type.0)
    if target.species.type.1 != nil {
      type += typeModifier(attacking: move.type, defending: target.species.type.1!)
    }

    /*
    The probability of making a critical hit is based on the battle stage
    TODO: implement stages
    For now, we assume stage is 0, therefore P(critical hit) = 1/16

    arc4random_uniform(n) gives a random number between 0 and n-1
    We assume P(critical hit) = P(X = 8) with X in {1,...,16}
    */
    let critical_multiplier = arc4random_uniform(16) + 1 == 8 ? 2 : 1

    /*
    other counts for things like held items, Abilities,
    field advantages, and whether the battle is a Double Battle or Triple Battle or not.
    Without further information, I assume equal to 1
    TODO: other
    */
    let other = 1

    // Random coefficient between 0.85 and 1
    let random = (arc4random_uniform(16) + 85)/100


    // Final modifier
    let modifier: Float = Float(stab)*Float(type)*Float(critical_multiplier)*Float(other)*Float(random)


    // We can split the calculation in order to reduce computation time
    let sub1: Float = (Float((2*pokemon.level+10))/250.0)
    let sub2: Float =  (sub1*Float(attack)/Float(defense)*base)
    return Int((sub2+2)*modifier)
}

struct State {
    // TODO: describe a battle state
}

func battle(trainers: inout [Trainer], behavior: (State, Trainer) -> Move) -> () {
    // TODO: simulate battle
}
