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
let species_kangaskhan = Species(
	id: 155,
	name: "Kangaskhan",
	evolutions: [],
	attacks: [move_reversal, move_earthquake, move_iceBeam, move_suckerPunch],
	type: .normal,
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
frustration/return, but friendship isn't implemented.

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

let move_reversal = Move(
	id: 179,
	name: "Reversal",
	description: "Stronger if the user's HP is low.",
	category: .physical,
	type: .fighting,
	power: 0,	//can actually calculate power at this stage already
	accuracy: 100,
	powerpoints: 15,
	priority: 0
)

let move_earthquake = Move(
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

let move_iceBeam = Move(
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

let move_suckerPunch = Move(
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
    let nature            : Nature
    let species           : Species
    var moves             : [Move: Int] // Move -> remaining powerpoints
    let individual_values : Stats
    var effort_values     : Stats
	var effective_stats	  : Stats
    // TODO: implement the effective stats as a computed property:
    // https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID259
}

let kangaskhan = Pokemon(
	nickname: "KANGS",
	size: 2.2,
	weight: 80,
	level: 100, // DA VERY BESS
	experience: 1000000, // kangaskhan is a med-fast leveler, MFXP = lvl^3
	nature: .rash,
	species: species_kangaskhan,
	moves: [move_reversal: 15,
			move_earthquake: 10,
			move_iceBeam: 10,
			move_suckerPunch: 5]
	/*
	// TODO: set arbitrary (but reasonable) IV and EV, compute stats
	// or maybe minmax like a huge tryhard idk
	// http://bulbapedia.bulbagarden.net/wiki/Individual_values
	individual_values: Stats(
		hitpoints: 105,
		attack: 95,
		defense: 80,
		special_attack: 40,
		special_defense: 80,
		speed: 90
	)
	// http://bulbapedia.bulbagarden.net/wiki/Effort_values
	effort_values: Stats(
		hitpoints: 105,
		attack: 95,
		defense: 80,
		special_attack: 40,
		special_defense: 80,
		speed: 90
	)
	// http://bulbapedia.bulbagarden.net/wiki/Individual_values#Determination_of_stats_2
	effective_stats: Stats(
		hitpoints: 105,
		attack: 95,
		defense: 80,
		special_attack: 40,
		special_defense: 80,
		speed: 90
	)
	*/

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
    // TODO
    return 0
}

struct State {
    // TODO: describe a battle state
}

func battle(trainers: inout [Trainer], behavior: (State, Trainer) -> Move) -> () {
    // TODO: simulate battle
}
