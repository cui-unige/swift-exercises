import XCTest
@testable import swift_exercises

class swift_exercisesTests: XCTestCase {

    func test_typeModifier() {
        XCTAssertEqual(typeModifier(attacking: Type.normal, defending: Type.normal), 1, "normal/normal should be 1")
        battle()
        print("Successfully Ended")
    }

    static var allTests : [(String, (swift_exercisesTests) -> () throws -> Void)] {
	  print("oklm bb\n")
      return [
            ("Type/Type modifiers", test_typeModifier),
        ]
    }



}
