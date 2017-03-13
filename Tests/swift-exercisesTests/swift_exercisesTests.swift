import XCTest
@testable import swift_exercises

class swift_exercisesTests: XCTestCase
{
    func test_battle()
    {
        //XCTAssertEqual(typeModifier(attacking: Type.normal, defending: Type.normal), 1, "normal/normal should be 1")

        print("\n ======================================== Test ========================================\n")

        battle(trainers: &trainers)

        print("\n ======================================== Test ========================================\n")
    }

    static var allTests : [(String, (swift_exercisesTests) -> () throws -> Void)]
    {
        return [("Type/Battle", test_battle),]
    }
}
