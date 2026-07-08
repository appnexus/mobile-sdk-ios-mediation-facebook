// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

let sdkVersion = "9.12.1"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"
let facebookCSRAdapterChecksum = """
b6d4245879b69ee0e3fca7bbe30c52fb63178cd49b0e4a5f0b79317ca49a1fd7
"""

let package = Package(
    name: "ANFacebookCSRAdapter",
    
    defaultLocalization: "en",
    
    platforms: [
        .iOS(.v12)
    ],
    
    products: [
        .library(
            name: "ANFacebookCSRAdapter",
            targets: [
                "ANFacebookCSRAdapter",
                "ANFacebookCSRAdapterDependencies"
            ]
        )
    ],
    
    dependencies: [
        .package(
            url: "https://github.com/facebook/FBAudienceNetwork",
            exact: "6.21.1"
        )
    ],
    
    targets: [
        .binaryTarget(
            name: "ANFacebookCSRAdapter",
            url: "\(baseUrl)/\(sdkVersion)/static/ANFacebookCSRAdapter.zip",
            checksum: facebookCSRAdapterChecksum
        ),

        .target(
            name: "ANFacebookCSRAdapterDependencies",
            dependencies: [
                .product(
                    name: "FBAudienceNetwork",
                    package: "FBAudienceNetwork"
                )
            ]
        )
    ]
)
