/*
 ==============================================================================
                                Nicolas Cotte
                                    TP 1
 ==============================================================================
*/

import Foundation // Random & sqrt functions

/*
 ==============================================================================
                    Enumerations and structures declarations
 ==============================================================================
*/

// http://bulbapedia.bulbagarden.net/wiki/Type
enum Type
{
    case bug
    case dragon
    case electric
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
    case water
}

// http://bulbapedia.bulbagarden.net/wiki/Damage_category
enum Category
{
    case physical
    case special
    case status
}

enum StatusEffect
{
    case confusion
}

enum Gender
{
    case male
    case female
    case genderless
}

// http://bulbapedia.bulbagarden.net/wiki/Move
struct Move : Hashable
{
    let id          : Int
    let name        : String
    let description : String
    let category    : Category
    let type        : Type
    let effect      : StatusEffect?
    let power       : Int
    let accuracy    : Int
    let powerpoints : Int
    let priority    : Int
    var hashValue   : Int { return self.id }
}
func ==(lhs: Move, rhs: Move) -> Bool
{
    return lhs.id == rhs.id
}

// http://bulbapedia.bulbagarden.net/wiki/Statistic
struct Stats
{
    var hitpoints      : Int
    var attack         : Int
    var defense        : Int
    var specialAttack  : Int
    var specialDefense : Int
    var speed          : Int
}

struct Species : Hashable
{
    let id          : Int
    let name        : String
    let evolutions  : Set<Species>
    let attacks     : Set<Move>
    let type        : (Type, Type?)
    let baseValues  : Stats
    var hashValue   : Int { return self.id }
}
func ==(lhs: Species, rhs: Species) -> Bool
{
    return lhs.id == rhs.id
}

struct Pokemon
{
    let nickname          : String?
    var name              : String
    {
        get
        {
            if nickname == nil
            {
                return self.species.name
            }
            else
            {
                return self.nickname!
            }
        }
    }
    var hitpoints         : Int // remaining hitpoints
    let size              : Double
    let weight            : Double
    let gender            : Gender
    var experience        : Int
    var level             : Int
    let species           : Species
    var attacks           : [Move]
    var moves             : [Move: Int] // Move -> remaining powerpoints
    var effects           : [StatusEffect: Int]
    let individualValues  : Stats
    var effortValues      : Stats
    var effectiveStats    : Stats
    {
        get
        {
            return Stats(
                hitpoints: effectiveHpSet(
                    level:      level,
                    base:       species.baseValues.hitpoints,
                    individual: individualValues.hitpoints,
                    effort:     effortValues.hitpoints
                ),
                attack: effectiveStatsSet(
                    level:      level,
                    base:       species.baseValues.attack,
                    individual: individualValues.attack,
                    effort:     effortValues.attack
                ),
                defense: effectiveStatsSet(
                    level:      level,
                    base:       species.baseValues.defense,
                    individual: individualValues.defense,
                    effort:     effortValues.defense
                ),
                specialAttack: effectiveStatsSet(
                    level:      level,
                    base:       species.baseValues.specialAttack,
                    individual: individualValues.specialAttack,
                    effort:     effortValues.specialAttack
                ),
                specialDefense: effectiveStatsSet(
                    level:      level,
                    base:       species.baseValues.specialDefense,
                    individual: individualValues.specialDefense,
                    effort:     effortValues.specialDefense
                ),
                speed: effectiveStatsSet(
                    level:      level,
                    base:       species.baseValues.speed,
                    individual: individualValues.speed,
                    effort:     effortValues.speed
                )

            )
        }
    }
}

struct Item : Hashable
{
    let id          : Int
    let name        : String
    let description : String
    let effect      : (_: inout Trainer, _: Int) -> Bool
    var hashValue   : Int { return self.id }
}
func ==(lhs: Item, rhs: Item) -> Bool
{
    return lhs.id == rhs.id
}

struct Trainer
{
    let name              : String
    var pokemons          : [Pokemon]
    var currentPokemon    : Int
    var availablePokemons : Int
    {
        get
        {
            var number : Int = 0
            for pokemon in pokemons
            {
                if pokemon.hitpoints > 0
                {
                    number += 1
                }
            }
            return number
        }
    }
    var bag              : [Item: Int]
}

let dicoType: [Type: Int] =
[
    .normal:   0,
    .fighting: 1,
    .flying:   2,
    .poison:   3,
    .ground:   4,
    .rock:     5,
    .bug:      6,
    .ghost:    7,
    .fire:     8,
    .water:    9,
    .grass:    10,
    .electric: 11,
    .psychic:  12,
    .ice:      13,
    .dragon:   14
]

// http://bulbapedia.bulbagarden.net/wiki/Type/Type_chart
let arrayTypeChart: [Type: [Double]] =
[ //           nor  fig  fly  poi  gro  roc  bug  gho  fir  wat  gra  ele  psy  ice  dra
  .normal:    [1,   1,   1,   1,   1,   0.5, 1,   0,   1,   1,   1,   1,   1,   1,   1   ],
  .fighting:  [2,   1,   0.5, 0.5, 1,   2,   0.5, 0,   1,   1,   1,   1,   0.5, 2,   1   ],
  .flying:    [1,   2,   1,   1,   1,   0.5, 2,   1,   1,   1,   2,   0.5, 1,   1,   1   ],
  .poison:    [1,   1,   1,   0.5, 0.5, 0.5, 2,   0.5, 1,   1,   2,   1,   1,   1,   1   ],
  .ground:    [1,   1,   0,   2,   1,   2,   0.5, 1,   2,   1,   0.5, 2,   1,   1,   1   ],
  .rock:      [1,   0.5, 2,   1,   0.5, 1,   2,   1,   2,   1,   1,   1,   1,   2,   1   ],
  .bug:       [1,   0.5, 0.5, 2,   1,   1,   1,   0.5, 0.5, 1,   2,   1,   2,   1,   1   ],
  .ghost:     [0,   1,   1,   1,   1,   1,   1,   2,   1,   1,   1,   1,   0,   1,   1   ],
  .fire:      [1,   1,   1,   1,   1,   0.5, 2,   1,   0.5, 0.5, 2,   1,   1,   2,   0.5 ],
  .water:     [1,   1,   1,   1,   2,   2,   1,   1,   2,   0.5, 0.5, 1,   1,   1,   0.5 ],
  .grass:     [1,   1,   0.5, 0.5, 2,   2,   0.5, 1,   0.5, 2,   0.5, 1,   1,   1,   0.5 ],
  .electric:  [1,   1,   2,   1,   0,   1,   1,   1,   1,   2,   0.5, 0.5, 1,   1,   0.5 ],
  .psychic:   [1,   2,   1,   2,   1,   1,   1,   1,   1,   1,   1,   1,   0.5, 1,   1   ],
  .ice:       [1,   1,   2,   1,   2,   1,   1,   1,   1,   0.5, 2,   1,   1,   0.5, 2   ],
  .dragon:    [1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   2   ]
]

let dicoTypeFR: [Type: String] =
[
    .normal:   "Normal",
    .fighting: "Combat",
    .flying:   "Vol",
    .poison:   "Poison",
    .ground:   "Sol",
    .rock:     "Roche",
    .bug:      "Insecte",
    .ghost:    "Spectre",
    .fire:     "Feu",
    .water:    "Eau",
    .grass:    "Plante",
    .electric: "Électrik",
    .psychic:  "Psy",
    .ice:      "Glace",
    .dragon:   "Dragon"
]

let dicoGenderFR: [Gender: String] =
[
    .male:       "Mâle",
    .female:     "Femelle",
    .genderless: "Asexué"
]

let dicoCategoryFR: [Category: String] =
[
    .physical: "Physique",
    .special:  "Spécial",
    .status:   "Statut"
]



/*
 ==============================================================================
                            Functions declarations
 ==============================================================================
*/

// Functions for getting effective stats an HP of a pokemon
func effectiveHpSet(level: Int, base: Int, individual: Int, effort: Int) -> Int
{
    let calc1 : Int    = Int(floor(Double(ceil(sqrt(Double(effort)))) / 4.0))
    let calc2 : Double = Double(((base + individual) * 2 + calc1) * level)
    return Int(floor(calc2 / 100.0)) + level + 10
}

func effectiveStatsSet(level: Int, base: Int, individual: Int, effort: Int) -> Int
{
    let calc1 = Int(floor(Double(ceil(sqrt(Double(effort)))) / 4.0))
    let calc2 = Double(((base + individual) * 2 + calc1) * level)
    return Int(floor(calc2 / 100.0)) + 5
}

// Effects functions for items
func fullHeal(trainer: inout Trainer, pokemon: Int) -> Bool
{
    if trainer.pokemons[pokemon].hitpoints == trainer.pokemons[pokemon].effectiveStats.hitpoints
    {
        print("PV déjà au maximum")
        return false
    }
    else if trainer.pokemons[pokemon].hitpoints == 0
    {
        print("Impossible de rendre des PV à un pokémon K.O.")
        return false
    }
    trainer.pokemons[pokemon].hitpoints = trainer.pokemons[pokemon].effectiveStats.hitpoints
    trainer.bag[itemMaxPotion]! -= 1
    print("PV de \(trainer.pokemons[pokemon].name) entièrement restaurés")
    return true
}

func fullPP(trainer: inout Trainer, pokemon: Int) -> Bool
{
    for move in trainer.pokemons[pokemon].attacks
    {
        trainer.pokemons[pokemon].moves[move] = move.powerpoints
    }
    trainer.bag[itemMaxElixir]! -= 1
    print("PP des attaques de \(trainer.pokemons[pokemon].name) entièrement restaurés")
    return true
}

// Return the corresponding value in the matrix arrayTypeChart
func typeModifier(attacking: Type, defending : Type) -> Double
{
    return (arrayTypeChart[attacking]?[dicoType[defending]!])!
}

// Switch the fighting pokemon with another one
func switchPokemon(trainer: inout Trainer, newPokemon: Int) -> Bool
{
    if trainer.pokemons.count < newPokemon
    {
        print("Action inconnue")
        return false // Index out of range
    }
    else if (newPokemon == trainer.currentPokemon + 1)
    {
        print("Pokémon déjà sélectionné")
        return false // Same pokemon
    }
    else if (trainer.pokemons[newPokemon - 1].hitpoints == 0)
    {
        print("Pokémon déjà K.O.")
        return false // New pokemon is K.O.
    }
    print("\(trainer.name) : \(trainer.pokemons[trainer.currentPokemon].name) reviens !")
    sleep(1)
    trainer.currentPokemon = newPokemon - 1
    print("\(trainer.name) : \(trainer.pokemons[newPokemon - 1].name) go !")
    sleep(1)
    return true
}

// Selection of a pokemon for the player
func selectPokemon(trainer: inout Trainer, returnBool: Bool, switchBool: Bool) -> Int
{
    while true
    {
        var pokemonNumber : Int = 0;
        for pokemon in trainer.pokemons
        {
            pokemonNumber += 1
            print("\(pokemonNumber) : \(pokemon.name) PV : \(pokemon.hitpoints)/\(pokemon.effectiveStats.hitpoints) | ", terminator:"")
        }
        print("i : Informations | ", terminator:"")
        if returnBool
        {
            print("r : Retour", terminator:"")
        }
        print("\nSélectionnez un pokémon : ", terminator:"")

        let playerInput = readLine()

        switch playerInput!
        {
        case "1":
            if !switchBool
            {
                return 1
            }
            else if switchPokemon(trainer: &trainer, newPokemon: 1)
            {
                return 1
            }
        case "2":
            if !switchBool
            {
                return 2
            }
            if switchPokemon(trainer: &trainer, newPokemon: 2)
            {
                return 1
            }
        case "3":
            if !switchBool
            {
                return 3
            }
            if switchPokemon(trainer: &trainer, newPokemon: 3)
            {
                return 1
            }
        case "4":
            if !switchBool
            {
                return 4
            }
            if switchPokemon(trainer: &trainer, newPokemon: 4)
            {
                return 1
            }
        case "5":
            if !switchBool
            {
                return 5
            }
            if switchPokemon(trainer: &trainer, newPokemon: 5)
            {
                return 1
            }
        case "6":
            if !switchBool
            {
                return 6
            }
            if switchPokemon(trainer: &trainer, newPokemon: 6)
            {
                return 1
            }
        case "i":
            printPokemonInfo(trainer: trainer)
        case "r":
            if returnBool
            {
                return 0
            }
            print("Action inconnue")
        default:
            print("Action inconnue")
        }
    }

}

// http://bulbapedia.bulbagarden.net/wiki/Damage
// Return the damage of a move
func effectiveDamage(pokemon: Pokemon, move: Move, target: Pokemon, confusionBool: Bool) -> Int
{
    let level      : Double = Double(pokemon.level)
    let power      : Double = Double(confusionBool ? 40 : move.power)
    let attack     : Double = Double(((move.category == .physical) || confusionBool) ? pokemon.effectiveStats.attack : pokemon.effectiveStats.specialAttack)
    let defense    : Double = Double(((move.category == .physical) || confusionBool) ? target.effectiveStats.defense : target.effectiveStats.specialDefense)
    let baseDamage : Double = (2.0 * level / 5.0 + 2.0) * power * attack/defense / 50.0 + 2.0

    let random     : Double = Double(arc4random_uniform(39) + 217) / 255.0
    let stab       : Double = ((move.type == pokemon.species.type.0) || (move.type == pokemon.species.type.1)) ? 1.5 : 1.0
    var type       : Double = 1.0
    if !confusionBool
    {
        type = typeModifier(attacking: move.type, defending: target.species.type.0)
        if target.species.type.1 != nil // Double type
        {
            type *= typeModifier(attacking: move.type, defending: target.species.type.1!)
        }
    }

    let modifier   : Double = random * stab * type

    if type == 0.0
    {
        print("Cela n'affecte pas \(target.name)")
    }
    else if type < 1.0
    {
        print("Ce n'est pas très efficace")
    }
    else if type > 1.0
    {
        print("C'est super efficace !")
    }
    sleep(1)
    return Int(baseDamage * modifier)
}

// Return 1 if the target has 0 HP, 2 if the pokemon has 0 HP, 0 otherwise
func damage(pokemon: inout Pokemon, move: Move, target: inout Pokemon) -> Int
{
    pokemon.moves[move]! -= 1
    print("\n\(pokemon.name) utilise \(move.name) sur \(target.name)")
    sleep(1)

    var randomConfusion : Int = 0
    if pokemon.effects[.confusion]! > 0 // If the pokemon is confuse
    {
        randomConfusion = Int(arc4random_uniform(2) + 1)
        pokemon.effects[.confusion]! -= 1
    }

    if randomConfusion == 1 // The pokemon targets himself
    {
        print("\(pokemon.name) est confus")
        sleep(1)
        pokemon.hitpoints -= effectiveDamage(pokemon: pokemon, move: move, target: pokemon, confusionBool: true)

        if pokemon.hitpoints <= 0
        {
            pokemon.hitpoints = 0
            print("\(pokemon.name) est K.O. !\n")
            sleep(1)
            return 2
        }
    }
    else
    {
        let randomAccuracy : Int = Int(arc4random_uniform(100) + 1)
        if randomAccuracy > move.accuracy
        {
            print("\(pokemon.name) rate son attaque")
            return 0
        }

        target.hitpoints -= effectiveDamage(pokemon: pokemon, move: move, target: target, confusionBool: false)

        if move.effect != nil
        {
            switch move.effect!
            {
            case .confusion:
                randomConfusion = Int(arc4random_uniform(100) + 1)
                if randomConfusion <= 15
                {
                    target.effects[.confusion] = Int(arc4random_uniform(4) + 1)
                    print("\(target.name) est confus")
                }
            }
            sleep(1)
        }

        if target.hitpoints <= 0
        {
            target.hitpoints = 0
            print("\(target.name) est K.O. !\n")
            sleep(1)
            return 1
        }
    }
    return 0
}

// Return true is all target's pokemons have 0 HP
func checkEndOfFight(attackTrainer: Trainer, targetTrainer: inout Trainer) -> Bool
{
    if targetTrainer.availablePokemons == 0
    {
        print("Tous les pokémon de \(targetTrainer.name) sont K.O. ! \(attackTrainer.name) a gagné le combat !")
        sleep(1)
        return true
    }
    else if targetTrainer.name == "Ordinateur"
    {
        return !switchPokemon(trainer: &targetTrainer, newPokemon: targetTrainer.currentPokemon + 2)
    }
    else if selectPokemon(trainer: &targetTrainer, returnBool: false, switchBool: true) != 0
    {
        return false
    }
    return true
}

// Return true if the fight is terminated
func fight(firstTrainer: inout Trainer, firstMove: Move, secondTrainer: inout Trainer, secondMove: Move?) -> Bool
{
    var resultOfMove : Int = damage(pokemon: &firstTrainer.pokemons[firstTrainer.currentPokemon], move: firstMove, target: &secondTrainer.pokemons[secondTrainer.currentPokemon])
    if resultOfMove == 1
    {
        return checkEndOfFight(attackTrainer: firstTrainer, targetTrainer: &secondTrainer) // All pokemon are dead
    }
    else if resultOfMove == 2
    {
        return checkEndOfFight(attackTrainer: firstTrainer, targetTrainer: &firstTrainer)
    }
    else if secondMove != nil // Both trainers attack
    {
        resultOfMove = damage(pokemon: &secondTrainer.pokemons[secondTrainer.currentPokemon], move: secondMove!, target: &firstTrainer.pokemons[firstTrainer.currentPokemon])
        if resultOfMove == 1
        {
            return checkEndOfFight(attackTrainer: secondTrainer, targetTrainer: &firstTrainer) // All pokemon are dead
        }
        else if resultOfMove == 2
        {
            return checkEndOfFight(attackTrainer: secondTrainer, targetTrainer: &secondTrainer)
        }
    }
    return false
}

// Return the selected move
func selectMove(moveList: [Move], playerAttack: Int, pokemon: Pokemon, playerBool: Bool) -> Move?
{
    if moveList.count > playerAttack
    {
        let move : Move = moveList[playerAttack]
        if pokemon.moves[move]! > 0
        {
            return move
        }
        else if playerBool
        {
            print("Pas assez de PP")
        }
        return nil
    }
    else if playerBool
    {
        print("Action inconnue")
    }
    return nil
}

// Return true if escape success
func escape(a: Int, b: Int, c: inout Int, npc: Bool) -> Bool
{
    if npc
    {
        return false
    }
    else if b == 0
    {
        return true
    }
    c += 1
    let f : Int = Int(Double(a * 32) / Double((b / 4) % 256)) + 30 * c
    if f > 255
    {
        return true
    }
    let r : Int = Int(arc4random_uniform(256))
    if r < f
    {
        return true
    }
    return false
}

// Return true if the selected item is used
func useItem(trainer: inout Trainer, item: Item, pokemon: Int) -> Bool
{
    if trainer.bag[itemMaxPotion] == 0
    {
        print("Vous ne posédez pas cet objet")
        return false
    }
    return item.effect(&trainer, pokemon)
}

// Print informations
func printTrainerInfo(trainer: Trainer) -> ()
{
    print("===== \(trainer.name) - \(trainer.availablePokemons)/\(trainer.pokemons.count) =====")
    print("\(trainer.pokemons[trainer.currentPokemon].name) | Lv : \(trainer.pokemons[trainer.currentPokemon].level)")
    print("PV : \(trainer.pokemons[trainer.currentPokemon].hitpoints)/\(trainer.pokemons[trainer.currentPokemon].effectiveStats.hitpoints) | Exp : \(trainer.pokemons[trainer.currentPokemon].experience)")
    print("==============================\n")
}

func printPokemonInfo(trainer: Trainer) -> ()
{
    print("")
    for pokemon in trainer.pokemons
    {
        print("=============== \(pokemon.name) ===============")
        print("Espèce : \(pokemon.species.name) | ", terminator:"")
        if pokemon.species.type.1 != nil
        {
            print("Types : \(dicoTypeFR[pokemon.species.type.0]!), \(dicoTypeFR[pokemon.species.type.1!]!)")
        }
        else
        {
            print("Type : \(dicoTypeFR[pokemon.species.type.0]!)")
        }
        print("Sexe : \(dicoGenderFR[pokemon.gender]!) | Taille : \(pokemon.size) [m] | Poid : \(pokemon.weight) [kg]")
        print("PV : \(trainer.pokemons[trainer.currentPokemon].hitpoints)/\(trainer.pokemons[trainer.currentPokemon].effectiveStats.hitpoints) | Lv : \(trainer.pokemons[trainer.currentPokemon].level) | Exp : \(trainer.pokemons[trainer.currentPokemon].experience)")
        print("Att : \(pokemon.effectiveStats.attack) | Def : \(pokemon.effectiveStats.defense) | Att spé : \(pokemon.effectiveStats.specialAttack) | Def spé : \(pokemon.effectiveStats.specialDefense) | Vit : \(pokemon.effectiveStats.speed)")
        print ("Capacités :")
        for move in pokemon.moves
        {
            print("            \(move.key.name) | PP : \(move.value)/\(move.key.powerpoints)")
        }
        print("========================================\n")
        sleep(1)
    }
}

func printMoveInfo(pokemon: Pokemon) -> ()
{
    print("")
    for move in pokemon.moves
    {
        print("=============== \(move.key.name) ===============")
        print("Type : \(dicoTypeFR[move.key.type]!) | Catégorie : \(dicoCategoryFR[move.key.category]!) | PP : \(move.value)/\(move.key.powerpoints)")
        print("Puissance : \(move.key.power) | Précision : \(move.key.accuracy) | Priorité : \(move.value)/\(move.key.priority)")
        print("\(move.key.description)")
        print("========================================\n")
        sleep(1)
    }
}

func printItemInfo(trainer: Trainer) -> ()
{
    print("")
    for item in trainer.bag
    {
        print("=============== \(item.key.name) ===============")
        print("Utilisations restantes : \(item.value)")
        print("\(item.key.description)")
        print("========================================\n")
        sleep(1)
    }
}

// Main battle function
func battle(trainers: inout [Trainer]) -> ()
{
    // Initial
    print("Début du combat\n")
    sleep(1)

    // HP max
    for t in 0...trainers.count - 1
    {
        for p in 0...trainers[t].pokemons.count - 1
        {
            trainers[t].pokemons[p].hitpoints = trainers[t].pokemons[p].effectiveStats.hitpoints
        }
        print("\(trainers[t].name) : \(trainers[t].pokemons[trainers[t].currentPokemon].name) go !")
        sleep(1)
        printTrainerInfo(trainer: trainers[t])
        sleep(1)
    }

    var playerAttack     : Move?
    var computerAction   : Int
    var computerAttack   : Move?
    var playerSelect     : Int = 0
    var playerPriority   : Int = 0
    var computerPriority : Int = 0
    var escapeTest       : Int = 0
    var moveNumber       : Int = 0;

    fight: while true
    {
        // Turn start
        playerAttack   = nil
        computerAction = 0
        computerAttack = nil

        // Player turn
        selectPalyerAction: while true
        {
            print("a : Attaque | f : Fuite | p : changer Pokemon | s : Sac | i : Informations")
            print("Sélectionnez une action : ", terminator:"")

            let playerInput = readLine()

            switch playerInput!
            {
            case "a":
                selectPalyerAttack: while true
                {
                    moveNumber = 0;
                    var moveList = [Move]()
                    for move in trainers[1].pokemons[trainers[1].currentPokemon].moves
                    {
                        moveList.insert(move.key, at:moveNumber)
                        moveNumber += 1
                        print("\(moveNumber) : \(move.key.name) PP : \(move.value)/\(move.key.powerpoints) | ", terminator:"")
                    }
                    print("i : Informations | r : Retour")
                    print("Sélectionnez une attaque : ", terminator:"")

                    let playerInput = readLine()

                    switch playerInput!
                    {
                    case "1":
                        playerAttack = selectMove(moveList: moveList, playerAttack: 0, pokemon: trainers[1].pokemons[trainers[1].currentPokemon], playerBool: true)
                        if playerAttack != nil
                        {
                            break selectPalyerAction
                        }
                    case "2":
                        playerAttack = selectMove(moveList: moveList, playerAttack: 1, pokemon: trainers[1].pokemons[trainers[1].currentPokemon], playerBool: true)
                        if playerAttack != nil
                        {
                            break selectPalyerAction
                        }
                    case "3":
                        playerAttack = selectMove(moveList: moveList, playerAttack: 2, pokemon: trainers[1].pokemons[trainers[1].currentPokemon], playerBool: true)
                        if playerAttack != nil
                        {
                            break selectPalyerAction
                        }
                    case "4":
                        playerAttack = selectMove(moveList: moveList, playerAttack: 3, pokemon: trainers[1].pokemons[trainers[1].currentPokemon], playerBool: true)
                        if playerAttack != nil
                        {
                            break selectPalyerAction
                        }
                    case "i":
                        printMoveInfo(pokemon: trainers[1].pokemons[trainers[1].currentPokemon])
                    case "r":
                        break selectPalyerAttack
                    default:
                        print("Action inconnue")
                    }
                }
            case "f":
                if escape(a: trainers[1].pokemons[trainers[1].currentPokemon].effectiveStats.speed, b: trainers[0].pokemons[trainers[0].currentPokemon].effectiveStats.speed, c: &escapeTest, npc: true)
                {
                    print("\nVous prenez la fuite")
                    sleep(1)
                    break fight
                }
                print("\nVous ne pouvez pas fuire\n")
            case "i":
                print("")
                for trainer in trainers
                {
                    printTrainerInfo(trainer: trainer)
                }
                sleep(1)
            case "p":
                if selectPokemon(trainer: &trainers[1], returnBool: true, switchBool: true) != 0
                {
                    break selectPalyerAction
                }
            case "s":
                selectPalyerItem: while true
                {
                    var itemNumber : Int = 0
                    for item in trainers[1].bag
                    {
                        itemNumber += 1
                        print("\(itemNumber) : \(item.key.name) (\(item.value)) | ", terminator:"")
                    }
                    print("i : Informations | r : Retour")
                    print("Sélectionnez un objet : ", terminator:"")

                    let playerInput = readLine()

                    switch playerInput!
                    {
                    case "1":
                        playerSelect = selectPokemon(trainer: &trainers[1], returnBool: true, switchBool: false)
                        if playerSelect != 0
                        {
                            if useItem(trainer: &trainers[1], item: itemMaxPotion, pokemon: playerSelect - 1)
                            {
                                break selectPalyerAction
                            }
                        }
                    case "2":
                        playerSelect = selectPokemon(trainer: &trainers[1], returnBool: true, switchBool: false)
                        if playerSelect != 0
                        {
                            if useItem(trainer: &trainers[1], item: itemMaxElixir, pokemon: playerSelect - 1)
                            {
                                break selectPalyerAction
                            }
                        }
                    case "i":
                        printItemInfo(trainer: trainers[1])
                    case "r":
                        break selectPalyerItem
                    default:
                        print("Action inconnue")
                    }
                }
            case "exit":
                print("\nArrêt forcé")
                break fight
            default:
                print("Action inconnue")
            }
        }
        sleep(1)

        // Computer turn
        computerAction = 1
        if computerAction == 1
        {
            let computerMoves : [Move] = trainers[0].pokemons[trainers[0].currentPokemon].attacks
            repeat
            {
                computerAttack = selectMove(moveList: computerMoves, playerAttack: Int(arc4random_uniform(UInt32(computerMoves.count))), pokemon: trainers[0].pokemons[trainers[0].currentPokemon], playerBool: false)
            }
            while computerAttack == nil
        }

        // Attack turn
        if (computerAttack == nil) && (playerAttack != nil) // Only the player attacks
        {
            escapeTest = 0
            if fight(firstTrainer: &trainers[1], firstMove: playerAttack!, secondTrainer: &trainers[0], secondMove: nil)
            {
                break fight
            }
        }
        else if (computerAttack != nil) && (playerAttack == nil) // Only the computer attacks
        {
            if fight(firstTrainer: &trainers[0], firstMove: computerAttack!, secondTrainer: &trainers[1], secondMove: nil)
            {
                break fight
            }
        }
        else if (playerAttack != nil) && (computerAttack != nil) // The two trainers attack
        {
            escapeTest = 0
            // Order of attacking
            playerPriority    = playerAttack!.priority
            computerPriority  = computerAttack!.priority
            if (playerPriority > computerPriority) || ((playerPriority == computerPriority) && (trainers[1].pokemons[trainers[1].currentPokemon].effectiveStats.speed >= trainers[0].pokemons[trainers[0].currentPokemon].effectiveStats.speed))
            {
                if fight(firstTrainer: &trainers[1], firstMove: playerAttack!, secondTrainer: &trainers[0], secondMove: computerAttack!)
                {
                    break fight
                }
            }
            else
            {
                if fight(firstTrainer: &trainers[0], firstMove: computerAttack!, secondTrainer: &trainers[1], secondMove: playerAttack!)
                {
                    break fight
                }
            }
        }

        print("")
        for trainer in trainers
        {
            printTrainerInfo(trainer: trainer)
        }
        sleep(1)
    }

    // Final
    print("\nCombat terminé")
}



/*
 ==============================================================================
                                    Test input
 ==============================================================================
*/

// Moves
let movePound = Move(
    id:          1,
    name:        "Écras'Face",
    description: "Écras'Face inflige des dommages et ne possède pas d'effet secondaire particulier.",
    category:    .physical,
    type:        .normal,
    effect:      nil,
    power:       40,
    accuracy:    100,
    powerpoints: 35,
    priority:    0
)

let moveMegaPunch = Move(
    id:          2,
    name:        "Ultimapoing",
    description: "Ultimapoing inflige des dégâts et n'a pas d'effets secondaires.",
    category:    .physical,
    type:        .normal,
    effect:      nil,
    power:       80,
    accuracy:    85,
    powerpoints: 20,
    priority:    0
)

let moveConfusion = Move(
    id:          3,
    name:        "Choc Mental",
    description: "Choc Mental inflige des dégâts et a 10% de chances de rendre la cible confuse.",
    category:    .special,
    type:        .psychic,
    effect:      .confusion,
    power:       50,
    accuracy:    100,
    powerpoints: 25,
    priority:    0
)

let moveSwift = Move(
    id:          4,
    name:        "Météores",
    description: "Météores inflige des dégâts et possède la particularité de ne pas être affectée par les modifications de précision ou d'esquive.",
    category:    .status,
    type:        .normal,
    effect:      nil,
    power:       60,
    accuracy:    100,
    powerpoints: 20,
    priority:    0
)

// Species
let speciesMew = Species(
    id:         151,
    name:       "Mew",
    evolutions: [],
    attacks:    [movePound, moveMegaPunch],
    type:       (.psychic, nil),
    baseValues: Stats(
        hitpoints:      100,
        attack:         100,
        defense:        100,
        specialAttack:  100,
        specialDefense: 100,
        speed:          100
    )
)

let speciesMewtwo = Species(
    id:         150,
    name:       "Mewtwo",
    evolutions: [],
    attacks:    [moveConfusion, moveSwift],
    type:       (.psychic, nil),
    baseValues: Stats(
        hitpoints:      106,
        attack:         110,
        defense:        90,
        specialAttack:  154,
        specialDefense: 90,
        speed:          130
    )
)

// Pokemons
var pokemonMewP = Pokemon(
    nickname:         nil,
    hitpoints:        0,
    size:             0.4,
    weight:           4.0,
    gender:           .genderless,
    experience:       0,
    level:            50,
    species:          speciesMew,
    attacks:          [movePound, moveMegaPunch],
    moves:            [movePound: 35, moveMegaPunch: 20],
    effects:          [.confusion: 0],
    individualValues: Stats(
        hitpoints:      4,
        attack:         14,
        defense:        5,
        specialAttack:  6,
        specialDefense: 6,
        speed:          8
    ),
    effortValues:     Stats(
        hitpoints:      4,
        attack:         14,
        defense:        5,
        specialAttack:  6,
        specialDefense: 6,
        speed:          8
    )
)

var pokemonMewtwoP = Pokemon(
    nickname:         nil,
    hitpoints:        0,
    size:             2.0,
    weight:           122.0,
    gender:           .genderless,
    experience:       0,
    level:            50,
    species:          speciesMewtwo,
    attacks:          [moveConfusion, moveSwift],
    moves:            [moveConfusion: 25, moveSwift: 20],
    effects:          [.confusion: 0],
    individualValues: Stats(
        hitpoints:      4,
        attack:         14,
        defense:        5,
        specialAttack:  6,
        specialDefense: 6,
        speed:          8
    ),
    effortValues:     Stats(
        hitpoints:      4,
        attack:         14,
        defense:        5,
        specialAttack:  6,
        specialDefense: 6,
        speed:          8
    )
)

var pokemonMewC = Pokemon(
    nickname:         "Mew_",
    hitpoints:        0,
    size:             0.4,
    weight:           4.0,
    gender:           .genderless,
    experience:       0,
    level:            50,
    species:          speciesMew,
    attacks:          [movePound, moveMegaPunch],
    moves:            [movePound: 35, moveMegaPunch: 20],
    effects:          [.confusion: 0],
    individualValues: Stats(
        hitpoints:      0,
        attack:         2,
        defense:        6,
        specialAttack:  12,
        specialDefense: 12,
        speed:          10
    ),
    effortValues:     Stats(
        hitpoints:      0,
        attack:         2,
        defense:        6,
        specialAttack:  12,
        specialDefense: 12,
        speed:          10
    )
)

var pokemonMewtwoC = Pokemon(
    nickname:         "Mewtwo_",
    hitpoints:        0,
    size:             2.0,
    weight:           122.0,
    gender:           .genderless,
    experience:       0,
    level:            50,
    species:          speciesMewtwo,
    attacks:          [moveConfusion, moveSwift],
    moves:            [moveConfusion: 25, moveSwift: 20],
    effects:          [.confusion: 0],
    individualValues: Stats(
        hitpoints:      0,
        attack:         2,
        defense:        6,
        specialAttack:  12,
        specialDefense: 12,
        speed:          10
    ),
    effortValues:     Stats(
        hitpoints:      0,
        attack:         2,
        defense:        6,
        specialAttack:  12,
        specialDefense: 12,
        speed:          10
    )
)

// Items
let itemMaxPotion = Item(
    id:          0,
    name:        "Potion Max",
    description: "Cet objet permet de rendre la totalité de ses PV à un Pokémon (à utiliser en combat ou bien en dehors).",
    effect:      fullHeal
)

let itemMaxElixir = Item(
    id:          1,
    name:        "Max Élixir",
    description: "Cet objet permet à un Pokémon de récupérer la totalité des PP de toutes ses capacités.",
    effect:      fullPP
)

// Trainers
var trainerPlayer = Trainer(
    name:              "Joueur",
    pokemons:          [pokemonMewP, pokemonMewtwoP],
    currentPokemon:    0,
    bag:               [itemMaxPotion: 2, itemMaxElixir: 2]
)

var trainerComputer = Trainer(
    name:              "Ordinateur",
    pokemons:          [pokemonMewC, pokemonMewtwoC],
    currentPokemon:    0,
    bag:               [itemMaxPotion: 2, itemMaxElixir: 2]
)

var trainers: [Trainer] = [trainerComputer, trainerPlayer]
