import PackageDescription

let package = Package(
  name: "DependencyInjectorObjectMapper",
  dependencies: [
    .Package(url: "https://github.com/Digipolitan/dependency-injector-swift.git", versions: Version(2, 0, 0)..<Version(3, 0, 0)),
    .Package(url: "https://github.com/Hearst-DD/ObjectMapper.git", versions: Version(2, 0, 0)..<Version(3, 0, 0))
  ],
  exclude: [
    "Tests",
    "Samples"
  ]
)
