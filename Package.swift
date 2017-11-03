import PackageDescription

let package = Package(
  name: "DependencyInjectorObjectMapper",
  dependencies: [
    .package(url: "https://github.com/Digipolitan/dependency-injector.git", from: "2.0.0"),
    .package(url: "https://github.com/Hearst-DD/ObjectMapper.git", from: "3.0.0")
  ],
  exclude: [
    "Tests",
    "Samples"
  ]
)
