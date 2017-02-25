import XCTest
@testable import swift_exercises

class swift_exercisesTests: XCTestCase {

    func test_typeModifier() {
        XCTAssertEqual(typeModifier(attacking: Type.fighting, defending: (Type.rock, Type.ice)), 4, "fighting -> rock/ice should be 4")
    }

    static var allTests : [(String, (swift_exercisesTests) -> () throws -> Void)] {
        return [
            ("Type/Type modifiers", test_typeModifier),
        ]
    }
}
