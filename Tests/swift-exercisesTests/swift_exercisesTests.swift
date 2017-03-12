import XCTest
@testable import swift_exercises

class swift_exercisesTests: XCTestCase {

    func test_typeModifier() {
        XCTAssertEqual(typeModifier(attacking: Type.fighting, defending: Type.ice), 2, "fighting -> ice should be 2")
		XCTAssertEqual(typeModifier(attacking: Type.normal, defending: Type.normal), 1, "normal -> normal should be 1")
    }

    static var allTests : [(String, (swift_exercisesTests) -> () throws -> Void)] {
        return [
            ("Type/Type modifiers", test_typeModifier),
        ]
    }
}
