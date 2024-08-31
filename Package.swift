// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GAppSettings",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "GAppSettings",
            targets: ["GAppSettings"]),
    ],
    dependencies: [
        // Add any package dependencies here if needed.
    ],
    targets: [
        .target(
            name: "GAppSettings",
            dependencies: [],
            path: "Sources"), // Ensure you specify the correct path to your sources if needed.
        .testTarget(
            name: "GAppSettingsTests",
            dependencies: ["GAppSettings"],
            path: "Tests") // Ensure you specify the correct path to your tests if needed.
    ]
)
