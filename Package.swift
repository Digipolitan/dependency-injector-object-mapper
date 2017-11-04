// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "DependencyInjectorObjectMapper",
    products: [
        .library(name: "DependencyInjectorObjectMapper", targets: ["DependencyInjectorObjectMapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/Digipolitan/dependency-injector.git", from: "2.0.0"),
        .package(url: "https://github.com/Hearst-DD/ObjectMapper.git", from: "3.0.0")
    ],
    targets: [
        .target(
            name: "DependencyInjectorObjectMapper",
            dependencies: [
                "DependencyInjector",
                "ObjectMapper"
            ]
        ),
        .testTarget(
            name: "DependencyInjectorObjectMapperTests",
            dependencies: [
                "DependencyInjectorObjectMapper"
            ]
        )
    ]
)
