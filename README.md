DependencyInjector+ObjectMapper
=================================

[![Swift Version](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Build Status](https://travis-ci.org/Digipolitan/dependency-injector-object-mapper.svg?branch=master)](https://travis-ci.org/Digipolitan/dependency-injector-object-mapper)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/DependencyInjectorObjectMapper.svg)](https://img.shields.io/cocoapods/v/DependencyInjectorObjectMapper.svg)
[![Carthage Compatible](https://img.shields.io/badge/carthage-compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Swift Package Manager Compatible](https://img.shields.io/badge/swift%20package%20manager-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager/)
[![Platform](https://img.shields.io/cocoapods/p/DependencyInjectorObjectMapper.svg?style=flat)](http://cocoadocs.org/docsets/DependencyInjectorObjectMapper)
[![Twitter](https://img.shields.io/badge/twitter-@Digipolitan-blue.svg?style=flat)](http://twitter.com/Digipolitan)

Dependency injector Swift compatible with ObjectMapper

## Installation

### CocoaPods

To install DependencyInjector+ObjectMapper with CocoaPods, add the following lines to your `Podfile`.

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

pod 'DependencyInjectorObjectMapper'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate DependencyInjector+ObjectMapper into your Xcode project using Carthage, specify it in your `Cartfile`:

```
github 'Digipolitan/dependency-injector-object-mapper' ~> 1.0
```

Run `carthage update` to build the framework and drag the built `DependencyInjectorObjectMapper.framework` into your Xcode project.

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding DependencyInjector+ObjectMapper as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/Digipolitan/dependency-injector-object-mapper.git", from: "1.0.0")
]
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
        self.created <- (map["createdAt"], DateTransform())
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
