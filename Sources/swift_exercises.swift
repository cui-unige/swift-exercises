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

    static func values() -> [Type] {    //returns an array composed of all cases of this enumeration
        return [.bug, dark, dragon, electric, fairy, fighting, fire, flying, ghost, grass, ground, ice, normal, poison, psychic, rock, steel, water]
    }
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

    static func values() -> [Nature] {    //returns an array composed of all cases of this enumeration
        return [.hardy, lonely, brave, adamant, naughty, bold, docile, relaxed, impish, lax, timid, hasty, serious, jolly, naive, modest, mild, quiet, bashful,
                rash, calm, gentle, sassy, careful, quirky]
    }
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
// ans : we do better to use constants because we actually work with 'struct' types

let fire_punch_move = Move(id: 7, name: "Fire Punch", description: "Does damage and has a 10% chance of burning the opponent", category: Category.physical,
    type: Type.fire, power: 75, accuracy: 100, powerpoints: 15, priority: 0)
let double_kick_move = Move(id: 24, name: "Double kick", description: "Inflicts damage and hitting the target twice per use", category: Category.physical,
    type: Type.fighting, power: 30, accuracy: 100, powerpoints: 30, priority: 0)
let poison_sting_move = Move(id: 40, name: "Poison Sting", description: "Inflicts damage and has a 30% chance of poisoning the target", category: Category.physical,
    type: Type.poison, power: 15, accuracy: 100, powerpoints: 35, priority: 0)
let acid_move = Move(id: 51, name: "Acid", description: "Does damage and has a 10% chance of lowering the target's defense by one stage", category: Category.special,
    type: Type.poison, power: 40, accuracy: 100, powerpoints: 30, priority: 0)
let nidoking_specie = Species(id: 655, name: "Nidoking", evolutions: [], attacks: [fire_punch_move, double_kick_move, acid_move], type: (Type.poison, Type.ground),
    base_values: Stats(hitpoints: 81, attack: 92, defense: 77, special_attack: 85, special_defense: 75, speed: 85))
let nidorino_specie = Species(id: 654, name: "Nidorino", evolutions: [nidoking_specie], attacks: [poison_sting_move, acid_move], type: (Type.poison, nil),
    base_values: Stats(hitpoints: 61, attack: 72, defense: 57, special_attack: 55, special_defense: 55, speed: 65))
let nidoran_specie = Species(id: 32, name: "Nidoran", evolutions: [nidorino_specie, nidoking_specie], attacks: [poison_sting_move], type: (Type.poison, nil),
    base_values: Stats(hitpoints: 46, attack: 57, defense: 40, special_attack: 40, special_defense: 40, speed: 50))
let poissiroy_specie = Species(id: 119, name: "Poissiroy", evolutions: [], attacks: [double_kick_move], type: (Type.water, nil),
    base_values: Stats(hitpoints: 140, attack: 87, defense: 63, special_attack: 63, special_defense: 76, speed: 65))

let facts_nature: [[Double]] = [[1, 1, 1, 1, 1], [1.1, 0.9, 1, 1, 1], [1.1, 1, 1, 1, 0.9], [1.1, 1, 0.9, 1, 1], [1.1, 1, 1, 0.9, 1], [0.9, 1.1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1.1, 1, 1, 0.9],
                               [1, 1.1, 0.9, 1, 1], [1, 1.1, 1, 0.9, 1], [0.9, 1, 1, 1, 1.1], [1, 0.9, 1, 1, 1.1], [1, 1, 1, 1, 1], [1, 1, 0.9, 1, 1.1], [1, 1, 1, 0.9, 1.1], [0.9, 1, 1.1, 1, 1],
                               [1, 0.9, 1.1, 1, 1], [1, 1, 1.1, 0.9, 1], [1, 1, 1, 1, 1], [1, 1, 1.1, 0.9, 1], [0.9, 1, 1, 1.1, 1], [1, 0.9, 1, 1.1, 1], [1, 1, 1, 1.1, 0.9], [1, 1, 0.9, 1.1, 1],
                               [1, 1, 1, 1, 1]]

let facts_type: [[Double]] = [[1, 2, 1, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 2, 1, 1, 1, 0.5, 2, 1, 0.5, 1], [1, 0.5, 1, 1, 0.5, 0.5, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1], [1, 1, 2, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.5, 1],
                             [1, 1, 0.5, 0.5, 1, 1, 1, 2, 1, 0.5, 0, 1, 1, 1, 1, 1, 1, 2], [1, 2, 2, 1, 1, 2, 0.5, 1, 1, 1, 1, 1, 1, 0.5, 1, 1, 0.5, 1], [0.5, 1, 1, 1, 0.5, 1, 1, 0.5, 0, 1, 1, 1, 2, 0.5, 0.5, 2, 1, 1],
                             [2, 1, 0.5, 1, 1, 1, 0.5, 1, 1, 2, 1, 2, 1, 1, 1, 0.5, 2, 0.5], [2, 1, 1, 0.5, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1, 0.5, 0.5, 1], [1, 0.5, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 0, 1, 2, 1, 1, 1],
                             [0.5, 1, 0.5, 1, 1, 1, 0.5, 0.5, 1, 0.5, 2, 1, 1, 0.5, 1, 2, 0.5, 2], [0.5, 1, 1, 2, 1, 1, 2, 0, 1, 0.5, 1, 1, 1, 2, 1, 2, 2, 1], [1, 1, 2, 1, 1, 1, 1, 2, 1, 2, 2, 0.5, 1, 1, 1, 1, 0.5, 0.5],
                             [1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0.5, 0.5, 1], [1, 1, 1, 1, 2, 1, 1, 1, 0.5, 2, 0.5, 1, 1, 0.5, 1, 0.5, 0, 1], [1, 0, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 0.5, 1, 0.5, 1],
                             [2, 1, 1, 1, 1, 0.5, 2, 2, 1, 1, 0.5, 2, 1, 1, 1, 1, 0.5, 1], [1, 1, 1, 0.5, 2, 1, 0.5, 1, 1, 1, 1, 2, 1, 1, 1, 2, 0.5, 0.5], [1, 1, 0.5, 1, 1, 1, 2, 1, 1, 0.5, 2, 1, 1, 1, 1, 2, 1, 0.5]]

// http://bulbapedia.bulbagarden.net/wiki/List_of_Pokémon_by_National_Pokédex_number

struct Pokemon {
    let nickname          : String?
    var hitpoints         : Int // remaining hitpoints
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

    var effective_stats   : Stats {
        get {
            let base_stats = [species.base_values.hitpoints, species.base_values.attack, species.base_values.defense, species.base_values.special_attack, species.base_values.special_defense,
            species.base_values.speed]
            let iv_stats = [individual_values.hitpoints, individual_values.attack, individual_values.defense, individual_values.special_attack, individual_values.special_defense,
            individual_values.speed]
            let ev_stats = [effort_values.hitpoints, effort_values.attack, effort_values.defense, effort_values.special_attack, effort_values.special_defense, effort_values.speed]
            var new_stats = [Int]()   //ce tableau va contenir les statistiques effectives
            for i in 0 ... 5 {
                if i == 0 {   //la formule pour le calcul des points de vie est légèrement différente que pour les autres statistiques
                    let val = (2*base_stats[i] + iv_stats[i] + ev_stats[i]/4) * level/100
                    new_stats.append(Int(val) + level + 10)
                }
                else {
                    let fact = facts_nature[getIndNature(x: nature)][i-1]
                    let val = ((2*base_stats[i] + iv_stats[i] + ev_stats[i]/4) * level/100 + 5) * fact
                    new_stats.append(Int(val))
                }
            return Stats(hitpoints: new_stats[0], attack: new_stats[1], defense: new_stats[2], special_attack: new_stats[3], special_defense: new_stats[4], speed: new_stats[5])
          }
        }
        set {
            //not implemented
        }
    }
}

struct Trainer {
    var pokemons : [Pokemon]
}

struct Environment {
    let weather : Weather
    let terrain : Terrain
}

// http://bulbapedia.bulbagarden.net/wiki/Type/Type_chart
func typeModifier(attacking: Type, defending : Type) -> Double {    //returns a type modifier whose value depends of the types of the attacking and defending species
    return facts_type[getIndType(x: attacking)][getIndType(x: defending)]
}

// http://bulbapedia.bulbagarden.net/wiki/Damage
func damage(environment : Environment, pokemon: Pokemon, move: Move, target: Pokemon) -> Int {    //applies damage to the targeted Pokemon (we always consider that there is only 1 target
                                                                                                  //and that the badge and burn factors are both equal to 1)
    var w_fact, t_fact, other, stab: Double
    let rand1 = Int(random() % 256)
    let rand2 = Double(rand()) / Double(UINT32_MAX) * 0.15 + 0.85
    let critical: Double = rand1 < pokemon.species.base_values.speed/2 ? 2 : 1
    let att = Double(move.category == .physical ? pokemon.effective_stats.attack : pokemon.effective_stats.special_attack)
    let def = Double(move.category == .physical ? pokemon.effective_stats.defense : pokemon.effective_stats.special_defense)
    other = 1
    stab = 1
    w_fact = 1

    switch (environment.weather) {
    case .harsh_sunlight(let extremely):
        if move.type == .fire {
            w_fact = 1.5
        }
        if move.type == .water {
            if extremely {
                other = 0
            }
            else {
                w_fact = 0.5
            }
        }
    case .rain(let heavy):
        if move.type == .water {
            w_fact = 1.5
        }
        if move.type == .fire {
            if heavy {
                other = 0
            }
            else {
                w_fact = 0.5
            }
        }
    case .mysterious_air_current:
        if (target.species.type.0 == .flying || target.species.type.1 == .flying) && t_fact == 2 {
            other /= 2
        }
    default:
        break
    }

    if move.name == "Struggle" {
        t_fact = 1
    }
    else {
        if let secondary = target.species.type.1 {
        t_fact = typeModifier(attacking: move.type, defending: target.species.type.0) * typeModifier(attacking: move.type, defending: secondary)
        }
        else {
            t_fact = typeModifier(attacking: move.type, defending: target.species.type.0)
        }
        if move.type == pokemon.species.type.0 || move.type == pokemon.species.type.1 {
            stab = 1.5
        }
    }

    let modifier = w_fact * critical * rand2 * stab * t_fact * other
    return Int(((2*pokemon.level + 10) * move.power * att/def / 250 + 2) * modifier)
}

func getIndType(x: Type) -> Int {   //returns the index of the enumeration instance 'x' of type 'Type' in this same enumeration
    var inc = 0
    for y in Type.values() {
        if y == x {
            break
        }
        inc += 1
    }
    return inc
}

func getIndNature(x: Nature) -> Int {    //returns the index of the enumeration instance 'x' of type 'Nature' in this same enumeration
    var inc = 0
    for y in Nature.values() {
        if y == x {
            break
        }
        inc += 1
    }
    return inc
}

struct ActivePokemon {
    let pokemon: Pokemon
    let id: Int
    var moves: Array<Move> {
        get {
            return Array(pokemon.moves.keys).filter{pokemon.moves[$0]! > 0}
        }
    }
}

struct State {
    var environment: Environment
    var active_pokemons: [ActivePokemon]
    var order: (first: Int, last: Int) {    //this variable shows which of the 2 Pokemons acts first and the other second
        get {
            if active_pokemons[0].pokemon.effective_stats.speed >= active_pokemons[1].pokemon.effective_stats.speed {
                return (first: active_pokemons[0].id, last: active_pokemons[1].id)
            }
            else {
                return (first: active_pokemons[1].id, last: active_pokemons[0].id)
            }
        }
    }
    var remaining_pokemons: [[Int]]
    var escape_attempts: (Int, Int)
}

func changePokemon(state: inout State, trainers: [Trainer], trainer_num: Int) {   //makes a random choice for the next Pokemon to use in the battle
    let n = Int(random() % state.remaining_pokemons[trainer_num].count)
    let pokemon_num = state.remaining_pokemons[trainer_num][n]
    state.active_pokemons[trainer_num] = ActivePokemon(pokemon: trainers[trainer_num].pokemons[pokemon_num], id: pokemon_num)
}

func tryEscape(pokemon: Pokemon, target: Pokemon, nbTries: Int) -> Bool {   //determines if the targeted Pokemon can escape the battle
    let n = Int(random() % 256)
    let x = Double(pokemon.effective_stats.speed) * 128 / Double(target.effective_stats.speed)
    let tot = (Int(x) + 30*nbTries) % 256
    return n < tot
}

func performAttack(move: Move, trainers: inout [Trainer], trainer_num: Int, state: State) {   //performs an attack for a given trainer
    switch move.category {
    case .physical:
      let nb_damage = damage(environment: state.environment, pokemon: state.active_pokemons[trainer_num].pokemon, move: move, target: state.active_pokemons[1-trainer_num].pokemon)
      trainers[1-trainer_num].pokemons[state.active_pokemons[1-trainer_num].id].hitpoints = trainers[1-trainer_num].pokemons[state.active_pokemons[1-trainer_num].id].hitpoints > nb_damage ? trainers[1-trainer_num].pokemons[1-trainer_num].hitpoints - nb_damage : 0
      if move.name == "Struggle" {
         trainers[trainer_num].pokemons[state.active_pokemons[trainer_num].id].hitpoints = trainers[trainer_num].pokemons[state.active_pokemons[trainer_num].id].hitpoints > nb_damage/4 ? trainers[trainer_num].pokemons[trainer_num].hitpoints - nb_damage/4 : 0
      }
    case .special:
        //not implemented
        break
    case .status:
        //not implemented
        break
    default:
        break
    }
}

func checkDeath(state: inout State, next_move: inout [Move?], trainers: [Trainer], trainer_num: Int) -> Bool {    //verifies if a Pokemon was dead and if so, removes it from 'state.remaining_pokemons'
   let pokemon_num = state.active_pokemons[trainer_num].id
   if trainers[trainer_num].pokemons[pokemon_num].hitpoints == 0 {    //is dead ?
      state.remaining_pokemons[trainer_num] = state.remaining_pokemons[trainer_num].filter{$0 != pokemon_num}
      next_move[trainer_num] = nil
      if state.remaining_pokemons[trainer_num].isEmpty {
         return true
      }
      changePokemon(state: &state, trainers: trainers, trainer_num: trainer_num)
   }
   return false
}

func chooseAct(trainer: Trainer) -> String {    //choose an action for the trainer randomly

    //random choice of the trainer action (normally, the player should be able to choose the action but it would be too difficult to implement an input stream in order to
    //read values from the keyboard)
    let n = Int(Double(rand())/Double(UINT32_MAX) * 3)
    if n == 0 {
        return "Attack"
    }
    else {
        if n == 1 {
            return "Change pokemon"
        }
        else {
            return "Run"
        }
    }
}

func battle(trainers: inout [Trainer], behavior: (State, Trainer) -> Move) -> () {    //simulate a Pokemon battle between 2 trainers
    let pokemons_nums = [[Int](0 ..< trainers[0].pokemons.count).filter{trainers[0].pokemons[$0].hitpoints != 0},
                          [Int](0 ..< trainers[1].pokemons.count).filter{trainers[1].pokemons[$0].hitpoints != 0}]

    var battle_state = State(environment: Environment(weather: .clear_skies, terrain: .normal), active_pokemons: [ActivePokemon(pokemon: Array(trainers)[0].pokemons[pokemons_nums[0][0]], id: pokemons_nums[0][0]),
                       ActivePokemon(pokemon: Array(trainers)[1].pokemons[pokemons_nums[1][0]], id: pokemons_nums[1][0])], remaining_pokemons: pokemons_nums, escape_attempts: (0, 0))

    FIGHT: while true {
       //choose an action for each trainer
       let act1 = chooseAct(trainer: trainers[0])
       let act2 = chooseAct(trainer: trainers[1])
       var att_move: [Move?] = [nil, nil]

       //analyse first trainer's action
       switch act1 {
       case "Change pokemon":
          changePokemon(state: &battle_state, trainers: trainers, trainer_num: 0)
          att_move[0] = nil
       case "Run":
          battle_state.escape_attempts.0 += 1
          if tryEscape(pokemon: battle_state.active_pokemons[0].pokemon, target: battle_state.active_pokemons[1].pokemon, nbTries: battle_state.escape_attempts.0) {
             break FIGHT
          }
       case "Attack":
          att_move[0] = behavior(battle_state, trainers[0])
       default:
          //unknown action
          att_move[0] = nil
      }

      //analyse second trainer's action
      switch act2 {
      case "Change pokemon":
         changePokemon(state: &battle_state, trainers: trainers, trainer_num: 1)
         att_move[1] = nil
      case "Run":
         battle_state.escape_attempts.1 += 1
         if tryEscape(pokemon: battle_state.active_pokemons[1].pokemon, target: battle_state.active_pokemons[0].pokemon, nbTries: battle_state.escape_attempts.0) {
            break FIGHT
         }
      case "Attack":
         att_move[1] = behavior(battle_state, trainers[1])
      default:
         //unknown action
         att_move[1] = nil
      }

      //determine the order in which the trainers move to action
      let order = battle_state.active_pokemons[0].pokemon.effective_stats.speed >= battle_state.active_pokemons[1].pokemon.effective_stats.speed ? (first: 0, last: 1) : (first: 1, last: 0)

      //first attack
      if let attack = att_move[order.first] {
         performAttack(move: attack, trainers: &trainers, trainer_num: order.first, state: battle_state)
         if checkDeath(state: &battle_state, next_move: &att_move, trainers: trainers, trainer_num: order.last) || checkDeath(state: &battle_state, next_move: &att_move, trainers: trainers, trainer_num: order.first) {
            break FIGHT
         }
      }

      //second attack
      if let attack = att_move[order.last] {
         performAttack(move: attack, trainers: &trainers, trainer_num: order.last, state: battle_state)
         if checkDeath(state: &battle_state, next_move: &att_move, trainers: trainers, trainer_num: order.first) || checkDeath(state: &battle_state, next_move: &att_move, trainers: trainers, trainer_num: order.last) {
            break FIGHT
         }
      }
    }
}
