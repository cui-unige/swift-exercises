import XCTest
@testable import swift_exercises

class swift_exercisesTests: XCTestCase {

    func test_typeModifier() {
        XCTAssertEqual(typeModifier(attacking: Type.normal, defending: Type.normal), 1, "normal/normal should be 1")
    }

   func test_combat() {

      /* Utility vars */
      let crap_stats = Stats(
         hitpoints       : 0,
         attack          : 0,
         defense         : 0,
         special_attack  : 0,
         special_defense : 0,
         speed           : 0
      )

      /* Define trainers and general infos */
      var squigy = Pokemon(
         nickname: "Squigy",
         hitpoints: 1,
         size: 24,
         weight: 400,
         gender: .male,
         experience: 2,
         level: 1,
         nature: .hardy,
         species: species_bulbasaur,
         moves: [move_tackle: move_tackle.powerpoints, move_vine_whip: move_vine_whip.powerpoints],
         effects: [],
         individual_values: crap_stats,
         effort_values: crap_stats,
         temp_modifiers: crap_stats
      )
      squigy.hitpoints = squigy.effective_stats.hitpoints
      var potty = Pokemon(
         nickname: "Potty",
         hitpoints: 1,
         size: 24,
         weight: 450,
         gender: .male,
         experience: 4,
         level: 1,
         nature: .hardy,
         species: species_venusaur,
         moves: [move_tackle: move_tackle.powerpoints, move_vine_whip: move_vine_whip.powerpoints],
         effects: [],
         individual_values: crap_stats,
         effort_values: crap_stats,
         temp_modifiers: crap_stats
      )
      potty.hitpoints = potty.effective_stats.hitpoints
      let patrick = Trainer(name: "Patrick", pokemons: [squigy], backpack: [])
      let petrik = Trainer(name: "Petrik", pokemons: [potty], backpack: [])
      var fighters = [patrick,petrik]

      /* Start combat */
      battle(trainers: &fighters, behavior: dumbOffense)

   }

    static var allTests : [(String, (swift_exercisesTests) -> () throws -> Void)] {
        return [
            ("Type/Type modifiers", test_typeModifier),
            ("Combat test", test_combat)
        ]
    }
}
