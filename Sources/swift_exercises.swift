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

//create some species
// Do you use an enum, a map or constants/variables?
// http://bulbapedia.bulbagarden.net/wiki/List_of_Pokémon_by_National_Pokédex_number

// Carapuce Arthur Louis Deschamps
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

// Dracaufeu Théo David Giovanna
// attacks
let moveAirSlash = Move(id: 1, name: "Air Slash", description: "Air Slash deals damage and has a 30% chance of causing the target to flinch", category: Category.special, type: Type.flying, power: 75, accuracy: 95, powerpoints: 20, priority: 0)

let moveDragonClaw = Move(id: 2, name: "Dragon Claw", description: "Dragon Claw deals damage with no additional effect.", category: Category.physical, type: Type.dragon, power: 80, accuracy: 100, powerpoints: 15, priority: 0)

let moveEmber = Move(id: 3, name: "Ember", description: "Ember deals damage and has a 10% chance of burning the target.", category: Category.special, type: Type.fire, power: 40, accuracy: 100, powerpoints: 25, priority: 0)

let moveFlareBlitz = Move(id: 4, name: "Flare Blitz", description: "Flare Blitz deals damage and has a 10% chance of burning the target, but the user receives 1⁄3 of the damage it inflicted in recoil. In other words, if the attack does 90 HP damage to the opponent, the user will lose 30 HP.", category: Category.physical, type: Type.fire, power: 120, accuracy: 100, powerpoints: 15, priority: 0)

let moveGrowl = Move(id: 5, name: "Growl", description: "Growl lowers the target's Attack by one stage.", category: Category.status, type: Type.normal, power: 0, accuracy: 100, powerpoints: 40, priority: 0)

let charizardStat = Stats(hitpoints: 0, attack: 0, defense: 0, special_attack: 3, special_defense: 0, speed: 0)

// Dracaufeu Species
let charizard = Species(id: 006, name: "Charizard", evolutions: [], attacks: [moveAirSlash, moveDragonClaw, moveEmber, moveFlareBlitz, moveGrowl], type: (Type.fire, nil), base_values: charizardStat)


// Pikachu Aslam Cader

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
                                     priority:0
                                   )

let quickattack = Move(            id: 98,
                                    name: "Quick attack",
                                    description: "offensive quick attack",
                                    category: .physical,
                                    type: .normal,
                                    power:40,
                                    accuracy:100,
                                    powerpoints:30,
                                    priority:1
                        )

// Pikachu Species
let pikachu = Species(id: 025,
                     name: "Pikachu",
                     evolutions: [raichu],
                     attacks: [thunderShockAttack, quickattack],
                     type: (.electric, nil),
                     base_values: pikachuStats
             )

// Fonction qui renvoie la partie de gauche des effective stats pour cette formule: http://bulbapedia.bulbagarden.net/wiki/Statistic
func calcule_effective_stats(Base: Int, IV: Int, EV: Int, Level: Int) -> Int {
  let var1: Int = EV/4 // Lors de la division par 4 d'un int, il devient un int
  let var2: Int = (2*Base + IV + var1)*Level/100 //idem

  return var2;
  }

// Création de Stats_enum qui permet de faire un case dans la fonction qui suit
enum Stats_enum {
  case hitpoints
  case attack
  case defense
  case special_attack
  case special_defense
  case speed
}

/* Fonction qui calcule le multiplicateur Nature selon la nature du Pokémon et le stat concerné

  renvoie 110 s'il s'agit d'un increased stat
  renvoie 90 s'il s'agit d'un decreased stat
  sinon 100 --> pas d'augmentation ni de pénalisation

  nécessaire
  http://bulbapedia.bulbagarden.net/wiki/Nature */
func calcul_avantage_Nature(saNature: Nature, son_stat: Stats_enum ) -> Int {

    switch(saNature, son_stat){

      /* Nature: hardy, n'a pas d'avantage ou d'inconvéniant */


      /* Nature: lonely */
    case(.lonely, .attack): return 110
    case(.lonely, .defense): return 90

      /* Nature: brave */

    case(.brave, .attack): return 110
    case(.brave, .speed): return 90

      /* Nature: adamant */

    case(.adamant, .attack): return 110
    case(.adamant, .special_attack): return 90

      /* Nature naughty */

    case(.naughty, .attack): return 110
    case(.naughty, .special_defense): return 90

      /* Nature bold */

    case(.bold, .defense): return 110
    case(.bold, .attack): return 90

      /* Nature docile, rien à faire */

      /* Nature relaxed */

    case(.relaxed, .defense): return 110
    case(.relaxed, .speed): return 90

      /* Nature impish */

    case(.impish, .defense): return 110
    case(.impish, .special_attack): return 90

      /* Nature lax */

    case(.lax, .defense): return 110
    case(.lax, .special_defense): return 90

      /* Nature timid */

    case(.timid, .speed): return 110
    case(.timid, .attack): return 90

      /* Nature hasty */

    case(.hasty, .speed): return 110
    case(.hasty, .defense): return 90

      /* Nature serious, rien à faire */


      /* Nature jolly */

    case(.jolly, .speed): return 110
    case(.jolly, .special_attack): return 90

      /* Nature naive */

    case(.naive, .speed): return 110
    case(.naive, .special_defense): return 90

      /* Nature modest */

    case(.modest, .special_attack): return 110
    case(.modest, .attack): return 90

      /* Nature mild */

    case(.mild, .special_attack): return 110
    case(.mild, .defense): return 90

      /* Nature quiet */

    case(.quiet, .special_attack): return 110
    case(.quiet, .speed): return 90

      /* Nature bashful, rien à faire */


      /* Nature rash */

    case(.rash, .special_attack): return 110
    case(.rash, .special_defense): return 90

      /* Nature calm */

    case(.calm, .special_defense): return 110
    case(.calm, .attack): return 90

      /* Nature gentle */

    case(.gentle, .special_defense): return 110
    case(.gentle, .defense): return 90

      /* Nature sassy */

    case(.sassy, .special_defense): return 110
    case(.sassy, .speed): return 90

      /* Nature careful */

    case(.careful, .special_defense): return 110
    case(.careful, .special_attack): return 90

      /* Nature quirky, RIEN à faire */

      /* Cas par défaut (100%) */

    default: return 100

    }
}


struct Pokemon {
    let nickname          : String?
    var hitpoints         : Int // remaining hitpoints
    let size              : Int
    let weight            : Int
    let experience        : Int
    let level             : Int
    let nature            : Nature
    let species           : Species
    var moves             : [Move] // Move -> remaining powerpoints
    var powerpoints       : Int
    let individual_values : Stats
    let effort_values     : Stats
    var effective_stats   : Stats { // effective_stats for Generations I and II)
                            get{ // chercher comment faire pour la multiplication par Nature
                                  let hitpoints: Int = calcule_effective_stats(Base:self.species.base_values.hitpoints, IV: self.individual_values.hitpoints, EV: self.effort_values.hitpoints, Level: self.level) + self.level + 10
                                  let attack: Int = calcule_effective_stats(Base: self.species.base_values.attack, IV: self.individual_values.attack, EV: self.effort_values.attack, Level: self.level) * calcul_avantage_Nature(saNature: self.nature, son_stat: .attack)/100
                                  let defense: Int = calcule_effective_stats(Base: self.species.base_values.defense, IV: self.individual_values.defense, EV: self.effort_values.defense, Level:self.level) * calcul_avantage_Nature(saNature: self.nature, son_stat: .defense)/100
                                  let special_attack: Int = calcule_effective_stats(Base: self.species.base_values.special_attack, IV: self.individual_values.special_attack, EV: self.effort_values.special_attack, Level:self.level) * calcul_avantage_Nature(saNature: self.nature, son_stat: .special_attack)/100
                                  let special_defense: Int = calcule_effective_stats(Base: self.species.base_values.special_defense , IV: self.individual_values.special_defense, EV: self.effort_values.special_defense, Level:self.level) * calcul_avantage_Nature(saNature: self.nature, son_stat: .special_defense)/100
                                  let speed: Int = calcule_effective_stats(Base: self.species.base_values.speed, IV: self.individual_values.speed, EV: self.effort_values.speed, Level:self.level) * calcul_avantage_Nature(saNature: self.nature, son_stat: .speed)/100

                                  // On retourne la structure calculé
                                  return Stats(hitpoints: hitpoints, attack: attack, defense: defense, special_attack: special_attack, special_defense: special_defense, speed: speed)
                            }

                          }
    // TODO: implement the effective stats as a computed property:
    // https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID259
    // var effective_stats   : Stats {
    // }
}

struct Trainer {
    let name: String!
    let pokemons : [Pokemon]
}

struct Environment {
    let weather : Weather
    let terrain : Terrain
}

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

/* Fonction damage
http://bulbapedia.bulbagarden.net/wiki/Damage

--Si attaque status: damage = 0?
*/
func damage(pokemon: Pokemon, move: Move, target: Pokemon) -> Int {

   let var1_damage: Int = ((2 * pokemon.level)/5) + 2
    
    return var1_damage;

    switch (move.category){

    case(.physical):

        let var2_damage: Int = (var1_damage * move.power * pokemon.effective_stats.attack) / (50*target.effective_stats.defense)

        return Int(Double(var2_damage + 2) * typeModifier(attacking: pokemon.species.type.0, defending : target.species.type.0));

    case(.special):

      let var2_damage: Int = (var1_damage * move.power * pokemon.effective_stats.special_attack) / (50*target.effective_stats.special_defense)

      return Int(Double(var2_damage + 2) * typeModifier(attacking: pokemon.species.type.0, defending : target.species.type.0));

    case(.status):
        return 0;
    default:
        return 0;
  }
  }

/* structure d'une attaque */
struct attacks{
  let trainer: Trainer;
  let pokemon: Pokemon;
  let attack: Move;

}

/* Cette structure permet de savoir l'état d'un match */

struct State{

   // joueur 1
   let trainer1: Trainer;
   var pokemon1: Pokemon?; // il s'agit du pokemon actuellement selectionné
   var pokemon1_dispo: [Pokemon]; // les pokemons restants pour le joueur 1
   var pokemon1_HS: [Pokemon]; // pokemon

   // joueur 2
   let trainer2: Trainer;
   var pokemon2: Pokemon?;
   var pokemon2_dispo: [Pokemon]; // les pokemons restants pour le joueur 2
   var pokemon2_HS: [Pokemon]; // pokemon

   // milieu de jeu
   //var environement: Environment;
}





let allAttacksSquirtle = [bubble, water_gun]

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

let pikachu_paul = Pokemon(
    nickname: "Pika Pika",
    hitpoints:  35,
    size:  4 ,
    weight: 15  ,
    experience: 0  ,
    level:    2,
    nature:   Nature.timid,
    species: pikachu,
    moves:  [thunderShockAttack, quickattack],
    powerpoints: 200,
    individual_values:   pikachuStats,
    effort_values: pikachuStats
    
    
);

let charizard_paul = Pokemon(
    nickname: "Dracaufeu",
    hitpoints:  35,
    size:  150,
    weight: 100  ,
    experience: 5  ,
    level:    3,
    nature:   Nature.bold,
    species: charizard,
    moves:  [moveAirSlash, moveDragonClaw, moveEmber, moveFlareBlitz, moveGrowl],
    powerpoints: 220,
    individual_values:   charizardStat,
    effort_values: charizardStat
    
    
)


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


let allAttacksPikachu = [thunderShockAttack]

let squirtle_test = Pokemon(nickname: "squirtle",
                       hitpoints: 47, size: 3, weight: 300, experience: 0, level: 1,
                       nature: Nature.calm, species: squirtle, moves: allAttacksSquirtle, powerpoints: 150,
                       individual_values: squirtleIndividualValues, effort_values: squirtleEffortValues)

var Paul = Trainer(name: "Paul", pokemons: [pikachu_paul, charizard_paul, squirtle_test]);

var Martin = Trainer(name: "Martin", pokemons: [charizard_paul]);

var Diego = Trainer(name: "Diego", pokemons: [charizard_paul]);


var all_Trainer: [Trainer] = [Paul, Martin, Diego];


/* Cette fonction renvoie vraie si l'entree n'est pas valide
faux si l'entree est valide */
func entree_juste(entree : String?, nb: Int)-> Bool {

  for i in 0 ... (nb - 1) {
    let nombre_string = String(i+1)
    if entree == nombre_string {
        return false;
    }
  }
  print("Votre entrée est invalide");
  return true;

}
/* Pour tout les entrées compris dans l'intervalle 1 ... nb --> on vérifie s'il correspond a l'entree de luttilisateur
    true si oui, sinon false
 */
func entree_compris(entree : String?, nb: Int)-> Bool {
    
    for i in 0 ... (nb - 1) {
        let nombre_string = String(i+1)
        if entree == nombre_string {
            return true;
        }
    }

    return false;
    
}

	


/* Fonction qui permet de retirer un pokemon d'un tableau de pokemon */
func remove_pokemon(array: [Pokemon], element: Pokemon?) -> [Pokemon] {
  if element != nil {
    let index_a_supp = array.index(where: { (item) -> Bool in item.nickname == element!.nickname} )
    var array_copie = array;
    array_copie.remove(at: index_a_supp!)
    return array_copie
  }
  else {
    return array
  }
}

/* fonction qui elimine les attacks que lon ne peut pas faire car pas assez de powerpoints */
func eliminate_unusable_moves(pokemon: Pokemon) -> [Move]{

  let val_max = pokemon.powerpoints
  var new_moves = pokemon.moves
    if pokemon.moves.count > 0 {

        for i in (0 ... (pokemon.moves.count - 1)).reversed(){ //reversed comme cela, il suffit de supprimer les index (et cela ne change pas les index des autres)

            if pokemon.moves[i].powerpoints > val_max {
                new_moves.remove(at: i)
            }
        }}
        else{

    }
 
  return new_moves
}

func fin_du_match() {
    print("Voulez-vous rejouer? [Y pour oui/ N pour non]")
    let entree_utilisateur: String? = readLine()
    if (entree_utilisateur == "Y") || (entree_utilisateur == "y") {
        battle()
    }
    else if (entree_utilisateur == "N") || (entree_utilisateur == "n"){
      print("Dommage, tu ne sais pas ce que tu rates...\n\n")
    }
    else {
      print("Vu que vous assez le temps d'appuyer sur un autre caractère que ceux prévu, je vous relance le jeu :D")
      battle()
    }
}
/* fonction qui calcule aléatoirement un nombre */
func random_number(nb: int)->int{
	// https://bugs.swift.org/browse/SR-685
 #if os(Linux)
            return Int(random() % (nb + 1))
        #else
            return Int(arc4random_uniform(UInt32(nb)))
        #endif
}
func battle() {
    // TODO: simulate battle

    /* ######## Début, choix du joueur ######## */
    /* ******* Utilisateur choisi ******** */
    print("Veuillez choisir votre joueur:");
    for i in 0 ... (all_Trainer.count - 1) {
        print("\(i+1) name: \(all_Trainer[i].name!)\n");
      }
    var entree_utilisateur: String?; // var qui contient l'entrée de l'Utilisateur
    repeat {
        entree_utilisateur = readLine()
      } while (entree_juste(entree: entree_utilisateur, nb: all_Trainer.count))
    // la variable semble etre bon, nous pouvons faire un unwrapping et utiliser la valeur
    let entree_int_user = Int(entree_utilisateur!)! - 1;
    print("\nVous avez choisi \(all_Trainer[entree_int_user].name!). Un très bon choix!\n");
    let joueur_IRL: Trainer = all_Trainer[entree_int_user];

    /* ******* Ordinateur choisi ******** */

   // var ordi_player: Int = Int(arc4random_uniform(UInt32(all_Trainer.count))); // var qui contiendra le numéro du joueur PC
    var ordi_player: Int = random_number(all_Trainer.count)
    repeat {
      /* utilisation de arc4random a des pb sur linux
         voir lien: https://bugs.swift.org/browse/SR-685 */
	  ordi_player = random_number(all_Trainer.count)
         // ordi_player = Int(arc4random_uniform(UInt32(all_Trainer.count)))


      } while (ordi_player == entree_int_user)

    let joueur_PC = all_Trainer[ordi_player];

    print("L'ordinateur a choisi \(all_Trainer[ordi_player].name!).\n");


    var pokemon_actuel_joueur : Pokemon?;
    var pokemon_actuel_PC : Pokemon?;



    /* #################### Choix du Pokemon ################## */

    /* choix de l'utilisateur */
    print("\nVeuillez choisir votre Pokemon:\n")

    for i in 1 ... joueur_IRL.pokemons.count {
      print("\(i). \(joueur_IRL.pokemons[i-1].nickname!)\n")
    }

    var entree_utilisateur_pokemon: String?

    repeat {
        entree_utilisateur_pokemon = readLine()
    } while (entree_juste(entree: entree_utilisateur_pokemon, nb: joueur_IRL.pokemons.count))


    let entree_int_user_pokemon = Int(entree_utilisateur_pokemon!)! - 1;
      pokemon_actuel_joueur = joueur_IRL.pokemons[entree_int_user_pokemon];
      print("Vous avez choisi: \(joueur_IRL.pokemons[entree_int_user_pokemon].nickname!)\n")


    /* Choix du PC */

    // TODO: random
   // let choix_pokemon_PC = Int(arc4random_uniform(UInt32(joueur_PC.pokemons.count)));
    let choix_pokemon_PC =  random_number(joueur_PC.pokemons.count);
    pokemon_actuel_PC = joueur_PC.pokemons[choix_pokemon_PC];
    print("Le PC a choisi: \(joueur_PC.pokemons[choix_pokemon_PC].nickname!)\n")


    /*##################### COMBAT ###################*/

    /* le combat se déroule entre joueur_IRL et joueur_PC */

    var round: Int = 1;

    var jeu_actuel = State(
                            trainer1 : joueur_IRL,
                            pokemon1: pokemon_actuel_joueur,
                            pokemon1_dispo: joueur_IRL.pokemons,
                            pokemon1_HS: [],

                            trainer2: joueur_PC,
                            pokemon2: pokemon_actuel_PC,
                            pokemon2_dispo: joueur_PC.pokemons,
                            pokemon2_HS: []

                           // environment: Environment(weather: Weather[Int(arc4random_uniform(UInt32(8)], terrain: Terrain[Int(arc4random_uniform(UInt32(5)])


        
    )

    // Début du jeu, nous enlevons le premier pokemon en cours d'utilisation des pokemons dispo

    jeu_actuel.pokemon1_dispo = remove_pokemon(array: jeu_actuel.pokemon1_dispo, element: jeu_actuel.pokemon1)
    jeu_actuel.pokemon2_dispo = remove_pokemon(array: jeu_actuel.pokemon2_dispo, element: jeu_actuel.pokemon2)

    // Pour ce code, le joueur commencera toujours le jeu
    var a_qui_le_tour: Int = 1; // vaut 1 s'il s'agit du joueur ou 2 s'il s'agit du PC

    print("####### DEBUT DU JEU #######\n\t\(joueur_IRL.name!) VS \(joueur_PC.name!)\n")
    repeat {
        // On print pour chaque round, le numéro du Round ainsi que le nombre de powerpoints et hitpoints restants pour le joueur et le PC
        print("###### ROUND \(round) #####\n")
        print("Il vous reste \(jeu_actuel.pokemon1!.powerpoints) powerpoints\n et \(jeu_actuel.pokemon1!.hitpoints) hitpoints\n")
        print("\nVotre adversaire a \(jeu_actuel.pokemon2!.powerpoints)powerpoints\n et \(jeu_actuel.pokemon2!.hitpoints) hitpoints\n")

        
        
        // Si le joueur et le PC possède chacun un pokemon
        if (jeu_actuel.pokemon1 != nil && jeu_actuel.pokemon2 != nil) {
        
                // Si le joueur actuel est le player
                if a_qui_le_tour == 1 {
                        print("C'est à votre tour de jouer.\n Veuillez choisir une attaque:\n")
                    
                        // On élimine tout les attaques inutilisables: powerpoints insuffisant
                        jeu_actuel.pokemon1!.moves = eliminate_unusable_moves(pokemon: jeu_actuel.pokemon1!)
                    
                        // S'il dispose plus d'une attaque disponible
                        if jeu_actuel.pokemon1!.moves.count > 0  {
                            
                            // On lui print les possibilités
                            for i in 0 ... (jeu_actuel.pokemon1!.moves.count - 1) {
                                print("\(i+1). \(jeu_actuel.pokemon1!.moves[i].name):\n\tdescription: \(jeu_actuel.pokemon1!.moves[i].description)\n\t nb powerpoints nécessaire: \(jeu_actuel.pokemon1!.moves[i].powerpoints)\n")
                            }
                            
                            // On récupère la donnée (initialisation nécessaire pour pouvoir faire un repear while
                            var user_attack_choice: String?;
                            repeat {
                                user_attack_choice = readLine();
                                // En redemande à l'utilisateur d'entrée une donnée correct tant que celle ci est incorrect
                            }  while (entree_juste(entree: user_attack_choice, nb: jeu_actuel.pokemon1!.moves.count))
             
    
                            // On revérifie l'entrée
                            if entree_compris(entree: user_attack_choice, nb: jeu_actuel.pokemon1!.moves.count) {
                                // Si l'entrée correspond à une attaque possible, on fait le unwrapping pour pouvoir l'utiliser
                                let user_attack_int: Int = Int(user_attack_choice!)! - 1
        
                                // on retire le nb de powerpoints utilisés
                                jeu_actuel.pokemon1!.powerpoints -= jeu_actuel.pokemon1!.moves[user_attack_int].powerpoints
   
                                // on retire le nb de hitpoints a ladversaire
                                let damage_on_adv = damage(pokemon: jeu_actuel.pokemon1!, move: jeu_actuel.pokemon1!.moves[user_attack_int], target: jeu_actuel.pokemon2!)

                
                                // On informe le joueur sur ce qu'il a fait
                                print("Vous avez attaquer le pokemon \(jeu_actuel.pokemon2!.nickname!) avec votre \(jeu_actuel.pokemon1!.nickname!) avec votre attaque: \(jeu_actuel.pokemon1!.moves[user_attack_int].name)\n")
                
                                // si pokemon adversaire KO
                                if damage_on_adv > jeu_actuel.pokemon2!.hitpoints {
                                    print("Vous avez mis le Pokemon de l'adversaire à terre.\n")

                                    // le joueur 2 doit choisir un nouveau pokemon si yen a de dispo
                                    if jeu_actuel.pokemon2_dispo.count > 0 {

                                        // nombre aléatoire pour choisir un nv pokemon
                                       // let random = Int(arc4random_uniform(UInt32(jeu_actuel.pokemon2_dispo.count))) // entre 0 et pokemon2_dispo.count
                                        let random = random_number(jeu_actuel.pokemon2_dispo.count)
					jeu_actuel.pokemon2 = jeu_actuel.pokemon2_dispo[random]
                                        jeu_actuel.pokemon2_dispo.remove(at: random)
                                        print("Votre adversaire ne se laisse pas faire, il choisit d'appeler \(jeu_actuel.pokemon2!.nickname)\n")
                                        a_qui_le_tour = 2 // on passe la main a l'adversaire
                                    }
                                        // Si le PC n'a plus de pokemon dispo
                                    else {
                                        print("Bravo, vous avez gagné! Votre adversaire n'a plus de Pokemon a disposition\n")
                                        jeu_actuel.pokemon2 = nil;
                                        jeu_actuel.pokemon1 = nil;
                                        fin_du_match()
                                    }

                                }
                                // Si le pokemon PC n'est pas KO
                                else {
                                    // On félicite le joueur pour avoir infligé cette attaque
                                    print("Votre attaque a fait un sacré ravage! Félicitations. \n")
                                    
                                    // On enleve les hitpoints sur le pokemon du PC
                                    jeu_actuel.pokemon2!.hitpoints -= damage_on_adv
                                    
                                    a_qui_le_tour = 2 // on passe la main a l'adversaire
                                }

                                // on retire les attaques qui ne sont plus possible pour ce pokemon: le pokemon adv pas besoin ==> perte uniquement de hitpoints
                                jeu_actuel.pokemon1!.moves = eliminate_unusable_moves(pokemon: jeu_actuel.pokemon1!)

                
                            }
                        }
                        // Si le pokemon du joueur n'a plus d'attaque possible
                        else {
                            print("Votre pokemon n'a plus assez de powerpoints. Vous l'avez trop épuisé.\n Vous n'avez pas été malin \(jeu_actuel.trainer1.name!).\n Choissisez un nouveau pokemon:\n")
               
                            // On fait choisir un nouveau pokemon à l'utilisateur si dispo
                            if jeu_actuel.pokemon1_dispo.count > 0 {
        
                                for i in 0 ... (jeu_actuel.pokemon1_dispo.count - 1)  {
                                    print("\(i+1). \(jeu_actuel.pokemon1_dispo[i].nickname!)\n")
                                }
                    
                                var entree_utilisateur_pokemon: String?
                                // tant qu'il entre des betises
                                repeat {
                                    entree_utilisateur_pokemon = readLine()
                                } while (entree_juste(entree: entree_utilisateur_pokemon, nb: jeu_actuel.pokemon1_dispo.count))
                    
                                // on récupère l'indice du nouveau pokemon
                                let new_pok = Int(entree_utilisateur_pokemon!)! - 1
                                // on le définit
                                jeu_actuel.pokemon1 = jeu_actuel.pokemon1_dispo[new_pok]
                                // il n'est donc plus disponible
                                jeu_actuel.pokemon1_dispo.remove(at: new_pok)
                                // On confirme le choix
                                print("Votre nouveau Pokemon est \(jeu_actuel.pokemon1!.nickname!)\n")
                                a_qui_le_tour = 2 // on passe la main a l'adversaire
                            }
                            // S'il n'y a plus de pokemon dispo
                            else{
                                print("Désolé, vous n'avez plus de Pokemons.\n")
                                jeu_actuel.pokemon2 = nil;
                                jeu_actuel.pokemon1 = nil;
                                fin_du_match()
                                a_qui_le_tour = 3
                                 }

                        }
                    
                        // Le tour du PC
                    }
                else if a_qui_le_tour == 2 {
                    print("C'est au tour de votre adversaire.\n")

                    // on elimine les attaques inutilisable
                    jeu_actuel.pokemon2!.moves = eliminate_unusable_moves(pokemon: jeu_actuel.pokemon2!)
                    // S'il peut faire des attaques
                    if jeu_actuel.pokemon2!.moves.count > 0  {

                        //random number -> numero de lattaque
                     //   let random_attack = Int(arc4random_uniform(UInt32(jeu_actuel.pokemon2!.moves.count)))
                        let random_attack = random_number(jeu_actuel.pokemon2!.moves.count)
			// Consommation de powerpoints
                        jeu_actuel.pokemon2!.powerpoints -= jeu_actuel.pokemon2!.moves[random_attack].powerpoints
                        // calcule la valeur des dommages: 0000
                        let damage_on_adv = damage(pokemon: jeu_actuel.pokemon2!, move: jeu_actuel.pokemon2!.moves[random_attack], target: jeu_actuel.pokemon1!)
            
                        print("Le pokemon de votre adversaire:\(jeu_actuel.pokemon2!.nickname!) à attaquer votre \(jeu_actuel.pokemon1!.nickname!) avec l'attaque: \(jeu_actuel.pokemon2!.moves[random_attack].name)\n")


                        // Si les dommages mettent le pokemon du joueur KO
                        if damage_on_adv > jeu_actuel.pokemon1!.hitpoints { // si le pokemon a ete mis KO
                            print("Votre \(jeu_actuel.pokemon1!.nickname!) est KO. Vous avez sous estimé votre adversaire...\n ")
                            // Si le joueur peut avoir un nouveau pokemon
                            if jeu_actuel.pokemon1_dispo.count > 0 {
                                print("Ne vous laisser pas faire \(jeu_actuel.trainer1.name)! Choisissez votre nouveau pokemon:\n")
                                // On lui présente les options
                                for i in 0 ... (jeu_actuel.pokemon1_dispo.count - 1) {
                                    print("\(i+1). \(jeu_actuel.pokemon1_dispo[i].nickname!)\n")
                                }
                                // utilisateur choisi
                                var entree_utilisateur_pokemon: String?
                                repeat {
                                    entree_utilisateur_pokemon = readLine()
                                } while (entree_juste(entree: entree_utilisateur_pokemon, nb: jeu_actuel.pokemon1_dispo.count))
                                // update des données
                                let new_pok = Int(entree_utilisateur_pokemon!)! - 1
                                jeu_actuel.pokemon1 = jeu_actuel.pokemon1_dispo[new_pok]
                                jeu_actuel.pokemon1_dispo.remove(at: new_pok)

                                print("Votre nouveau Pokemon est \(jeu_actuel.pokemon1!.nickname!)\n")
                                a_qui_le_tour = 1;
                            }
                            // Si le joueur n'a plus de pokemons
                            else {
                                print("Désolé vous n'avez plus de pokemon, vous avez perdu.\n")
                                jeu_actuel.pokemon2 = nil;
                                jeu_actuel.pokemon1 = nil;
                                fin_du_match()
                            }
                        } // si le pokemon n'a pas été mis KO
                        else {
                            // update des valeurs
                            jeu_actuel.pokemon1!.hitpoints -= damage_on_adv
                            print("Votre adversaire a réussi a vous attaquer, mais ne vous laisser pas faire!")
                            a_qui_le_tour = 1;
                        }
                    }
                    // Si le PC ne peut pas faire d'attaque
                    else {
                        print("\(jeu_actuel.trainer2.name!) vous a sous-estimé. Son Pokemon ne peut plus attaqué.\nIl choisit un nouveau Pokemon.\n")
                        // Il choisit un nouveau pokemon s'il peut
                        if jeu_actuel.pokemon2_dispo.count > 0 {
                            //let random = Int(arc4random_uniform(UInt32(jeu_actuel.pokemon2_dispo.count))) // entre 0 et pokemon2_dispo.count
                            let random = random_number(jeu_actuel.pokemon2_dispo.count)
			    jeu_actuel.pokemon2 = jeu_actuel.pokemon2_dispo[random]
                            jeu_actuel.pokemon2_dispo.remove(at: random)
                            print("Votre redoutable adversaire ne se laisse pas faire, il choisit d'appeler \(jeu_actuel.pokemon2!.nickname!)\n")
                            a_qui_le_tour = 1
                        }
                    }
               
            }
            // Si a_qui_le_tour prend une autre valeur que 1 et 2
            else {
                    print("FIN DU JEU")
                    jeu_actuel.pokemon2 = nil;
                    jeu_actuel.pokemon1 = nil;
                    fin_du_match()
            }

          } // fin du if: si les deux possèdent un pokemon
        else { // s'ils n'ont pas de pokemons
            print("L'un des joueurs n'a pas de pokemons")
            jeu_actuel.pokemon2 = nil;
            jeu_actuel.pokemon1 = nil;
            fin_du_match()
        }
        // next round
        round = round + 1;
    } while ((jeu_actuel.pokemon1 != nil) && (jeu_actuel.pokemon2 != nil)) // on fait des rounds tant qu'il y a des pokemons





}
