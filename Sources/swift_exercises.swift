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
    var moves             : [Move: Int]// Move -> remaining powerpoints
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

struct Environment {
    let weather : Weather
    let terrain : Terrain
}

//zedhzedh
func typeModifier(attacking: Type, defending : Type) -> Float {
    /*
     2d array with order normal, fighting, flying, poison, ground, rock, bug, ghost, steel, fire,
     water, grass, electric, psychic, ice, dragon, dark, fairy
     Give the multiplier coefficient for each combinaison: type_type_chart[attacking][defending]
     ex:  attacking is normal and defending is flying, then multplier is type_type_chart[0][2]

     Reference: http://bulbapedia.bulbagarden.net/wiki/Type#Type_chart
     */
    let type_type_chart: [[Float]] = [[ 1, 1, 1, 1, 1, 0.5, 1, 0, 0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1],[ 2, 1, 0.5, 0.5, 1, 2, 0.5, 0, 2, 1, 1, 1, 1, 0.5, 2, 1, 2, 0.5],[ 1, 2, 1, 1, 1, 0.5, 2, 1, 0.5, 1, 1, 2, 0.5, 1, 1, 1, 1, 1],[ 1, 1, 1, 0.5, 0.5, 0.5, 1, 0.5, 0, 1, 1, 2, 1, 1, 1, 1, 1, 2],[ 1, 1, 0, 2, 1, 2, 0.5, 1, 2, 2, 1, 0.5, 2, 1, 1, 1, 1, 1],[ 1, 0.5, 2, 1, 0.5, 1, 2, 1, 0.5, 2, 1, 1, 1, 1, 2, 1, 1, 1],[ 1, 0.5, 0.5, 0.5, 1, 1, 1, 0.5, 0.5, 0.5, 1, 2, 1, 2, 1, 1, 2, 0.5],[ 0, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 0.5, 1],[ 1, 1, 1, 1, 1, 2, 1, 1, 0.5, 0.5, 0.5, 1, 0.5, 1, 2, 1, 1, 2],[ 1, 1, 1, 1, 1, 0.5, 2, 1, 2, 0.5, 0.5, 2, 1, 1, 2, 0.5, 1, 1],[ 1, 1, 1, 1, 2, 2, 1, 1, 1, 2, 0.5, 0.5, 1, 1, 1, 0.5, 1, 1],[ 1, 1, 0.5, 0.5, 2, 2, 0.5, 1, 0.5, 0.5, 2, 0.5, 1, 1, 1, 0.5, 1, 1],[ 1, 1, 2, 1, 0, 1, 1, 1, 1, 1, 2, 0.5, 0.5, 1, 1, 0.5, 1, 1],[ 1, 2, 1, 2, 1, 1, 1, 1, 0.5, 1, 1, 1, 1, 0.5, 1, 1, 0, 1],[ 1, 1, 2, 1, 2, 1, 1, 1, 0.5, 0.5, 0.5, 2, 1, 1, 0.5, 2, 1, 1],[ 1, 1, 1, 1, 1, 1, 1, 1, 0.5, 1, 1, 1, 1, 1, 1, 2, 1, 0],[ 1, 0.5, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 0.5, 0.5],[ 1, 2, 1, 0.5, 1, 1, 1, 1, 0.5, 0.5, 1, 1, 1, 1, 1, 2, 2, 1]]

    // Types array
    let types_array: [Type] = [Type.normal, Type.fighting, Type.flying, Type.poison, Type.ground, Type.rock, Type.bug, Type.ghost, Type.steel, Type.fire, Type.water, Type.grass, Type.electric, Type.psychic, Type.ice, Type.dragon, Type.dark, Type.fairy]

    let first_ind: Int = types_array.index(where: {$0 == attacking})!
    let second_ind: Int = types_array.index(where: {$0 == defending})!

    return type_type_chart[first_ind][second_ind] //TODO bug here
}

// http://bulbapedia.bulbagarden.net/wiki/Damage
// Computes the damage value
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
    if critical_multiplier == 2 {
        print("It's a critical hit !")
    }

    /*
     other counts for things like held items, Abilities,
     field advantages, and whether the battle is a Double Battle or Triple Battle or not.
     Without further information, I assume equal to 1
     TODO: other
     */
    let other = 1

    // Random coefficient between 0.85 and 1
    let random: Float = Float((arc4random_uniform(16) + 85))/100.0


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
func getAction(_ state: State, is_user: Bool) -> Action {
    // Possible actions
    var actions: [Action]
        = [Action(name: "item", description: "Use an item"),
           Action(name: "run", description: "Run away like a coward")]

    if is_user {
        /* Action for user */

        // "att" move is only available if there is at least one attack with pp > 0 remaining
        for (_, powerpoints) in state.pokemon_player_in.moves {
            if powerpoints > 0 {
                // Make attack available
                actions.append(Action(name: "att", description: "Attack"))
                break
            }
        }


        /*
         "pokemon" move allows player to switch between his pokemon in the battle and one pokemon out of the battle
         Available only if there is at least one pokemon off
        */
        if state.pokemons_player_out.count > 0 {
            actions.append(Action(name: "switch", description: "Switch your pokemon with another one"))
        }



        // Get user's input
        var chosen_action: Action? = nil
        repeat {
            print("\n Select one of the following actions (by writing the text within the parenthesis): \n")
            for action in actions {
                print("- "+action.description+" ("+action.name+")")
            }
            print("- Show battle state. You'll be able to chose another action afterwards. (info)")

            let action_name = readLine()
            if action_name == "info" {
                // displays infos
                displayState(state)
            }
            chosen_action = actions.first(where: { $0.name == action_name })
            
        } while chosen_action == nil

        return chosen_action!

    } else {
        /* Action for computer */
        for (_, powerpoints) in state.pokemon_computer_in.moves {
            if powerpoints > 0 {
                actions.append(Action(name: "att", description: "Attack"))
            }
        }

        if state.pokemons_computer_out.count > 0 {
            actions.append(Action(name: "switch", description: "Switch your pokemon with another one"))
        }


        // TODO : Choose a heuristic to decide which action the computer should do
        /*
            For now, choice relies entirely on a method using randomness
            P(attack) = 90/100 (from 0 to 89)
            P(item) = 5/100 (from 90 to 94)
            P(switch Pokemon) = 4/100 (from 95 to 98)
            P(run) = 1/100 (99)
        */
        var computer_action_chosen: Action? = nil
        
        repeat {
            
            let choice: UInt32 = arc4random_uniform(100)
            
            switch choice {
            case 0...89:
                computer_action_chosen = actions.first(where: { $0.name == "att"})
            case 90...94:
                computer_action_chosen = actions.first(where: { $0.name == "item"})
            case 95...98:
                computer_action_chosen = actions.first(where: { $0.name == "switch"})
            case 99:
                computer_action_chosen = actions.first(where: { $0.name == "run"})
            default:
                computer_action_chosen = actions.first(where: { $0.name == "att"})
            }
            
        } while computer_action_chosen == nil
        

        return computer_action_chosen!
    }



}


// Ask which attack the player wants (or take it randomly if it's computer's turn)
func getAttack(is_user: Bool, attacker: Pokemon, pokemon_moves: inout [Move : Int]) -> Move {

    if is_user {
        // Ask user for an attack
        var chosen_attack: Move? = nil
        
        
        repeat {
            print("\n Select one of the following attack (by writing its full name). \n")
            for (move, powerpoints) in attacker.moves {
                // Player can only choose a move that has more than 0 pp
                if (powerpoints > 0) {
                    print("- "+move.name+" ("+String(describing: pokemon_moves[move]!)+" pp)")
                }
            }

            let attack_name = readLine()

            
            for (move, _) in attacker.moves {
                if (move.name == attack_name) && (pokemon_moves[move]! > 0) {
                    chosen_attack = move
                    break
                }
            }
        } while chosen_attack == nil

        pokemon_moves[chosen_attack!]! -= 1 // decreases powerpoints of user's move by 1
        return chosen_attack!

    } else {
        // Take a random attack
        let intIndex: Int = Int(arc4random_uniform(UInt32(attacker.moves.count)))
        let chosen_attack: Move = Array(attacker.moves.keys)[intIndex]
        pokemon_moves[chosen_attack]! -= 1 //decreases powerpoints of computer's move by 1
        return chosen_attack
    }
    
}

// Returns an off pokemon to switch with the current active pokemon
func getPokemonOff(_ state: State, is_user: Bool) -> Pokemon {
    if is_user {

        var chosen_pokemon: Pokemon? = nil

        repeat {
            // User
            print("\n Select of the following pokemons (by writing its full name or nickname): \n")
            for pokemon in state.pokemons_player_out {
                if pokemon.nickname == nil {
                    print("- "+pokemon.species.name)
                } else {
                    print("- "+pokemon.nickname!)
                }
            }

            let user_choice = readLine()
            // Check if pokemon exists
            chosen_pokemon = state.pokemons_player_out.first(where: { $0.nickname == user_choice || $0.species.name == user_choice })

        } while chosen_pokemon == nil

        return chosen_pokemon!

    } else {
        // Computer switch with a random (? TODO  propose a heuristic) pokemon
        let nbrPokemon: UInt32 = UInt32(state.pokemons_player_out.count)
        return state.pokemons_player_out[Int(arc4random_uniform(nbrPokemon))]
    }
}


// Manages player's turn and return an action
func playerTurn(state: inout State) -> () {
    let user_action: Action = getAction(state, is_user: true)

    // Handle cases
    switch user_action.name {
    case "att":
        let user_attack: Move = getAttack(is_user: true, attacker: state.pokemon_player_in, pokemon_moves: &state.pokemon_player_in.moves)
        state.user_action = user_attack
    case "item":
        //TODO: manage items for user
        print("Your bag is currently empty")
    case "run":
        if canRun(active_pokemon: state.pokemon_player_in, opposing_pokemon: state.pokemon_computer_in, is_user: true) {
            print("Your pokemon manages to escape. The battle ends.\n")
            exit(0)
        } else {
            print("Your pokemon is not fast enough to escape. The battle goes on.\n")
        }
    case "switch":
        switchPokemon(off_pokemon: &state.pokemons_player_out[getPokemonChoice(state: state, is_user: true)], in_pokemon: &state.pokemon_player_in)
        let end_text: String = " comes in to fight by your side"
        state.pokemon_player_in.nickname == nil ? print(state.pokemon_player_in.nickname!+end_text) : print(state.pokemon_player_in.species.name+end_text)
    default:
        print("Error with user's action.")
    }

}


// Manages computer's turn and returns an action
func computerTurn(state: inout State) -> () {
    let computer_action: Action = getAction(state, is_user: false)

    // Handle cases
    switch computer_action.name {
    case "att":
        let computer_attack: Move = getAttack(is_user: false, attacker: state.pokemon_computer_in, pokemon_moves: &state.pokemon_computer_in.moves)
        state.computer_action = computer_attack
    case "item":
        //TODO: manage items for computer
        print("The opponent tries to reach an item in his bag, but his bag turns out to be empty.")
    case "run":
        if canRun(active_pokemon: state.pokemon_computer_in, opposing_pokemon: state.pokemon_player_in, is_user: false) {
            print("The opponent runs away as you yell names at him.")
            exit(0)
        } else {
            print("The opponent tries to run away but you slap him in the face and force him to keep fighting you.")
        }
    case "switch":
        switchPokemon(off_pokemon: &state.pokemons_computer_out[getPokemonChoice(state: state, is_user: false)], in_pokemon: &state.pokemon_computer_in)
        let sub1: String = "Computer sends "
        let sub2: String = " in"
        state.pokemon_computer_in.nickname == nil ? print(sub1+state.pokemon_computer_in.nickname!+sub2) : print(sub1+state.pokemon_computer_in.species.name+sub2)
    default:
        print("Error with computer's action")
    }
}


// Simulates a move
func makeMove(attacker: Pokemon, defender: Pokemon, move: Move, state: inout State, is_user_move: Bool) -> () {
    let damage_inflicted: Int = damage(environment: Environment(weather: state.weather, terrain: state.terrain), pokemon: attacker, move: move, target: defender)

    if damage_inflicted > 0 {
        if is_user_move {
            state.pokemon_computer_in.hitpoints! -= damage_inflicted
            print("Opponent loses "+String(damage_inflicted)+" hitpoints")
        } else {
            state.pokemon_player_in.hitpoints! -= damage_inflicted
            print("Your pokemon loses "+String(damage_inflicted)+" hitpoints")
        }
    } else {
        print("Damage inflicted: "+String(damage_inflicted))
    }
}

func computerMove(move: Move, state: inout State) {
    print("Opponent uses "+move.name)
    print(move.description)
    makeMove(attacker: state.pokemon_computer_in, defender: state.pokemon_player_in, move: move, state: &state, is_user_move: false)
}

func userMove(move: Move, state: inout State) {
    print("Your pokemon uses "+move.name)
    print(move.description)
    makeMove(attacker: state.pokemon_player_in, defender: state.pokemon_computer_in, move: move, state: &state, is_user_move: true)
}

// Resolves actions by priorities
func resolveActions(state: inout State) -> () {
    let user_action = state.user_action
    let computer_action = state.computer_action

    // TODO: resolve moves
    
    /*
     IMPORTANT NOTE:
     only Moves are not already resolved at this points, so the only cases to handle are:
     Move && Move
     Move && something else (
    */
    
    // If there are only moves, we can resolve action by speed
    if (user_action is Move) && (computer_action is Move) {
        // We know we're dealing with moves so we create new move constants
        let user_move: Move = user_action as! Move
        let computer_move: Move = computer_action as! Move

        // Resolve by order of speedness
        if  state.pokemon_computer_in.effective_stats.speed >= state.pokemon_computer_in.effective_stats.speed {
            // User attacks first
            userMove(move: user_move, state: &state)
            // Then computer
            computerMove(move: computer_move, state: &state)
        } else {
            // Computer attacks first
            computerMove(move: computer_move, state: &state)
            // Then user
            userMove(move: user_move, state: &state)
        }
        return
    }
    


}


// Displays informations about a pokemon
func displayPokemonInfos(_ pokemon: Pokemon, is_in: Bool) -> () {
    let nickname: String? = pokemon.nickname
    let name: String = pokemon.species.name
    let hitpoints: String = String(describing: pokemon.hitpoints!)
    let attack: String = String(describing: pokemon.effective_stats.attack)
    let defense: String = String(describing: pokemon.effective_stats.defense)
    let special_attack: String = String(describing: pokemon.effective_stats.special_attack)
    let special_defense: String = String(describing: pokemon.effective_stats.special_defense)
    let speed: String = String(describing: pokemon.effective_stats.speed)

    var status: String?
    if is_in {
        status = "active"
    } else {
        status = "not active"
    }

    // Separation in sub expressions
    var sub1: String?
    if nickname == nil {
        sub1 = "Name: "+name
    } else {
        sub1 = "Nickname: "+nickname!+" - Name: "+name
    }
    let sub2: String = " - Remaining hp: "+hitpoints+" - Status: "+status!

    print(sub1!+sub2)
    print("Stats: attack = "+attack+", defense = "+defense+", special attack = "+special_attack+", special defense = "+special_defense+", speed = "+speed)
}


// State displaying
func displayState(_ state: State) -> () {
    print("### User ###")
    print("Pokemons not dazed:\n")
    displayPokemonInfos(state.pokemon_player_in, is_in: true)
    for pokemon in state.pokemons_player_out {
        print("\n")
        displayPokemonInfos(pokemon, is_in: false)
    }
    print("\n")

    print("### Opponent ###")
    print("Pokemons not dazed:\n")
    displayPokemonInfos(state.pokemon_computer_in, is_in: true)
    for pokemon in state.pokemons_computer_out {
        print("\n")
        displayPokemonInfos(pokemon, is_in: false)
    }
    print("\n")

}


// Allows user or computer to call an off pokemon in (when the pokemon in is dazed)
func callPokemon(off_pokemon_index: Int, in_pokemon: inout Pokemon, off_pokemons: inout [Pokemon]) -> () {
    // Creates a copy of the future active pokemon (in)
    let new_in_pokemon: Pokemon = off_pokemons[off_pokemon_index]
    // Overrides active pokemon (who's dazed)
    in_pokemon = new_in_pokemon
    // Suppress previously off pokemon
    off_pokemons.remove(at: off_pokemon_index)
}

// Allows user or computer to switch from a pokemon in to an off computer
func switchPokemon(off_pokemon: inout Pokemon, in_pokemon: inout Pokemon) -> () {
    // Creates copies of both pokemons
    let new_off_pokemon: Pokemon = in_pokemon
    let new_in_pokemon: Pokemon = off_pokemon
    // Switch pokemons
    off_pokemon = new_off_pokemon
    in_pokemon = new_in_pokemon
}

// User/Computer pokemon choice, returns the index of the chosen pokemon
func getPokemonChoice(state: State, is_user: Bool) -> Int {
    if is_user {
        // Asks for user's choice concerning the pokemon to call in
        var pokemon_chosen_index: Int? = nil
        repeat {
            print("Call a pokemon in by typing its full name:")
            for pokemon in state.pokemons_player_out {
                if pokemon.nickname == nil {
                    print("- "+pokemon.species.name)
                } else {
                    print("- "+pokemon.nickname!)
                }
            }

            let chosen_pokemon: String? = readLine()
            // Determines if pokemon is off and exists
            if chosen_pokemon != nil {
                var i: Int = 0
                for pokemon in state.pokemons_player_out {
                    if (pokemon.nickname == chosen_pokemon) || (pokemon.species.name == chosen_pokemon) {
                        pokemon_chosen_index = i
                        break
                    }
                    i += 1
                }
            }


        } while pokemon_chosen_index == nil

        return pokemon_chosen_index!
    } else {
        // Random choice
        return Int(arc4random_uniform(UInt32(state.pokemons_computer_out.count)))
    }
}

// Checks for dazed pokemons (hp <= 0) and eventual looser (all pokemons dazed)
func resolvePokemons(state: inout State) -> () {

    var pokemon_name: String?

    if state.pokemon_player_in.hitpoints! <= 0 {
        // allow user to call another pokemon
        print("Your pokemon is dazed.")
        if !state.pokemons_player_out.isEmpty {
            callPokemon(off_pokemon_index: getPokemonChoice(state: state, is_user: true), in_pokemon: &state.pokemon_player_in, off_pokemons: &state.pokemons_player_out)
            var pokemon_name: String?
            if state.pokemon_player_in.nickname != nil {
                pokemon_name = state.pokemon_player_in.nickname
            } else {
                pokemon_name = state.pokemon_player_in.species.name
            }
            print(pokemon_name!+" comes in to fight by your side.")
        } else {
            print("\n All your pokemons are dazed. You lose the battle.")
            exit(0)
        }
    }

    if state.pokemon_computer_in.hitpoints! <= 0 {
        // call another pokemon if there is (computer)
        print("Computer's pokemon is dazed.")
        if !state.pokemons_computer_out.isEmpty {
            callPokemon(off_pokemon_index: getPokemonChoice(state: state, is_user: false), in_pokemon: &state.pokemon_computer_in, off_pokemons: &state.pokemons_computer_out)

            if state.pokemon_computer_in.nickname != nil {
                pokemon_name = state.pokemon_computer_in.nickname
            } else {
                pokemon_name = state.pokemon_computer_in.species.name
            }
            print("Computer sends "+pokemon_name!+" in.")
        } else {
            print("\n All the computer's pokemons are dazed. You win the battle.")
            exit(0)
        }

    }
}



func battle(state: inout State) -> () {
    // TODO: simulate battle
    /*
     A battle has the following progress:
     1) Player selects an action (move, item, run, switch pokemon, etc)
     2) Computer selects an action (||)
     3) By order of priorities, actions are resolved TODO
     4) If pokemons_player_in or pokemons_computer_in is empty, player or computer can
     respectively select a pokemon from pokemons_player_out and pokemons_computer_out
     If both pokemons_player_in and pokemons_player_out are empty, player loses
     If both pokemons_computer_in and pokemons_computer_out are empty, computer loses TODO
     5) If no one lost, back to 1) TODO

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
    var round: Int = 1

    while(true) {
        print("### Round "+String(round)+" ###\n")
        // Player gets to choose an action
        playerTurn(state: &state)
        // Computer randomly chooses an action
        computerTurn(state: &state)
        // Actions are resolved by order of priorities
        resolveActions(state: &state)
        // Dazed pokemons are destroyed and replaced by off ones optionally
        resolvePokemons(state: &state)
        print("\n### Round "+String(round)+" over ###\n")
        round += 1
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


struct Trainer {
    var pokemons : [Pokemon]
}


func initialize() {
    
    print("Welcome in Pokemon battle !\n")
    
    /**  
     
     Some moves/attacks definition 
     
     **/
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
        description: "User's pokemon attacks by swinging its tail as if it were a vicious wave in a raging storm.",
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
    
    // Credits: Aslam
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
    
    /**
    
        end moves creation
 
    **/

    
    
    
    
    /**
 
        Species definitions
    
    **/
    
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
    
    
    //Credits: Aslam
    let raichuStats = Stats(hitpoints: 60, attack: 90, defense: 55, special_attack: 90,special_defense: 80, speed: 110)
    let raichu = Species(id: 026,
                         name: "Raichu",
                         evolutions: [],
                         attacks: [thunderShockAttack],
                         type: (.electric, nil),
                         base_values: raichuStats
    )
    
    let pikachuStats = Stats(hitpoints: 35, attack: 55, defense: 30, special_attack: 50,special_defense: 40, speed: 90)
    let pikachu = Species(id: 025,
                          name: "Pikachu",
                          evolutions: [raichu],
                          attacks: [thunderShockAttack, quickattack],
                          type: (.electric, nil),
                          base_values: pikachuStats
    )
    
    let species: [Species] = [blastoise, wartortle, squirtle, entei, ekans, raichu, pikachu]
    
    /**
     
     Species definition ending
     
     **/
    
    
    
    /**
 
     Pokemons creation
 
    **/
    
    
    // We create trainers to store the pokemons
    var player = Trainer(pokemons: [])
    var computer = Trainer(pokemons: [])
    
    // let players create pokemons (based on available species) and add them to his team
    var user_done: Bool = false // true when user is done chosing pokemons
    repeat {
        
        print("Select a pokemon by typing its number:")
        var i: Int = 0
        for unique_species in species {
            i += 1
            print(String(describing:i)+". "+unique_species.name)
            print("Base stats: Attack: "+String(describing: unique_species.base_values.attack)+" Defense: "+String(describing: unique_species.base_values.defense)+" Hitpoints: "+String(describing: unique_species.base_values.hitpoints)+" Speed: "+String(describing: unique_species.base_values.speed)+" Special attack: "+String(describing: unique_species.base_values.special_attack)+" Special defense: "+String(describing: unique_species.base_values.special_defense))
            
        }
        
        var choice: String? = nil
        while (choice == nil) {
            choice = readLine()
            if choice != nil {
                if Int(choice!) != nil {
                    if (Int(choice!)! > 0) && (Int(choice!)! <= i) {
                        break //if we managed to get an integer value from the user's input that is between 1 and i, the program goes on on his execution
                    }
                }
            }
            choice = nil
        }
        var chosen_species: Species = species[Int(choice!)!-1]
        
        // Get infos on the pokemon
        print("We need some informations about your pokemon.")
        print("Nickname?")
        let nickname: String = readLine()!
        
        // For size and weight, we user unsigned integers to strictly accept positive values
        print("Size in meters? (1 by default)")
        var size: UInt32? = UInt32(readLine()!)
        if size == nil {
            size = 1
        }
        print("Weight in kilos? (10 by default)")
        var weight: UInt32? = UInt32(readLine()!)
        if weight == nil {
            weight = 10
        }
        
        // Add up pokemon to the player's pokemons list
        player.pokemons.append(Pokemon(
            nickname: nickname,
            hitpoints: nil,
            size: Int(size!),
            weight: Int(weight!),
            experience: 0,
            nature: Nature.lonely, //TODO: ask user for nature or generate random one
            species: chosen_species,
            moves: getMovesWithPowerPoints(pokemon_species: chosen_species),
            individual_values: getIv(pokemon_species: chosen_species),
            effort_values: getEv(pokemon_species: chosen_species)
        ))
        
        // chosen_species for computer
        chosen_species = species[Int(arc4random_uniform(UInt32(i)))]
        // Add up a random pokemon to the computer's pokemons list
        computer.pokemons.append(Pokemon(
            nickname: nil, // TODO: add random nickname
            hitpoints: nil,
            size: Int(arc4random_uniform(8)),
            weight: Int(arc4random_uniform(300)),
            experience: 0,
            nature: Nature.brave, //TODO: generate random nature
            species: chosen_species,
            moves: getMovesWithPowerPoints(pokemon_species: chosen_species),
            individual_values: getIv(pokemon_species: chosen_species),
            effort_values: getEv(pokemon_species: chosen_species)
        ))
        
        print("\nDo you want to add one more pokemon to your team? (y/n)")
        choice = nil
        while (choice == nil) {
            choice = readLine()
            if (choice != "y") && (choice != "n") {
                choice = nil
            }
        }
        
        if choice == "n" {
            user_done = true
        }
        
        
    } while !user_done
    
    
    
    /**
 
     End pokemon creations
 
    **/

    
    


    // Init hitpoints
    for i in 0...player.pokemons.count-1 {
        player.pokemons[i].hitpoints = player.pokemons[i].effective_stats.hitpoints
    }

    for i in 0...computer.pokemons.count-1 {
        computer.pokemons[i].hitpoints = computer.pokemons[i].effective_stats.hitpoints
    }
    // Returns the first element and remove this latter from the pokemons lists
    let pokemon_player_in: Pokemon = player.pokemons.remove(at: 0)
    let pokemon_computer_in: Pokemon = computer.pokemons.remove(at: 0)
    // Last requirement: the initial state
    var initialState = State(
        stage: 1,
        pokemon_player_in: pokemon_player_in,
        pokemons_player_out: player.pokemons,
        pokemon_computer_in: pokemon_computer_in,
        pokemons_computer_out: computer.pokemons,
        weather: randomWeather(),
        terrain: randomTerrain(),
        user_action: nil,
        computer_action: nil
    )
    
    print("#### Battle starts ####\n")
    print("There is "+String(describing: initialState.weather)) //TODO: more understandable weather "announcement"
    print("The terrain is "+String(describing: initialState.terrain))
    print("\n")



    // Start battle
    battle(state: &initialState)

}
