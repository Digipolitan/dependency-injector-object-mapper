DependencyInjector+ObjectMapper
=================================

[![Build Status](https://travis-ci.org/Digipolitan/dependency-injector-object-mapper-swift.svg?branch=master)](https://travis-ci.org/Digipolitan/dependency-injector-object-mapper-swift)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/DependencyInjector_ObjectMapper.svg)](https://img.shields.io/cocoapods/v/DependencyInjector_ObjectMapper.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/DependencyInjector_ObjectMapper.svg?style=flat)](http://cocoadocs.org/docsets/DependencyInjector_ObjectMapper)
[![Twitter](https://img.shields.io/badge/twitter-@Digipolitan-blue.svg?style=flat)](http://twitter.com/Digipolitan)

Dependency injector Swift compatible with ObjectMapper

## Installation

### CocoaPods

To install DependencyInjectorObjectMapper with CocoaPods, add the following lines to your `Podfile`.

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0' # or platform :osx, '10.10' if your target is OS X.
use_frameworks!

pod 'DependencyInjectorObjectMapper'
```

## How to use ?

First you must create your models conforms to BaseMappable protocol

```swift
public protocol User: BaseMappable {
    var id: String { get set }
    var created: Date? { get set }
    var address: Address { get set }
}

public protocol Address: BaseMappable {
    var street: String { get set }
    var zipCode: String { get set }
    var country: String { get set }
}
```

After that, create the real implementation conforms to Mappable protocol foreach models

```swift
class UserModel: User, Mappable {
    public var id: String
    public var created: Date?
    public var address: Address

    public init(id: String, address: Address) {
        self.id = id
        self.address = address
    }

    public convenience required init?(map: Map) {
        guard
            let id: String = try? map.value("id"),
            let address: Address = try? map.injectedValue("address", type: Address.self) else {
                return nil
        }
        self.init(id: id, address: address)
    }

    public func mapping(map: Map) {
        self.id >>> map["id"]
        self.created <- map["createdAt"]
        self.address >>> map.inject("address", type: Address.self)
    }
}

class AddressModel: Address, Mappable {
    public var street: String
    public var zipCode: String
    public var country: String

    public init(street: String, zipCode: String, country: String) {
        self.street = street
        self.zipCode = zipCode
        self.country = country
    }

    public convenience required init?(map: Map) {
        guard let street: String = try? map.value("street"), let zipCode: String = try? map.value("zipCode"), let country: String = try? map.value("country") else {
            return nil
        }
        self.init(street: street, zipCode: zipCode, country: country)
    }

    public func mapping(map: Map) {
        self.street >>> map["street"]
        self.zipCode >>> map["zipCode"]
        self.country >>> map["country"]
    }
}
```

* For nonnull property set the value inside the initializer

* To inject a custom implementation use **map.injectedValue** during the init process, or **map.inject** in the mapping function

After that, you must register implementation inside a module and push the module inside an injector

```swift
class DefaultModule: Module {

    override init() {
        super.init()
        self.bind(User.self).to(UserModel.self)
        self.bind(Address.self).to(AddressModel.self)
    }
}
Injector.default.register(module: DefaultModule(), with: "default")
```

Finally, inject the User model as follow

```swift
let user = try? Injector.default.inject(User.self, arguments: [
    "id": "1",
    "address": [
        "street": "abc",
        "zipCode": "75116",
        "country": "France"
    ]
])
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details!

This project adheres to the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code. Please report
unacceptable behavior to [contact@digipolitan.com](mailto:contact@digipolitan.com).

## License

DependencyInjector+ObjectMapper is licensed under the [BSD 3-Clause license](LICENSE).
