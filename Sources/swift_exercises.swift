import Foundation

enum Type : Equatable {
case bug, dark, dragon, electric, fairy, fighting, fire, flying, ghost, grass, ground, ice, normal, poison, psychic, rock, steel, water
}

enum Category : Equatable {
case physical, special, status
}

enum Nature : Equatable {
case hardy, lonely, brave, adamant, naughty, bold, docile, relaxed, impish, lax ,timid, hasty, serious, holly, naive, modest, mild, quiet, bashful, rash, calm, gentle, sassy, careful, quirky
}

enum Weather {
case clear_skies, harsh_sunlight (extremly: Bool), rain (hearvy: Bool), sandstorm, hail (diamond_dust : Bool), shadowy_aura, fog, mysterious_air_current
}

enum Terrain : Equatable {
case normal, electric, grassy, psychic, misty
}

func typeModifier(att: Type, def: Type) -> Double {
  switch(att, def) {
    //att.normal

    case (.normal, .normal):
      return 1
    case (.normal, .fighting):
      return 1
    case (.normal, .flying):
      return 1
    case (.normal, .poison):
      return 1
    case (.normal, .ground):
      return 1
    case (.normal, .rock):
      return 0.5
    case (.normal, .bug):
      return 1
    case (.normal, .ghost):
      return 0
    case (.normal, .steel):
      return 0.5
    case (.normal, .fire):
      return 1
    case (.normal, .water):
      return 1
    case (.normal, .grass):
      return 1
    case (.normal, .electric):
      return 1
    case (.normal, .psychic):
      return 1
    case (.normal, .ice):
      return 1
    case (.normal, .dragon):
      return 1
    case (.normal, .dark):
      return 1

    //att.fight

  case (.fighting, .normal):
    return 2
  case (.fighting, .fighting):
    return 1
  case (.fighting, .flying):
    return 0.5
  case (.fighting, .poison):
    return 0.5
  case (.fighting, .ground):
    return 1
  case (.fighting, .rock):
    return 2
  case (.fighting, .bug):
    return 0.5
  case (.fighting, .ghost):
    return 0
  case (.fighting, .steel):
    return 2
  case (.fighting, .fire):
    return 1
  case (.fighting, .water):
    return 1
  case (.fighting, .grass):
    return 1
  case (.fighting, .electric):
    return 1
  case (.fighting, .psychic):
    return 0.5
  case (.fighting, .ice):
    return 2
  case (.fighting, .dragon):
    return 1
  case (.fighting, .dark):
    return 2

    //att.flying

  case (.flying, .normal):
    return 1
  case (.flying, .fighting):
    return 2
  case (.flying, .flying):
    return 1
  case (.flying, .poison):
    return 1
  case (.flying, .ground):
    return 1
  case (.flying, .rock):
    return 0.5
  case (.flying, .bug):
    return 2
  case (.flying, .ghost):
    return 1
  case (.flying, .steel):
    return 0.5
  case (.flying, .fire):
    return 1
  case (.flying, .water):
    return 1
  case (.flying, .grass):
    return 2
  case (.flying, .electric):
    return 0.5
  case (.flying, .psychic):
    return 1
  case (.flying, .ice):
    return 1
  case (.flying, .dragon):
    return 1
  case (.flying, .dark):
    return 1

  // att.poison

  case (.poison, .normal):
    return 1
  case (.poison, .fighting):
    return 1
  case (.poison, .flying):
    return 1
  case (.poison, .poison):
    return 0.5
  case (.poison, .ground):
    return 0.5
  case (.poison, .rock):
    return 0.5
  case (.poison, .bug):
    return 1
  case (.poison, .ghost):
    return 0.5
  case (.poison, .steel):
    return 0
  case (.poison, .fire):
    return 1
  case (.poison, .water):
    return 1
  case (.poison, .grass):
    return 2
  case (.poison, .electric):
    return 1
  case (.poison, .psychic):
    return 1
  case (.poison, .ice):
    return 1
  case (.poison, .dragon):
    return 1
  case (.poison, .dark):
    return 1
  case (.poison, .fairy):
    return 2

  // att.ground

  case (.ground, .normal):
    return 1
  case (.ground, .fighting):
    return 1
  case (.ground, .flying):
    return 0
  case (.ground, .poison):
    return 2
  case (.ground, .ground):
    return 1
  case (.ground, .rock):
    return 2
  case (.ground, .bug):
    return 0.5
  case (.ground, .ghost):
    return 1
  case (.ground, .steel):
    return 2
  case (.ground, .fire):
    return 2
  case (.ground, .water):
    return 1
  case (.ground, .grass):
    return 0.5
  case (.ground, .electric):
    return 2
  case (.ground, .psychic):
    return 1
  case (.ground, .ice):
    return 1
  case (.ground, .dragon):
    return 1
  case (.ground, .dark):
    return 1
  case (.ground, .fairy):
    return 1

  //att.rock

  case (.rock, .normal):
    return 1
  case (.rock, .fighting):
    return 0.5
  case (.rock, .flying):
    return 2
  case (.rock, .poison):
    return 1
  case (.rock, .ground):
    return 0.5
  case (.rock, .rock):
    return 1
  case (.rock, .bug):
    return 2
  case (.rock, .ghost):
    return 1
  case (.rock, .steel):
    return 0.5
  case (.rock, .fire):
    return 2
  case (.rock, .water):
    return 1
  case (.rock, .grass):
    return 1
  case (.rock, .electric):
    return 1
  case (.rock, .psychic):
    return 1
  case (.rock, .ice):
    return 2
  case (.rock, .dragon):
    return 1
  case (.rock, .dark):
    return 1
  case (.rock, .fairy):
    return 1

  //att.bug

  case (.bug, .normal):
    return 1
  case (.bug, .fighting):
    return 0.5
  case (.bug, .flying):
    return 0.5
  case (.bug, .poison):
    return 0.5
  case (.bug, .ground):
    return 1
  case (.bug, .rock):
    return 1
  case (.bug, .bug):
    return 1
  case (.bug, .ghost):
    return 0.5
  case (.bug, .steel):
    return 0.5
  case (.bug, .fire):
    return 0.5
  case (.bug, .water):
    return 1
  case (.bug, .grass):
    return 2
  case (.bug, .electric):
    return 1
  case (.bug, .psychic):
    return 2
  case (.bug, .ice):
    return 1
  case (.bug, .dragon):
    return 1
  case (.bug, .dark):
    return 2
  case (.bug, .fairy):
    return 0.5

  //att.ghost

  case (.ghost, .normal):
    return 0
  case (.ghost, .fighting):
    return 1
  case (.ghost, .flying):
    return 1
  case (.ghost, .poison):
    return 1
  case (.ghost, .ground):
    return 1
  case (.ghost, .rock):
    return 1
  case (.ghost, .bug):
    return 1
  case (.ghost, .ghost):
    return 2
  case (.ghost, .steel):
    return 1
  case (.ghost, .fire):
    return 1
  case (.ghost, .water):
    return 1
  case (.ghost, .grass):
    return 1
  case (.ghost, .electric):
    return 1
  case (.ghost, .psychic):
    return 2
  case (.ghost, .ice):
    return 1
  case (.ghost, .dragon):
    return 1
  case (.ghost, .dark):
    return 0.5
  case (.ghost, .fairy):
    return 1

  //att.steel

  case (.steel, .normal):
    return 1
  case (.steel, .fighting):
    return 1
  case (.steel, .flying):
    return 1
  case (.steel, .poison):
    return 1
  case (.steel, .ground):
    return 1
  case (.steel, .rock):
    return 2
  case (.steel, .bug):
    return 1
  case (.steel, .ghost):
    return 1
  case (.steel, .steel):
    return 0.5
  case (.steel, .fire):
    return 0.5
  case (.steel, .water):
    return 0.5
  case (.steel, .grass):
    return 1
  case (.steel, .electric):
    return 0.5
  case (.steel, .psychic):
    return 1
  case (.steel, .ice):
    return 2
  case (.steel, .dragon):
    return 1
  case (.steel, .dark):
    return 1
  case (.steel, .fairy):
    return 2

  //att.fire

  case (.fire, .normal):
    return 1
  case (.fire, .fighting):
    return 1
  case (.fire, .flying):
    return 1
  case (.fire, .poison):
    return 1
  case (.fire, .ground):
    return 1
  case (.fire, .rock):
    return 0.5
  case (.fire, .bug):
    return 2
  case (.fire, .ghost):
    return 1
  case (.fire, .steel):
    return 2
  case (.fire, .fire):
    return 0.5
  case (.fire, .water):
    return 0.5
  case (.fire, .grass):
    return 2
  case (.fire, .electric):
    return 1
  case (.fire, .psychic):
    return 1
  case (.fire, .ice):
    return 2
  case (.fire, .dragon):
    return 0.5
  case (.fire, .dark):
    return 1
  case (.fire, .fairy):
    return 1

  //att.water

  case (.water, .normal):
    return 1
  case (.water, .fighting):
    return 1
  case (.water, .flying):
    return 1
  case (.water, .poison):
    return 1
  case (.water, .ground):
    return 2
  case (.water, .rock):
    return 2
  case (.water, .bug):
    return 1
  case (.water, .ghost):
    return 1
  case (.water, .steel):
    return 1
  case (.water, .fire):
    return 2
  case (.water, .water):
    return 0.5
  case (.water, .grass):
    return 0.5
  case (.water, .electric):
    return 1
  case (.water, .psychic):
    return 1
  case (.water, .ice):
    return 1
  case (.water, .dragon):
    return 0.5
  case (.water, .dark):
    return 1
  case (.water, .fairy):
    return 1

  //att.grass

  case (.grass, .normal):
    return 1
  case (.grass, .fighting):
    return 1
  case (.grass, .flying):
    return 0.5
  case (.grass, .poison):
    return 0.5
  case (.grass, .ground):
    return 2
  case (.grass, .rock):
    return 2
  case (.grass, .bug):
    return 0.5
  case (.grass, .ghost):
    return 1
  case (.grass, .steel):
    return 0.5
  case (.grass, .fire):
    return 0.5
  case (.grass, .water):
    return 2
  case (.grass, .grass):
    return 0.5
  case (.grass, .electric):
    return 1
  case (.grass, .psychic):
    return 1
  case (.grass, .ice):
    return 1
  case (.grass, .dragon):
    return 0.5
  case (.grass, .dark):
    return 1
  case (.grass, .fairy):
    return 1

  //att.electric

  case (.electric, .normal):
    return 1
  case (.electric, .fighting):
    return 1
  case (.electric, .flying):
    return 2
  case (.electric, .poison):
    return 1
  case (.electric, .ground):
    return 0
  case (.electric, .rock):
    return 1
  case (.electric, .bug):
    return 1
  case (.electric, .ghost):
    return 1
  case (.electric, .steel):
    return 1
  case (.electric, .fire):
    return 1
  case (.electric, .water):
    return 2
  case (.electric, .grass):
    return 0.5
  case (.electric, .electric):
    return 0.5
  case (.electric, .psychic):
    return 1
  case (.electric, .ice):
    return 1
  case (.electric, .dragon):
    return 0.5
  case (.electric, .dark):
    return 1
  case (.electric, .fairy):
    return 1

  //att.psychic

  case (.psychic, .normal):
    return 1
  case (.psychic, .fighting):
    return 2
  case (.psychic, .flying):
    return 1
  case (.psychic, .poison):
    return 2
  case (.psychic, .ground):
    return 1
  case (.psychic, .rock):
    return 1
  case (.psychic, .bug):
    return 1
  case (.psychic, .ghost):
    return 1
  case (.psychic, .steel):
    return 0.5
  case (.psychic, .fire):
    return 1
  case (.psychic, .water):
    return 1
  case (.psychic, .grass):
    return 1
  case (.psychic, .electric):
    return 1
  case (.psychic, .psychic):
    return 0.5
  case (.psychic, .ice):
    return 1
  case (.psychic, .dragon):
    return 1
  case (.psychic, .dark):
    return 0
  case (.psychic, .fairy):
    return 1

  //att.ice

  case (.ice, .normal):
    return 1
  case (.ice, .fighting):
    return 1
  case (.ice, .flying):
    return 2
  case (.ice, .poison):
    return 1
  case (.ice, .ground):
    return 2
  case (.ice, .rock):
    return 1
  case (.ice, .bug):
    return 1
  case (.ice, .ghost):
    return 1
  case (.ice, .steel):
    return 0.5
  case (.ice, .fire):
    return 0.5
  case (.ice, .water):
    return 0.5
  case (.ice, .grass):
    return 2
  case (.ice, .electric):
    return 1
  case (.ice, .psychic):
    return 1
  case (.ice, .ice):
    return 0.5
  case (.ice, .dragon):
    return 2
  case (.ice, .dark):
    return 1
  case (.ice, .fairy):
    return 1

  //att.dragon

  case (.dragon, .normal):
    return 1
  case (.dragon, .fighting):
    return 1
  case (.dragon, .flying):
    return 1
  case (.dragon, .poison):
    return 1
  case (.dragon, .ground):
    return 1
  case (.dragon, .rock):
    return 1
  case (.dragon, .bug):
    return 1
  case (.dragon, .ghost):
    return 1
  case (.dragon, .steel):
    return 0.5
  case (.dragon, .fire):
    return 1
  case (.dragon, .water):
    return 1
  case (.dragon, .grass):
    return 1
  case (.dragon, .electric):
    return 1
  case (.dragon, .psychic):
    return 1
  case (.dragon, .ice):
    return 1
  case (.dragon, .dragon):
    return 2
  case (.dragon, .dark):
    return 1
  case (.dragon, .fairy):
    return 0

  //att.dark

  case (.dark, .normal):
    return 1
  case (.dark, .fighting):
    return 0.5
  case (.dark, .flying):
    return 1
  case (.dark, .poison):
    return 1
  case (.dark, .ground):
    return 1
  case (.dark, .rock):
    return 1
  case (.dark, .bug):
    return 1
  case (.dark, .ghost):
    return 2
  case (.dark, .steel):
    return 1
  case (.dark, .fire):
    return 1
  case (.dark, .water):
    return 1
  case (.dark, .grass):
    return 1
  case (.dark, .electric):
    return 1
  case (.dark, .psychic):
    return 2
  case (.dark, .ice):
    return 1
  case (.dark, .dragon):
    return 1
  case (.dark, .dark):
    return 0.5
  case (.dark, .fairy):
    return 0.5

  //att.fairy

  case (.fairy, .normal):
    return 1
  case (.fairy, .fighting):
    return 2
  case (.fairy, .flying):
    return 1
  case (.fairy, .poison):
    return 0.5
  case (.fairy, .ground):
    return 1
  case (.fairy, .rock):
    return 1
  case (.fairy, .bug):
    return 1
  case (.fairy, .ghost):
    return 1
  case (.fairy, .steel):
    return 0.5
  case (.fairy, .fire):
    return 0.5
  case (.fairy, .water):
    return 1
  case (.fairy, .grass):
    return 1
  case (.fairy, .electric):
    return 1
  case (.fairy, .psychic):
    return 1
  case (.fairy, .ice):
    return 1
  case (.fairy, .dragon):
    return 2
  case (.fairy, .dark):
    return 2
  case (.fairy, .fairy):
    return 1
  }
}

struct Move : Hashable {
  let id : Int
  let name : String
  let description : String
  let category : Category
  let type : Type
  let power : Int
  let accuracy : Int
  let powerpoints : Int
  let priority : Int

  var hashValue : Int {
    return self.id
  }
}

func ==(lhs: Move, rhs: Move) -> Bool {
  return lhs.id == rhs.id
}

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

//class Pokemon {
  //let nickname : String?
  //var hitpoints : Int
  //var size : Int
  //var weight : Int
  //var experience : Int
  //var level : Int
  //var nature : Nature
  //let species : Species
  //var moves : [Move: Int]
  //var individual_values : Stats
  //var effort_values : Stats
  //init(nickname: String?, hitpoints: Int, size: Int, weight: Int, experience: Int, level: Int, nature: Nature, species: Species, moves: [Move: Int], individual_values: Stats, effort_values: Stats) {
    //self.nickname = nickname
    //self.hitpoints = hitpoints
    //self.size = size
    //self.weight = weight
    //self.experience = experience
    //self.level = level
    //self.nature = nature
    //self.species = species
    //self.moves = moves
    //self.individual_values = individual_values
    //self.effort_values = effort_values
  //}
//}

struct Pokemon {
    let nickname          : String
    var hitpoints         : Int
    let size              : Int
    let weight            : Int
    let experience        : Int
    let level             : Int
    let nature            : Nature
    let species           : Species
    var moves             : [Move]
    let individual_values : Stats
    let effort_values     : Stats
}

struct Trainer {
  let name : String
  let pokemons : [Pokemon]
}

struct Environment {
  let weather : Weather
  let terrain : Terrain
}


func damage(environment: Environment, pokemon: Pokemon, move: Move, target: Pokemon) -> Int {
  var dcA = 0
  var dcD = 0
  var dcModifier = 0.0
  var dcWeather = 1.0
  var dcCritMult = 1.0
  var dcRandom = randomInt(min : 85, max : 100)
  var dcCritRandom = randomInt(min : 0, max : 255)
  var dcCritThreshold = randomInt(min : 0, max : 255)
  if move.category == Category.physical {
    dcA = pokemon.individual_values.attack
    dcD = target.individual_values.defense
  }
  else if move.category == Category.special {
    dcA = pokemon.individual_values.special_attack
    dcD = target.individual_values.special_defense
  }
  if environment.weather == Weather.harsh_sunlight(extremly : true) || environment.weather == Weather.harsh_sunlight(extremly : false) {
    if move.type == Type.fire {
      dcWeather = 1.5
    }
    else if move.type == Type.water {
      dcWeather = 0.5
    }
  }
  else if environment.weather == Weather.rain(hearvy : true) || environment.weather == Weather.rain(hearvy : false) {
    if move.type == Type.fire {
      dcWeather = 0.5
    }
    else if move.type == Type.water {
      dcWeather = 1.5
    }
  }
  if dcCritRandom < dcCritThreshold {
    dcCritMult = (2.0*Double(pokemon.level)+5.0)/(Double(pokemon.level)+5.0)
  }
  else {
    dcCritMult = 1.0
  }
  var p1 = (2.0*Double(pokemon.level)/5.0+2.0)*Double(move.power)*Double(dcA)/Double(dcD)/50.0+2.0
  var p2 = dcWeather*dcCritMult*Double(dcRandom)*typeModifier(pokemon.type, target.type)
  var p3 = Int(p1*p2)
  return p3
}

struct State {
  let p1 : Trainer
  let p2 : Trainer
  var pokemonAtt : Pokemon
  var pokemonDef : Pokemon
  var combatEnvironment : Environment
}

func behaviour(state : State, trainer : Trainer) -> Move {
  let weat = combatEnvironment.weather
  let ter = combatEnvironment.terrain
  print("Le temps est \(weat) sur le terrain \(ter)")
  var choix : Int = randomInt(min : 0, max : trainer.pokemons[0].moves.count)
  print("\n\nC'est à \(trainer.name) de jouer.\nChoisissez une attack parmi la liste suivante :\n")
  for i in 0...trainer.pokemons[0].moves.count {
    print("\n\(i). \(trainer.pokemons[0].moves[i].name) - type : \(trainer.pokemons[0].moves[i].type)")
  }
  print("\n\n\(choix). \(trainer.pokemons[0].moves[i].name) a été choisis !");
  return trainer.pokemons[0].moves[Int(choix)]
}

func battle(trainers: inout [Trainer]) -> () {

}

//Fonction provenant de StackOverflow ! http://stackoverflow.com/questions/24256564/generating-random-values-in-swift-between-two-integer-values
func randomInt(min: Int, max: Int) -> Int {
    let randomNum = Int(arc4random_uniform(UInt32(max) - UInt32(min)) + UInt32(min))
    return randomNum
}

func hpCalculator(pokemon : Pokemon) -> Int {
  var p1 = (Double(pokemon.species.base_values.hitpoints)+Double(pokemon.individual_values.hitpoints))*2.0
  var p2 = (sqrt(Double(pokemon.effort_values.hitpoints))/4.0)
  var p3 = (p1+p2)*Double(pokemon.level)/100.0+Double(pokemon.level)+10.0
  return Int(p3)
}

func otherStatCalculator(pokemon : Pokemon) -> Int {
  var p1 = (Double(pokemon.species.base_values.hitpoints)+Double(pokemon.individual_values.hitpoints))*2.0
  var p2 = (sqrt(Double(pokemon.effort_values.hitpoints))/4.0)
  var p3 = (p1+p2)*Double(pokemon.level)/100.0+5.0
  return Int(p3)
}

func indValGenerator() -> Stats {
  return Stats(hitpoints : Int(randomInt(min : 0, max : 31)), attack : Int(randomInt(min : 0, max : 31)), defense : Int(randomInt(min : 0, max : 31)), special_attack : Int(randomInt(min : 0, max : 31)), special_defense : Int(randomInt(min : 0, max : 31)), speed : Int(randomInt(min : 0, max : 31)))
}

func environmentGenerator() -> Environment {
  var rand = randomInt(min : 0, max : 10)
  var tempWeather : Weather
  switch rand {
  case 0:
    tempWeather = Weather.clear_skies
  case 1:
    tempWeather = Weather.harsh_sunlight(extremly : false)
  case 2:
    tempWeather = Weather.harsh_sunlight(extremly : true)
  case 3:
    tempWeather = Weather.rain(hearvy : false)
  case 4:
    tempWeather = Weather.rain(hearvy : true)
  case 5:
    tempWeather = Weather.sandstorm
  case 6:
    tempWeather = Weather.hail(diamond_dust : false)
  case 7:
    tempWeather = Weather.hail(diamond_dust : true)
  case 8:
    tempWeather = Weather.shadowy_aura
  case 9:
    tempWeather = Weather.fog
  case 10:
    tempWeather = Weather.mysterious_air_current
  }
  var tempTerrain : Terrain
  rand = randomInt(min : 0, max : 4)
  switch rand {
  case 0:
    tempTerrain = Terrain.normal
  case 1:
    tempTerrain = Terrain.electric
  case 2:
    tempTerrain = Terrain.grassy
  case 3:
    tempTerrain = Terrain.psychic
  case 4:
    tempTerrain = Terrain.misty
  }
  return Environment(weather : tempWeather, terrain : tempTerrain)
}

func moveSelect(pokemon : Pokemon) -> Move {
  var rand = randomInt(min : 0, max : pokemon.moves.count)
  return pokemon.moves[rand]
}

// Instanciation de nos pokémons Canarticho !

let canartichoStats = Stats(hitpoints : 52, attack : 65, defense : 55, special_attack : 58, special_defense : 62, speed : 60)
let moveRapace = Move(id : 1, name : "Rapace", description : "Le lanceur replie ses ailes et charge en rase-mottes. Le lanceur subit aussi de graves dégâts", category : Category.physical, type : Type.flying, power : 120, accuracy : 100, powerpoints : 15, priority : 0)
let movePicpic = Move(id : 2, name : "Picpic", description : "Frappe l'ennemi d'un bec pointu ou d'une corne pour infliger des dégâts.", category : Category.physical, type : Type.flying, power : 35, accuracy : 100, powerpoints : 35, priority : 0)
let canartichoMoves : Set<Move> = [moveRapace, movePicpic]
let canartichoSpecies = Species(id : 083, name : "Canarticho", evolutions : [], attacks : canartichoMoves, type : (Type.normal, Type.flying), base_values : canartichoStats)
let canartichoIndVal = Stats(hitpoints : 0, attack : 0, defense : 0, special_attack : 0, special_defense : 0, speed : 0)
let canartichoIndVal2 = Stats(hitpoints : 0, attack : 0, defense : 0, special_attack : 0, special_defense : 0, speed : 0)
let canartichoEffVal = Stats(hitpoints : 0, attack : 0, defense : 0, special_attack : 0, special_defense : 0, speed : 0)
var canartichoPokemon = Pokemon(nickname : "Sagouin", hitpoints : canartichoStats.hitpoints, size : 80, weight : 15, experience : 0, level : 1, nature : Nature.hasty, species : canartichoSpecies, moves : [moveRapace : 1, movePicpic : 2], individual_values : canartichoIndVal, effort_values : canartichoEffVal)
var canartichoPokemon2 = Pokemon(nickname : "Saligo", hitpoints : canartichoStats.hitpoints, size : 80, weight : 15, experience : 0, level : 1, nature : Nature.hasty, species : canartichoSpecies, moves : [moveRapace : 1, movePicpic : 2], individual_values : canartichoIndVal2, effort_values : canartichoEffVal)

// Instanciation de nos trainers !

var player1 = Trainer(name : "Koj", pokemons : [canartichoPokemon])
var player2 = Trainer(name : "Yuzu", pokemons : [canartichoPokemon2])
var players = [player1, player2]

// Instanciation de notre environment !

var combatEnvironment = environmentGenerator()
