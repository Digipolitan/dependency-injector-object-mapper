import XCTest
@testable import DependencyInjectorObjectMapper
import DependencyInjector

class DependencyInjectorObjectMapperTests: XCTestCase {

    override func setUp() {
        super.setUp()
        let injector = Injector.default
        injector.register(module: DefaultModule(), with: "default")
    }

    override func tearDown() {
        super.tearDown()
    }

    func testInjectNestedObject() {
        let injector = Injector.default
        let user = try? injector.inject(User.self, arguments: [
            "id": "1",
            "address": [
                "street": "abc",
                "zipCode": "75116",
                "country": "France"
            ]
        ])
        XCTAssertNotNil(user?.address)
    }

    func testReverseTransformInjectNestedObject() {
        let injector = Injector.default
        let dict: [String: Any] = [
            "street": "abc",
            "zipCode": "75116",
            "country": "France"
        ]
        let user = try? injector.inject(User.self, arguments: [
            "id": "1",
            "address": dict
        ])
        guard let trans = user?.address.toJSON() else {
            XCTFail("The dictionary cannot be nil")
            return
        }
        XCTAssertEqual(trans.map { $0.key }, dict.map { $0.key })
    }
}
