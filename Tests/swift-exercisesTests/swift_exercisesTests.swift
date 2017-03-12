import XCTest
@testable import swift_exercises

class swift_exercisesTests: XCTestCase {

    func run_battle() {
        let trainer1 = Trainer(pokemons: [hooh, hooh, hooh, hooh, hooh], human: false);
        let trainer2 = Trainer(pokemons: [hooh, hooh, hooh, hooh, hooh], human: false);

        let state = battle_init(trainers: [trainer1, trainer2]);

        let state2 = battle(state: state);

        print("And the winner is... player ", state2.winner!, "!!!!!!");

        XCTAssertEqual(typeModifier(attacking: Type.normal, defending: Type.normal), 1, "normal/normal should be 1")
    }

    static var allTests : [(String, (swift_exercisesTests) -> () throws -> Void)] {
        return [
            ("Run a battle", run_battle),
        ]
    }
}
