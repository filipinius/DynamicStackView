// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DynamicStackView",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "DynamicStackView",
            targets: ["DynamicStackView"]),
    ],
    targets: [
        .target(
            name: "DynamicStackView"),
    ]
)
