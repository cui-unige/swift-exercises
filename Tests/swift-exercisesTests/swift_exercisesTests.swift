import XCTest
import Glibc
import Foundation

@testable import swift_exercises

class swift_exercisesTests: XCTestCase {

    func test_typeModifier() {
        XCTAssertEqual(typeModifier(attacking: Type.normal, defending: Type.normal), 1, "normal/normal should be 1")
        //print("REGARDE ICI =",Int(arc4random()%100))
        //
        print("REGARDE ICI PATATE")
        print(randomNumber(min: 85, max: 100))
    }

    static var allTests : [(String, (swift_exercisesTests) -> () throws -> Void)] {
        return [
            ("Type/Type modifiers", test_typeModifier),
        ]
    }
}
