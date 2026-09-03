// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-product-comparison",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Product Comparison",
            targets: ["Product Comparison"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-product.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-comparison.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Product Comparison",
            dependencies: [
                .product(name: "Product", package: "swift-product"),
                .product(name: "Comparison", package: "swift-comparison"),
            ]
        ),
        .testTarget(
            name: "Product Comparison Tests",
            dependencies: [
                "Product Comparison",
                .product(name: "Product", package: "swift-product"),
                .product(name: "Comparison", package: "swift-comparison"),
            ],
            path: "Tests/Product Comparison Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
