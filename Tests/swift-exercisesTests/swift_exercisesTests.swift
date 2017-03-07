import XCTest
@testable import swift_exercises

class swift_exercisesTests: XCTestCase {

    func test_typeModifier() {
        let trainer1 = Trainer(pokemons: [hooh], human: false);
        let trainer2 = Trainer(pokemons: [hooh], human: false);
        var state = battle_init(trainers: [trainer1, trainer2]);
        print("AND THEN THERE WERE NONE");
        let state2 = battle(state: state);
        if(state.winner == nil) {print("LOOOOOOOOL");}
        print(state.trainers[0].pokemons[0].nickname!);

        XCTAssertEqual(typeModifier(attacking: Type.normal, defending: Type.normal), 1, "normal/normal should be 1")
    }

    static var allTests : [(String, (swift_exercisesTests) -> () throws -> Void)] {
        return [
            ("Type/Type modifiers", test_typeModifier),
        ]
    }
}
