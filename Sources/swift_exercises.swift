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

// fancy movesets are irrelevant, pick some other moves that aren't just plain damage

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
	// eventually remove this, and get HP from current_stats
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
	var current_stats	  : Stats
}

let kangaskhan = Pokemon(
	nickname: "KANGS",
	hitpoints: 0,	// eventually remove this, and get HP from current_stats
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
	effective_stats: Stats(	// temporary, remove these and fix calculations
		hitpoints: 0,
		attack: 0,
		defense: 0,
		special_attack: 0,
		special_defense: 0,
		speed: 0),
	current_stats: Stats(	// temporary, remove these and fix calculations
		hitpoints: 0,
		attack: 0,
		defense: 0,
		special_attack: 0,
		special_defense: 0,
		speed: 0)
	/*		,
	// http://bulbapedia.bulbagarden.net/wiki/Individual_values#Determination_of_stats_2
	// https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID259
	effective_stats: Stats(
		hitpoints: Int 			= 10 + kangaskhan.level + floor( ( Double( 2 * kangaskhan_species.base_values.hitpoints + kangaskhan.individual_values.hitpoints + floor(Double(kangaskhan.effort_values.hitpoints / 4 ) ) * kangaskhan.level ) )  / 100 ),
		attack: Int 			= floor( ( Double( (2 * base_values.attack + individual_values.attack  + floor(Double(effort_values.attack) / 4) ) * level) ) / 100 ) * natureMultiplier[kangaskhan.nature],
		defense: Int 			= floor( ( Double( (2 * base_values.defense + individual_values.defense  + floor(Double(effort_values.defense) / 4) ) * level) ) / 100 ) * natureMultiplier[kangaskhan.nature],
		special_attack: Int 	= floor( ( Double( (2 * base_values.special_attack + individual_values.special_attack  + floor(Double(effort_values.special_attack) / 4) ) * level) ) / 100 ) * natureMultiplier[nature],
		special_defense: Int 	= floor( ( Double( (2 * base_values.special_defense + individual_values.special_defense  + floor(Double(effort_values.special_defense) / 4) ) * level) ) / 100 ) * natureMultiplier[nature],
		speed: Int 				= floor( ( Double( (2 * base_values.speed + individual_values.speed  + floor(Double(effort_values.speed) / 4) ) * level) ) / 100 ) * natureMultiplier[nature]
	),
	// current_stats
	*/

)

// TODO: nature stat modifiers
// http://bulbapedia.bulbagarden.net/wiki/Nature


struct Trainer {
    let party : [Pokemon]
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

	// assume you can either fight or switch pokemon, but nothing more
	// struggle?????
	// no fancy effects and such, at least for now

    // TODO:
	// introductory blah blah
	// trainers send out the first respective pokemon
	// while both trainers have at least 1 non-KO pokemon:
		// display environment if relevant
		// trainers pick a move, or switch pokemon
			// pokemon: check it's valid and non-KO, priority 6
			// move: check that it's a valid move, and that it has PP left
		// check priority and speed to see who goes first
		// first to move
			// check status conditions, see if move can be executed (can always switch pokemon)
				// move changes weather?
					// y: set new weather
				// move changes pokemon stats?
					// y, first: set new first stats (self)
					// y, second: set new second stats
				// move deals damage?
					// calculate damage
					// deal damage to second
					// second (foe) KO?
						// y: opponent tries sending out another pokemon
						// n: move has status effects on second?
							//y: apply status effects
					// deal recoil damage to first (self) if appropriate
						// self KO?
							// y: first tries sending out another pokemon
		// second KO? n:
			// check status conditions, see if move can be executed (can always switch pokemon)
				// move changes weather?
					// y: set new weather
				// move changes pokemon stats?
					// y, second: set new first stats (self)
					// y, first: set new second stats
				// move deals damage?
					// calculate damage
					// deal damage to first
					// first (foe) KO?
						// y: opponent tries sending out another pokemon
						// n: move has status effects on first?
							//y: apply status effects
					// deal recoil damage to second (self) if appropriate
						// self KO?
							// y: second tries sending out another pokemon
		// nonzero status conditions on either pokemon: apply effects

}


func init() -> Int {
	// call other stuff here
	return 0
}
