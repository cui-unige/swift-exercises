import Foundation	// floor, random, etc

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
    var power       : Int
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


// create kangaskhan species
let species_kangaskhan: Species = Species(
	id: 155,
	name: "Kangaskhan",
	evolutions: [],
	attacks: [move_reversal, move_earthquake, move_iceBeam, move_suckerPunch],
	type: (.normal, nil),
	base_values: Stats(
		hitpoints: 105,
		attack: 95,
		defense: 80,
		special_attack: 40,
		special_defense: 80,
		speed: 90
	)
)


/* four moves: reversal, earthquake, ice beam, and sucker punch.

This is actually a decent offensive moveset, geared towards consistent (100% starting
accuracy) high damage while tanking (kangaskhan has high non-water HP, IVs
willing), rather than endurance (only 40 cumulative PPs, 25 if not counting
reversal) or status, and types are chosen so that there's always at least one
2x move (except against fight and ghost types, both of which are 1x). There
aren't really any STAB moves worth using in this optic (except maybe
frustration/return, but friendship isn't implemented)

Possible but ultimately inconsistent candidates for powerful STAB would be:
	dizzy punch: 1.5x70 with 20% chance of confusion; decent candidate, but ultimately worse than appropriately choosing type-specific moves. yeah, signature move and all
	hyper beam: 1.5x150 is very good alpha, but the recovery round and the 90% accuracy screws it up; also, kangaskhan's spatk is relatively low
	frustration/return: actually viable with extremely low/high friendship, but that mechanic isn't implemented and probably won't be, given the nature of this assignment
	facade: boosted damage (1.5x2x70) seems good, but burn status halves physical damage, paralysis reduces effective damage per round by 25% and completely wrecks speed. If you're dangerously low on health reversal should be more than enough to finish them off (unless you're up against a ghost, in which case yeah tough shit).
	giga impact: 1.5x150 is very good alpha, but the recovery round and the 90% accuracy screws it up
	double edge: 1.5x120 is good alpha, but 1/3 recoil is just silly
	uproar: 1.5x90 is alright, but it uses spatk and multi-turn moves are silly

Also, keep in mind kangaskhan is normal-type and normal-type attacks are 1x
against everything (except rock and steel (0.5x), and ghost (0x)), normal-type
STAB isn't worth it over a potential 2x type bonus gained through the use of a
move chosen appropriately with regard to type.

Comparatively high HP will allow for an efficient use of reversal should the
situation get dire, but it shouldn't be relied on earlier on.
*/

func computeReversalPower(currentHitpoints: Int, maxHitpoints: Int) -> Int
{
	// returns damage dealt by the 'reversal' move
	// see http://bulbapedia.bulbagarden.net/wiki/Reversal_(move)
	let HPRatio: Double = Double(currentHitpoints) / Double(maxHitpoints)

	if (0.0417 > HPRatio) {return 200}
	else if (0.1042 > HPRatio) {return 150}
	else if (0.2083 > HPRatio) {return 100}
	else if (0.3542 > HPRatio) {return 80}
	else if (0.6875 > HPRatio) {return 40}
	else {return 20}
}

let move_reversal: Move = Move(
	id: 179,
	name: "Reversal",
	description: "Stronger if the user's HP is low.",
	category: .physical,
	type: .fighting,
	power: computeReversalPower(currentHitpoints: kangaskhan.hitpoints, maxHitpoints: kangaskhan.effective_stats.hitpoints),	// ?
	accuracy: 100,
	powerpoints: 15,
	priority: 0
)

let move_earthquake: Move = Move(
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

let move_iceBeam: Move = Move(
	id: 58,
	name: "Ice Beam",
	description: "An attack that may freeze the foe.",
	category: .special,
	type: .ice,
	power: 90,
	accuracy: 100,
	powerpoints: 10,
	priority: 0
)

let move_suckerPunch: Move = Move(
	id: 389,
	name: "Sucker Punch",
	description: "This move enables the user to attack first. It fails if the foe is not readying an attack, however.",
	category: .physical,
	type: .fighting,
	power: 70,
	accuracy: 100,
	powerpoints: 5,
	priority: 1
)


struct Pokemon {
	let nickname          : String?
	var hitpoints         : Int // remaining hitpoints
	let size              : Float
	let weight            : Float
	var experience        : Int
	var level             : Int
	let type			  : (Type, Type?)
	let nature            : Nature
	let species           : Species
	var moves             : [Move: Int] // Move -> remaining powerpoints
	let base_values		  : Stats
	let individual_values : Stats
	var effort_values     : Stats
	var effective_stats	  : Stats
}

let kangaskhan = Pokemon(
	nickname: "KANGS",
	hitpoints: 0,	// ?
	size: 2.2,
	weight: 80,
	experience: 1000000, // kangaskhan is a medium-fast leveler, MFXP = lvl^3
	level: 100, // DA VERY BESS
	type : species_kangaskhan.type,
	nature: .rash,
	species: species_kangaskhan,
	moves: [move_reversal: 15,
			move_earthquake: 10,
			move_iceBeam: 10,
			move_suckerPunch: 5],
	base_values: species_kangaskhan.base_values,
	//IVs and EVs tryharded to hell and back because why not
	individual_values: Stats(
		hitpoints: 31,
		attack: 31,
		defense: 31,
		special_attack: 31,
		special_defense: 31,
		speed: 31
	),
	effort_values: Stats(
		hitpoints: 200,
		attack: 200,
		defense: 30,
		special_attack: 20,
		special_defense: 30,
		speed: 30
	),
	effective_stats: Stats(hitpoints: 0, // temporary, remove this and fix calculations
	attack: 0,
	defense: 0,
	special_attack: 0,
	special_defense: 0,
	speed: 0)
	/*		,
	// http://bulbapedia.bulbagarden.net/wiki/Individual_values#Determination_of_stats_2
	// https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID259
	effective_stats: Stats(	// 'pokemons'?
		hitpoints: Int 			= 10 + kangaskhan.level + floor( ( Double( 2 * kangaskhan_species.base_values.hitpoints + kangaskhan.individual_values.hitpoints + floor(Double(kangaskhan.effort_values.hitpoints / 4 ) ) * kangaskhan.level ) )  / 100 ),
		attack: Int 			= floor( ( Double( (2 * base_values.attack + individual_values.attack  + floor(Double(effort_values.attack) / 4) ) * level) ) / 100 ) * natureMultiplier[kangaskhan.nature],
		defense: Int 			= floor( ( Double( (2 * base_values.defense + individual_values.defense  + floor(Double(effort_values.defense) / 4) ) * level) ) / 100 ) * natureMultiplier[kangaskhan.nature],
		special_attack: Int 	= floor( ( Double( (2 * base_values.special_attack + individual_values.special_attack  + floor(Double(effort_values.special_attack) / 4) ) * level) ) / 100 ) * natureMultiplier[nature],
		special_defense: Int 	= floor( ( Double( (2 * base_values.special_defense + individual_values.special_defense  + floor(Double(effort_values.special_defense) / 4) ) * level) ) / 100 ) * natureMultiplier[nature],
		speed: Int 				= floor( ( Double( (2 * base_values.speed + individual_values.speed  + floor(Double(effort_values.speed) / 4) ) * level) ) / 100 ) * natureMultiplier[nature]
	)*/

)

// TODO: nature stat modifiers
// http://bulbapedia.bulbagarden.net/wiki/Nature


struct Trainer {
    let pokemons : [Pokemon]
}

struct Environment {
    var weather : Weather
    let terrain : Terrain
}

// http://bulbapedia.bulbagarden.net/wiki/Type/Type_chart
func typeModifier(attacking: Type, defending : Type) -> Double {
    // TODO: encode type/type chart
    return 1
}

// http://bulbapedia.bulbagarden.net/wiki/Damage
func damage(environment : Environment, pokemon: Pokemon, move: Move, target: Pokemon) -> Int {

	var STAB : Double = 1 // initialise with non-STAB multiplier value
	if (kangaskhan.type.0 == move.type) {STAB = 1.5}
	else if (kangaskhan.type.1 == move.type) {STAB = 1.5}

	let typeBonus: Double = 1 // actually calculate this

	var critical: Double = 1 // initialise with non-crit mult value
	let randNum: Int = Int(drand48() * 257) // random int between 0 and 256 (included)
	let threshold: Int = Int(round(Double(kangaskhan.base_values.speed / 2)))
	if ( randNum < threshold)
		{critical = ( Double(2 * kangaskhan.level + 5) / Double(kangaskhan.level + 5) ) }

	let environmentBonus: Double = 1 // actually calculate this

	// drand48() returns a random double between 0 and 1
	// but randFactor should be uniformly distributed between 0.85 and 1
	let randFactor: Double = ((drand48() * 0.15) + 0.85)

	// assuming no items or abilities
	let modifier : Double = STAB * typeBonus * critical * environmentBonus * randFactor

	// TODO calculate actual damage

    return 0
}

struct State {
    // TODO: describe a battle state
}

func battle(trainers: inout [Trainer], behavior: (State, Trainer) -> Move) -> () {
    // TODO: simulate battle


	///////////////////////

	// TODO check if enough PP left, error if not
	// TODO calculate actual damage ('damage' function)
	// TODO status changes?
	// TODO recoil damage?
	// TODO inflict damage to foe/self if appropriate
	// TODO change pokemon status and environment if appropriate
}
