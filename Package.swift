// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "GNetwork",
    products: [
        .library(
            name: "GNetwork",
            targets: ["GNetwork"]),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.0.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.4")),
    ],
    targets: [
        .target(
            name: "GNetwork",
            dependencies: [
                "Alamofire", // Add Alamofire as a dependency for GNetwork
                .product(name: "Kingfisher", package: "Kingfisher")
            ]),
        .testTarget(
            name: "GNetworkTests",
            dependencies: ["GNetwork"]),
    ]
)
