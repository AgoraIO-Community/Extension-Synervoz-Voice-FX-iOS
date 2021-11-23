// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VoiceFiltersAgoraExtension",
    defaultLocalization: "en",
    platforms: [.iOS(.v8)],
    products: [
        .library(
            name: "VoiceFiltersAgoraExtension",
            targets: ["VoiceFiltersAgoraExtension"]
        )
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "VoiceFiltersAgoraExtension",
            url: "https://github.com/AgoraIO-Community/Extension-Synervoz-Voice-FX-iOS/releases/download/0.0.1/VoiceFiltersAgoraExtension.xcframework.zip",
            checksum: "f0044f7cad3efe253811b3c4aa87f223c31027d88a5cc7253ae48c16bbb24e7c"
        )
    ]
)
