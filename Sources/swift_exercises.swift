// For random numbers in linux:
import Glibc
import Foundation

// http://bulbapedia.bulbagarden.net/wiki/Type
enum Type: Int {
    case bug = 6
    case dark = 16
    case dragon = 15
    case electric = 12
    case fairy = 17
    case fighting = 1
    case fire = 9
    case flying = 2
    case ghost = 7
    case grass = 11
    case ground = 4
    case ice = 14
    case normal = 0
    case poison = 3
    case psychic = 13
    case rock = 5
    case steel = 8
    case water = 10
}

// http://bulbapedia.bulbagarden.net/wiki/Damage_category
enum Category {
    case physical
    case special
    case status
}

// http://bulbapedia.bulbagarden.net/wiki/Nature
enum Nature: Int {
    case hardy = 0
    case lonely = 1
    case brave = 2
    case adamant = 3
    case naughty = 4
    case bold = 5
    case docile = 6
    case relaxed = 7
    case impish = 8
    case lax = 9
    case timid = 10
    case hasty = 11
    case serious = 12
    case jolly = 13
    case naive = 14
    case modest = 15
    case mild = 16
    case quiet = 17
    case bashful = 18
    case rash = 19
    case calm = 20
    case gentle = 21
    case sassy = 22
    case careful = 23
    case quirky = 24
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

let earthquake = Move(
    id: 89,
    name: "Earthquake",
    description: "Tough but useless vs. flying foes.",
    category: .physical,
    type: .ground,
    power: 100,
    accuracy: 100,
    powerpoints: 10,
    priority: 0
)

let solar_beam = Move(
    id: 76,
    name: "Solar Beam",
    description: "Super beam (very strong!!!)",
    category: .special,
    type: .grass,
    power: 120,
    accuracy: 100,
    powerpoints: 10,
    priority: 0
)

let thunder = Move(
    id: 87,
    name: "Thunder",
    description: "Super thunder (!!!)",
    category: .special,
    type: .electric,
    power: 110,
    accuracy: 70,
    powerpoints: 10,
    priority: 0
)

let facade = Move(
    id: 263,
    name: "Facade",
    description: "it was merely an act xddddddddd",
    category: .physical,
    type: .normal,
    power: 70,
    accuracy: 100,
    powerpoints: 20,
    priority: 0
)

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
    var hitpoints       : Int
    var attack          : Int
    var defense         : Int
    var special_attack  : Int
    var special_defense : Int
    var speed           : Int
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

let hooh: Pokemon = Pokemon(
  nickname: "kyouko taiga",
  size: 3.8,
  weight: 199,
  level: 100,
  nature: .relaxed,
  species: Species(
    id: 253, name: "Ho-Oh", evolutions: [], attacks: [], type: (.fire, .flying), base_values: Stats(hitpoints: 106, attack: 130, defense: 90, special_attack: 110, special_defense: 154, speed: 90)
  ),
  moves: [  earthquake: earthquake.powerpoints, solar_beam: solar_beam.powerpoints,
            thunder: thunder.powerpoints, facade: facade.powerpoints],
  individual_values: Stats(hitpoints: 15, attack: 21, defense: 23, special_attack: 12, special_defense: 26, speed: 24),
  effort_values: Stats(hitpoints: 66, attack: 100, defense: 60, special_attack: 30, special_defense: 75, speed: 90)
)

struct Pokemon {
    var nickname          : String?
    let size              : Double
    let weight            : Double
    let level             : Int
    var experience        : Int {
      return 4*level*level*level/45
    }
    let nature            : Nature
    let species           : Species
    var moves             : [Move: Int] // Move -> remaining powerpoints (dict)
    let individual_values : Stats
    let effort_values     : Stats

    // TODO: implement the effective stats as a computed property:
    // https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID259
    var effective_stats   : Stats {
      get {
        // attack, defence, special attack, special defense, speed
        let natureChart: [[Double]] = [   [1.1, 0.9, 1, 1, 1],
                                          [1.1, 1, 1, 1, 0.9],
                                          [1.1, 1, 0.9, 1, 1],
                                          [1.1, 1, 1, 0.9, 1],
                                          [0.9, 1.1, 1, 1, 1],
                                          [1, 1, 1, 1, 1],
                                          [1, 1.1, 1, 1, 0.9],
                                          [1, 1.1, 0.9, 1, 1],
                                          [1, 1.1, 1, 0.9, 1],
                                          [0.9, 1.1, 1, 1, 1.1],
                                          [1, 0.9, 1, 1, 1.1],
                                          [1, 1, 1, 1, 1],
                                          [1, 1.1, 0.9, 1, 1.1],
                                          [1, 1.1, 1, 0.9, 1.1],
                                          [0.9, 1, 1.1, 1, 1],
                                          [1, 0.9, 1.1, 1, 1],
                                          [1, 1, 1.1, 1, 0.9],
                                          [1, 1, 1, 1, 1],
                                          [1, 1, 1.1, 0.9, 1],
                                          [0.9, 1, 1, 1.1, 1],
                                          [1, 0.9, 1, 1.1, 1],
                                          [1, 1, 1, 1.1, 0.9],
                                          [1, 1, 0.9, 1.1, 1],
                                          [1, 1, 1, 1, 1]]

        // swift is shit omfg i can't even do this in one line wtf i non-unironically have to cut this formula in multiple lines and wow i don't even
        let hp1 = 2 * species.base_values.hitpoints + individual_values.hitpoints;
        let hp2 = Double(hp1 + (effort_values.hitpoints / 4) * level) / 100
        let hp3 = Int(floor(hp2) + Double(level) + 10);

        let att1 = 2 * species.base_values.attack + individual_values.attack;
        let att2 = Double(att1 + (effort_values.attack / 4) * level) / 100
        let att3 = Int(floor(Double(floor(att2) + 5) * natureChart[nature.rawValue][0]))

        let def1 = 2 * species.base_values.defense + individual_values.defense
        let def2 = Double(def1 + (effort_values.defense / 4) * level) / 100
        let def3 = Int(floor(Double(floor(def2) + 5) * natureChart[nature.rawValue][1]))

        let satt1 = 2 * species.base_values.special_attack + individual_values.special_attack
        let satt2 = Double(satt1 + (effort_values.special_attack / 4) * level) / 100
        let satt3 = Int(floor(Double(floor(satt2) + 5) * natureChart[nature.rawValue][2]))

        let sdef1 = 2 * species.base_values.special_defense + individual_values.special_defense
        let sdef2 = Double(sdef1 + (effort_values.special_defense / 4) * level) / 100
        let sdef3 = Int(floor(Double(floor(sdef2) + 5) * natureChart[nature.rawValue][3]))

        let spe1 = 2 * species.base_values.speed + individual_values.speed
        let spe2 = Double(spe1 + (effort_values.speed / 4) * level) / 100
        let spe3 = Int(floor(Double(floor(spe2) + 5) * natureChart[nature.rawValue][4]))

        return Stats(hitpoints: hp3, attack: att3, defense: def3, special_attack: satt3, special_defense: sdef3, speed: spe3)
      }
    }

    var battle_stats      : Stats // Copy of effective stats, used during battle

    init(nickname: String?, size: Double, weight: Double, level: Int, nature: Nature, species: Species, moves: [Move: Int], individual_values: Stats, effort_values: Stats) {
        self.nickname = nickname;
        self.size = size;
        self.weight = weight;
        self.level = level;
        self.nature = nature;
        self.species = species;
        self.moves = moves;
        self.individual_values = individual_values;
        self.effort_values = effort_values;
        self.battle_stats = self.effort_values;
    }

}

struct Trainer {
    var pokemons : [Pokemon]
    let human: Bool
}

struct Environment {
    var weather : Weather
    var terrain : Terrain
}

// http://bulbapedia.bulbagarden.net/wiki/Type/Type_chart
func typeModifier(attacking: Type, defending : Type) -> Double {
    let chart: [[Double]] = [[1, 	1, 	1, 	1, 	1, 	0.5, 	1, 	0, 	0.5, 	1, 	1, 	1, 	1, 	1, 	1, 	1, 	1, 	1,],
                            [2, 	1, 	0.5, 	0.5, 	1, 	2, 	0.5, 	0, 	2, 	1, 	1, 	1, 	1, 	0.5, 	2, 	1, 	2, 	0.5,],
                            [1, 	2, 	1, 	1, 	1, 	0.5, 	2, 	1, 	0.5, 	1, 	1, 	2, 	0.5, 	1, 	1, 	1, 	1, 	1,],
                            [1, 	1, 	1, 	0.5, 	0.5, 	0.5, 	1, 	0.5, 	0, 	1, 	1, 	2, 	1, 	1, 	1, 	1, 	1, 	2,],
                            [1, 	1, 	0, 	2, 	1, 	2, 	0.5, 	1, 	2, 	2, 	1, 	0.5, 	2, 	1, 	1, 	1, 	1, 	1,],
                            [1, 	0.5, 	2, 	1, 	0.5, 	1, 	2, 	1, 	0.5, 	2, 	1, 	1, 	1, 	1, 	2, 	1, 	1, 	1,],
                            [1, 	0.5, 	0.5, 	0.5, 	1, 	1, 	1, 	0.5, 	0.5, 	0.5, 	1, 	2, 	1, 	2, 	1, 	1, 	2, 	0.5,],
                            [0, 	1, 	1, 	1, 	1, 	1, 	1, 	2, 	1, 	1, 	1, 	1, 	1, 	2, 	1, 	1, 	0.5, 	1,],
                            [1, 	1, 	1, 	1, 	1, 	2, 	1, 	1, 	0.5, 	0.5, 	0.5, 	1, 	0.5, 	1, 	2, 	1, 	1, 	2,],
                            [1, 	1, 	1, 	1, 	1, 	0.5, 	2, 	1, 	2, 	0.5, 	0.5, 	2, 	1, 	1, 	2, 	0.5, 	1, 	1,],
                            [1, 	1, 	1, 	1, 	2, 	2, 	1, 	1, 	1, 	2, 	0.5, 	0.5, 	1, 	1, 	1, 	0.5, 	1, 	1,],
                            [1, 	1, 	0.5, 	0.5, 	2, 	2, 	0.5, 	1, 	0.5, 	0.5, 	2, 	0.5, 	1, 	1, 	1, 	0.5, 	1, 	1,],
                            [1, 	1, 	2, 	1, 	0, 	1, 	1, 	1, 	1, 	1, 	2, 	0.5, 	0.5, 	1, 	1, 	0.5, 	1, 	1,],
                            [1, 	2, 	1, 	2, 	1, 	1, 	1, 	1, 	0.5, 	1, 	1, 	1, 	1, 	0.5, 	1, 	1, 	0, 	1,],
                            [1, 	1, 	2, 	1, 	2, 	1, 	1, 	1, 	0.5, 	0.5, 	0.5, 	2, 	1, 	1, 	0.5, 	2, 	1, 	1,],
                            [1, 	1, 	1, 	1, 	1, 	1, 	1, 	1, 	0.5, 	1, 	1, 	1, 	1, 	1, 	1, 	2, 	1, 	0,],
                            [1, 	0.5, 	1, 	1, 	1, 	1, 	1, 	2, 	1, 	1, 	1, 	1, 	1, 	2, 	1, 	1, 	0.5, 	0.5,],
                            [1, 	2, 	1, 	0.5, 	1, 	1, 	1, 	1, 	0.5, 	0.5, 	1, 	1, 	1, 	1, 	1, 	2, 	2, 	1]]

    return chart[attacking.rawValue][defending.rawValue]
}

// http://bulbapedia.bulbagarden.net/wiki/Damage
func damage(environment : Environment, pokemon: Pokemon, move: Move, target: Pokemon) -> Int {
    let pkmType = pokemon.species.type;
    let tarType = target.species.type;

    let targets: Double = 1
    let weather: Double = 1
    let badge: Double = 1
    let critical: Double = Int(random() % 256) > (pokemon.species.base_values.speed / 2) ? 1.5 : 1
    let random_value: Double = (100 - Double(random() % 16)) / 100
    let stab: Double = (move.type == pkmType.0 || move.type == pkmType.1!) ? 1.5 : 1
    let type: Double = typeModifier(attacking: move.type, defending: tarType.0) * ((tarType.1 != nil) ? typeModifier(attacking: move.type, defending: tarType.1!) : 1)
    let burn: Double = 1
    let other: Double = 1

    let modifier: Double = targets * weather * badge * critical * random_value * stab * type * burn * other

    return Int(Double(pokemon.battle_stats.attack) * modifier)
}

// has to be initialized before calling battle
struct State {
    let environment: Environment
    let trainers: [Trainer]
    let pokemon_fighting: [Int] // Indice of the fighting pokemon for the two players
    let winner: Int? // 0 = first player, 1 = second, nil = none
}

enum Action {
    case attack
    case change_pokemon
    case use_item
    // case run
}

func choose_action(trainer: Trainer) -> Action {
    return .attack
}

func select_pokemon(trainer: Trainer) -> Int? {
    var selected: Int? = nil;
    var indice: Int = 0

    for pkm in trainer.pokemons {
        if pkm.battle_stats.hitpoints > 0 {
            selected = indice;
            break;
        }
        indice += 1;
    }

    return selected
}

func battle_init(trainers: [Trainer]) -> State {
    let environment = Environment(weather: .clear_skies, terrain: .normal);
    let pkm1 = select_pokemon(trainer: trainers[0]);
    let pkm2 = select_pokemon(trainer: trainers[1]);
    var winner: Int? = nil;

    if(pkm1 == nil && pkm2 != nil) {
        winner = 1
    }

    else if(pkm1 != nil && pkm2 == nil) {
        winner = 0
    }

    return State(environment: environment, trainers: trainers, pokemon_fighting: [pkm1!, pkm2!], winner: winner)
}

// DOESN'T SEEM TO TAKE POWERPOINTS INTO ACCOUNT
func choose_move(pokemon: Pokemon) -> Move {
    var filtered_moves = [Move]();

    for (key, value) in pokemon.moves {
        if value > 0 {
            filtered_moves.append(key)
        }
    }

    return filtered_moves[random() % filtered_moves.count]
}

func choose_first(pkm1: Pokemon, pkm2: Pokemon, move1: Move?, move2: Move?) -> [Int] {
    var order: [Int];

    if(move1 == nil) {
        order = [1];
    }

    else if(move2 == nil) {
        order = [0];
    }

    else if (move1 == nil && move2 == nil)
    {
        order = [];
    }

    else if (pkm1.moves[move1!]! > pkm1.moves[move2!]!) {
        order = [0,1];
    }

    else if(pkm1.moves[move1!]! < pkm1.moves[move2!]!) {
        order = [1,0];
    }

    else {
        if(pkm1.effective_stats.speed > pkm2.effective_stats.speed) {
            order = [0,1];
        }
        else if(pkm1.effective_stats.speed < pkm2.effective_stats.speed) {
            order = [1,0];
        }
        else {
            let tmp = random() % 2;
            order = [tmp, (tmp+1)%2];
        }
    }

    return order
}

// var state: State = battle_init(trainers)
// state = battle(state)
func battle(state: State) -> State {
    if(state.winner != nil) {
        return state
    }

    var environment = state.environment;

    var p = state.trainers;
    var pkm_ind = state.pokemon_fighting;
    var pkm = [p[0].pokemons[pkm_ind[0]], p[1].pokemons[pkm_ind[1]]];
    var winner = state.winner;

    var move: [Move?] = [nil, nil];

    for i in 0...1 {
        switch choose_action(trainer: p[i]) {
            case .attack:
                move[i] = choose_move(pokemon: pkm[i]);
            case .change_pokemon:
                let new_indice = select_pokemon(trainer: p[i]);
                pkm_ind[i] = new_indice!;
                pkm[i] = p[i].pokemons[pkm_ind[i]];
            case .use_item:
              print("lol");
        }
    }

    let order = choose_first(pkm1: pkm[0], pkm2: pkm[1], move1: move[0], move2: move[1]);

    for ind in order {
        // Damage
        if(random() % 100 < move[ind]!.accuracy) {
            let dmg = damage(environment: environment, pokemon: pkm[ind], move: move[ind]!, target: pkm[(ind+1)%2]);
            pkm[(ind+1)%2].battle_stats.hitpoints -= dmg;
            if(pkm[(ind+1)%2].battle_stats.hitpoints < 0) {pkm[(ind+1)%2].battle_stats.hitpoints = 0};
            pkm[ind].moves[move[ind]!]! -= 1;
            p[(ind+1)%2].pokemons[pkm_ind[(ind+1)%2]].battle_stats = pkm[(ind+1)%2].battle_stats;
            print("Pokemon ", ind, " attacks pokemon ", (ind+1)%2, " with ", move[ind]!.name, " (", dmg, " damage!)");

        }

        else {
            print("Pokemon ", ind, " attacks pokemon ", (ind+1)%2, " with ", move[ind]!.name, " but... misses");
            pkm[ind].moves[move[ind]!]! -= 1;
        }

        // Check if other pokemon is dead
        if(pkm[(ind+1)%2].battle_stats.hitpoints <= 0) {
            let new_indice = select_pokemon(trainer: p[(ind+1)%2]);
            if(new_indice == nil) {
                winner = (ind+1)%2;
                break;
            }
            print("New pokemon for player ", ind)
            pkm_ind[(ind+1)%2] = new_indice!;
            pkm[(ind+1)%2] = p[ind].pokemons[pkm_ind[(ind+1)%2]];
        }
    }

    print("HP pkm 0 : ", p[0].pokemons[pkm_ind[0]].battle_stats.hitpoints);
    print("HP pkm 1 : ", p[1].pokemons[pkm_ind[1]].battle_stats.hitpoints);

    // new turn

    return battle(state: State( environment: environment, trainers: p,
                                pokemon_fighting: pkm_ind, winner: winner))
}
