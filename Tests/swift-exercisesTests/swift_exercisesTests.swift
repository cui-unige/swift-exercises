import XCTest
@testable import swift_exercises

class swift_exercisesTests: XCTestCase {
  
    func test_typeModifier() {
        
        print("\n ######################## \n")
        print("\nPokemon v1. Giovanna Théo.")
        print("You play the role of Bob. You can select your Pokemon and your moves")
        print("Some moves can change the weather.")
        print("Your opponent is Alice. Her pokemons and their moves are selected randomly.")
        print("Moves have powerpoints decreasing of 1 each time they're being used.")
        print("When a move does not have PP anymore, it is removed from the available choices.")
        print("You can leave a battle or change your Pokemon within a battle.\n")
        go();
        
    }

    static var allTests : [(String, (swift_exercisesTests) -> () throws -> Void)] {
        return [
            ("Type/Type modifiers", test_typeModifier),
        ]
    }
    
}
