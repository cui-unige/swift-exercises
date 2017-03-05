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
    var powerpoints : Int
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

// Credits: Killian Ruchti
let fire_blast  = Move(id: 1, name: "Fire Blast",  description: "A fiery blast that scorches all. May cause a burn.",      category: Category.special,  type: Type.fire,   power: 110, accuracy: 85,  powerpoints: 5,  priority: 0)

let solar_beam  = Move(id: 2, name: "Solar Beam",  description: "Absorbs light in one turn, then attacks next turn.",      category: Category.special,  type: Type.grass,  power: 120, accuracy: 100, powerpoints: 10, priority: 0)

let sunny_day   = Move(id: 3, name: "Sunny Day",   description: "Boosts the power of FIRE- type moves for 5 turns.",       category: Category.status,   type: Type.fire,   power: 0,   accuracy: 0,   powerpoints: 5,  priority: 0)

let return_rest = Move(id: 4, name: "Return/Rest", description: "Power increases with happiness, up to a maximum of 102.", category: Category.physical, type: Type.normal, power: 0,   accuracy: 100, powerpoints: 20, priority: 0)


// Credits: Amirhossein
let warp = Move(id: 01,name : "Warp",description: "traps the target over two or three turns",category : Category.physical,type: Type.normal,power: 15,accuracy: 90,
                powerpoints: 20,priority: 0)

let acid = Move(id: 02,name: "Acid",description: "has one  in three chance to lower targer defense", category: Category.special,type: Type.poison,power: 40,accuracy: 100,
                powerpoints: 30,priority: 1)




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
    func getStat(_ statName: String) -> Int {
        switch statName {
        case "hitpoints":
            return self.hitpoints
        case "attack":
            return self.attack
        case "defense":
            return self.defense
        case "special_attack":
            return self.special_attack
        case "special_defense":
            return self.special_defense
        case "speed":
            return self.speed
        default:
            return 0
        }
    }
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

//Credits: Killian Ruchti
let entei_stats = Stats(hitpoints: 115, attack: 115, defense: 85, special_attack: 90, special_defense: 75, speed: 100)
let entei = Species(id: 244, name: "Entei", evolutions: [], attacks: [fire_blast, solar_beam, sunny_day, return_rest], type: (Type.fire, nil), base_values: entei_stats)


//Credits: Amirhossein
let ekans_stat = Stats(
    hitpoints: 35,attack: 60,defense: 44,special_attack: 40,special_defense: 54,speed: 55)
let ekans = Species(id: 023 ,name: "Ekans", evolutions: [],attacks: [warp,acid], type: (Type.poison,Type.dark), base_values: ekans_stat)



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



func computeStat(_ pokemon: Pokemon,stat_name stat: String) -> Int {
 let nature = 1
 return Int((Int(((2*pokemon.species.base_values.getStat(stat) + pokemon.individual_values.getStat(stat) + Int(pokemon.effort_values.getStat(stat)/4)) * pokemon.level)/100) + 5) * nature)
}


struct Pokemon {
    let nickname          : String?
    var hitpoints         : Int? = nil// remaining hitpoints, nil at initialization
    let size              : Int
    let weight            : Int
    let experience        : Int
    let level             : Int = 1
    let nature            : Nature
    let species           : Species
    let moves             : [Move: Int]// Move -> remaining powerpoints
    let individual_values : Stats
    let effort_values     : Stats
    var effective_stats: Stats {
        get {
            
            let stats = Stats(
                hitpoints: computeHp(self),
                attack: computeStat(self, stat_name: "attack"),
                defense: computeStat(self, stat_name: "defense"),
                special_attack: computeStat(self,stat_name: "special_attack"),
                special_defense: computeStat(self, stat_name: "special_defense"),
                speed: computeStat(self, stat_name: "speed")
            )
            
            return stats
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
    
    let first_ind: Int = types_array.index(of: attacking)!
    let second_ind: Int = types_array.index(of: defending)!
    
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
    var stage: Int
    var pokemon_player_in: Pokemon
    var pokemons_player_out: [Pokemon]
    var pokemon_computer_in: Pokemon
    var pokemons_computer_out: [Pokemon]
    var weather: Weather
    let terrain: Terrain
    var user_action: Any? // TODO: create a structure to store user's and computer's action
    var computer_action: Any?
}

// Number of attempts to running away from user
var nbr_run_tries_user: Int = 0
// Number of attempts to running away from computer
var nbr_run_tries_computer: Int = 0

// Run away choice simulation
func canRun(active_pokemon: Pokemon, opposing_pokemon: Pokemon, is_user: Bool) -> Bool {
    
    // Increment number of tries of running
    if is_user {
        nbr_run_tries_user += 1
    } else {
        nbr_run_tries_computer += 1
    }
    
    
    
    
    // Compute the different parameters of the formula
    let A: UInt32 = UInt32(active_pokemon.effective_stats.speed)
    let B: UInt32 = UInt32(opposing_pokemon.effective_stats.speed)
    let C: UInt32 = is_user ? UInt32(nbr_run_tries_user) : UInt32(nbr_run_tries_computer)
    
    // Compute the formula
    let F: UInt32 = ((A*128)/B + 30*C) % 256
    
    // if the random number between 0 and 255 is less than F, player escapes. If not, player fails to escape
    return arc4random_uniform(256) < F ? true : false
}



// Defines the possible actions during a battle (for now, they're just strings)
struct Action {
    let name: String
    let description: String
    func isAction(name: String) -> Bool {
        return self.name == name ? true : false
    }
}



// Simulate the user's input
func getAction(_ state: State) -> Action {
    // Possible actions
    var actions: [Action]
        = [Action(name: "item", description: "Use an item"),
           Action(name: "run", description: "Run away like a coward")]
    
    // "att" move is only available if there is at least one attack with pp > 0 remaining
    for (_, powerpoints) in state.pokemon_player_in.moves {
        if powerpoints > 0 {
            // Make attack available
            actions.append(Action(name: "att", description: "Attack"))
            break
        }
    }

    

    
    // Get user's input
    var chosen_action: Action? = nil
    repeat {
        print("\n Select one of the following actions (by writing the text within the parenthesis): \n")
        for action in actions {
            print("- "+action.description+" ("+action.name+")")
        }
        
        let action_name = readLine()
        chosen_action = actions.first { $0.name == action_name }
    } while chosen_action == nil
    
    return chosen_action!
    
}


// Ask which attack the player wants (or take it randomly if it's computer's turn)
func getAttack(is_user: Bool, attacker: Pokemon) -> Move {

    if is_user {
        // Ask user for an attack
        var chosen_attack: Move? = nil
        
        repeat {
            print("\n Select one of the following attack (by writing its full name). \n")
            for (move, powerpoints) in attacker.moves {
                // Player can only choose a move that has more than 0 pp
                if (powerpoints > 0) {
                    print("- "+move.name)
                }
            }
            
            let attack_name = readLine()
            
            for (move, _) in attacker.moves {
                if (move.name == attack_name) && (move.powerpoints > 0) {
                    chosen_attack = move
                    break
                }
            }
        } while chosen_attack == nil
        
        return chosen_attack!
        
    } else {
        // Take a random attack
        let intIndex: Int = Int(arc4random_uniform(UInt32(attacker.moves.count)))
        return Array(attacker.moves.keys)[intIndex]
    }
}


// Manages player's turn and return an action
func playerTurn(state: inout State) -> () {
    let user_action: Action = getAction(state)
    
    // Handle cases
    switch user_action.name {
    case "att":
        let user_attack: Move = getAttack(is_user: true, attacker: state.pokemon_player_in)
        state.user_action = user_attack
    case "item":
        //TODO: manage items
        print("Your bag is currently empty")
    case "run":
        if canRun(active_pokemon: state.pokemon_player_in, opposing_pokemon: state.pokemon_computer_in, is_user: true) {
            print("Your pokemon manages to escape. The battle ends.\n")
            exit(0)
        } else {
            print("Your pokemon is not fast enough to escape. The battle goes on.\n")
        }
    default:
        print("Error with user action.")
        exit(1)
    }
    
}


// Manages computer's turn and returns an action
func computerTurn(state: inout State) -> () {
    
}

func battle(trainers: inout [Trainer], state: inout State) -> () {
    // TODO: simulate battle
    /*
     A battle has the following progress:
     1) Player selects an action (move, item, run, switch pokemon, etc)
     2) Computer selects an action (||) TODO
     3) By order of priorities, actions are resolved TODO
     4) Battle state is updated TODO
     5) If pokemons_player_in or pokemons_computer_in is empty, player or computer can
     respectively select a pokemon from pokemons_player_out and pokemons_computer_out
     If both pokemons_player_in and pokemons_player_out are empty, player loses
     If both pokemons_computer_in and pokemons_computer_out are empty, computer loses TODO
     6) If no one lost, back to 1) TODO
     
     // Last requirement: the initial state
     let initialState = State(
     stage: 1,
     pokemon_player_in: player.pokemons[0],
     pokemons_player_out: [player.pokemons[1], player.pokemons[2]],
     pokemon_computer_in: computer.pokemons[0],
     pokemons_computer_out: [computer.pokemons[1]],
     weather: randomWeather(),
     terrain: randomTerrain()
     )
     */
    while(true) {
        playerTurn(state: &state)
        computerTurn(state: &state)
    }
    
}




// Function returning a species attacks along with powerpoints
func getMovesWithPowerPoints(pokemon_species: Species) -> [Move: Int] {
    var attacks_with_pp: [Move: Int] = [:]
    for attack in pokemon_species.attacks {
        attacks_with_pp.updateValue(attack.powerpoints, forKey: attack)
    }
    return attacks_with_pp
}


// Random 
func randStatVal() -> Int {
    return Int(arc4random_uniform(20))
}

// Function returning a random IV (based on species stats)
func getIv(pokemon_species: Species) -> Stats {
    return Stats(
        hitpoints: pokemon_species.base_values.hitpoints + randStatVal(),
        attack: pokemon_species.base_values.attack + randStatVal(),
        defense: pokemon_species.base_values.defense + randStatVal(),
        special_attack: pokemon_species.base_values.special_attack + randStatVal(),
        special_defense: pokemon_species.base_values.special_defense + randStatVal(),
        speed: pokemon_species.base_values.speed + randStatVal()
    )
}


// Function returning the EV of a pokemon
func getEv(pokemon_species: Species) -> Stats {
    // TODO: increase effort values throughout battles
    return pokemon_species.base_values
}


func randomWeather() -> Weather {
    // Returns random weather
    let weathers: [Weather] = [Weather.clear_skies, Weather.harsh_sunlight(extremely: true), Weather.harsh_sunlight(extremely: false), Weather.rain(heavy: true), Weather.rain(heavy: false),
                               Weather.sandstorm, Weather.hail(diamond_dust: false), Weather.hail(diamond_dust: true), Weather.shadowy_aura, Weather.fog, Weather.mysterious_air_current]
    return weathers[Int(arc4random_uniform(UInt32(weathers.count)))]
}

func randomTerrain() -> Terrain {
    // Returns a random Terrain
    let terrains: [Terrain] = [Terrain.normal, Terrain.electric, Terrain.grassy, Terrain.psychic, Terrain.misty]
    return terrains[Int(arc4random_uniform(UInt32(terrains.count)))]
}

func initialize() {
    
    // Few pokemons creation (User)
    var squirtle1 = Pokemon(
        nickname: "Tiny squirtle",
        hitpoints: nil,
        size: 1,
        weight: 10,
        experience: 0,
        nature: Nature.lonely,
        species: squirtle,
        moves: getMovesWithPowerPoints(pokemon_species: squirtle),
        individual_values: getIv(pokemon_species: squirtle),
        effort_values: getEv(pokemon_species: squirtle)
    )
    
    
    var wartortle1 = Pokemon(
        nickname: "The Machiiine",
        hitpoints: nil,
        size: 3,
        weight: 50,
        experience: 0,
        nature: Nature.rash,
        species: wartortle,
        moves: getMovesWithPowerPoints(pokemon_species: wartortle),
        individual_values: getIv(pokemon_species: wartortle),
        effort_values: getEv(pokemon_species: wartortle)
    )
    
    
    var blastoise1 = Pokemon(
        nickname: "Blastoise junior junior",
        hitpoints: nil,
        size: 6,
        weight: 200,
        experience: 0,
        nature: Nature.naughty,
        species: blastoise,
        moves: getMovesWithPowerPoints(pokemon_species: blastoise),
        individual_values: getIv(pokemon_species: blastoise),
        effort_values: getEv(pokemon_species: blastoise)
    )
    
    
    
    
    // Few pokemons creation (Computer)
    var entei1 = Pokemon(
        nickname: "Kilian",
        hitpoints: nil,
        size:5,
        weight: 200,
        experience: 0,
        nature: Nature.hardy,
        species: entei,
        moves: getMovesWithPowerPoints(pokemon_species: entei),
        individual_values: getIv(pokemon_species: entei),
        effort_values: getEv(pokemon_species: entei)
    )
    
    var ekans1 = Pokemon(
        nickname: "Amir",
        hitpoints: nil,
        size: 2,
        weight: 67,
        experience: 0,
        nature: Nature.docile,
        species: ekans,
        moves: getMovesWithPowerPoints(pokemon_species: ekans),
        individual_values: getIv(pokemon_species: ekans),
        effort_values: getEv(pokemon_species: ekans)
    )
    
    // Assign pokemons to trainers 
    var player = Trainer(pokemons: [wartortle1, entei1, blastoise1])
    var computer = Trainer(pokemons: [squirtle1, ekans1])
    
    var trainers: [Trainer] = [player, computer]
    
    
    // Init hitpoints
    for i in 0...trainers.count-1 {
        for l in 0...trainers[i].pokemons.count-1 {
            trainers[i].pokemons[l].hitpoints = trainers[i].pokemons[l].effective_stats.hitpoints
        }
    }
    
    
    // Last requirement: the initial state 
    var initialState = State(
        stage: 1,
        pokemon_player_in: player.pokemons[0],
        pokemons_player_out: [player.pokemons[1], player.pokemons[2]],
        pokemon_computer_in: computer.pokemons[0],
        pokemons_computer_out: [computer.pokemons[1]],
        weather: randomWeather(),
        terrain: randomTerrain(),
        user_action: nil,
        computer_action: nil
    )

    
    
    // Start battle
    battle(trainers: &trainers, state: &initialState)

}
