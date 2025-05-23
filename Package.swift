// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Swiftlings",
  platforms: [
    .macOS(.v13)
  ],
  products: [
    .library(
      name: "Swiftlings",
      targets: ["Exercises"]),
    .executable(
      name: "swiftlings",
      targets: ["SwiftlingsCLI"]),
  ],
  targets: [
    .target(
      name: "Exercises"),
    .executableTarget(
      name: "SwiftlingsCLI",
      dependencies: []),
    .testTarget(
      name: "TestsForExercises",
      dependencies: ["Exercises"],
      swiftSettings: [
        .define("TESTING", .when(configuration: .debug))
      ]
    ),
  ]
)
