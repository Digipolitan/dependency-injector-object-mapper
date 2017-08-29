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
            "addresses": [
                [
                    "street": "abc",
                    "zipCode": "75116",
                    "country": "France"
                ]
            ]
        ])
        XCTAssertNotNil(user?.addresses)
    }

    func testInitWithTransformer() {
        let injector = Injector.default
        let date = Date()
        let user = try? injector.inject(User.self, arguments: [
            "id": "1",
            "createdAt": date.timeIntervalSince1970
            ])
        XCTAssertEqual(user?.created?.timeIntervalSince1970, date.timeIntervalSince1970)
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
            "addresses": [
                dict
            ]
        ])
        guard let addresses = user?.addresses else {
            XCTFail("The dictionary cannot be nil")
            return
        }
        XCTAssertEqual(addresses[0].street, "abc")
    }
}
