// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Pitchy",
    products: [ .library(name: "Pitchy", targets: ["Pitchy"])],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", from: "4.0.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "9.1.0"),
    ],
    targets: [
        .target(name: "Pitchy", dependencies: [], path: "Source"),
        .testTarget(name: "PitchyTests", dependencies: ["Pitchy", "Quick", "Nimble"], path: "PitchyTests", exclude: ["iOS/Info.plist", "Mac/Info.plist"])
    ]
)
