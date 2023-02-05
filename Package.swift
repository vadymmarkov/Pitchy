// swift-tools-version:5.5.0

import PackageDescription

let package = Package(
  name: "Pitchy",
  products: [
    .library(name: "Pitchy", targets: ["Pitchy"])
  ],
  dependencies: [
    .package(url: "https://github.com/Quick/Quick", from: "6.1.0"),
    .package(url: "https://github.com/Quick/Nimble", from: "11.2.1"),
  ],
  targets: [
    .target(name: "Pitchy", dependencies: [], path: "Source"),
    .testTarget(
      name: "PitchyTests",
      dependencies: ["Pitchy", "Quick", "Nimble"],
      path: "PitchyTests",
      exclude: [ "Mac/Info.plist", "iOS/Info.plist" ]
    ),
  ]
)
