// swift-tools-version: 6.0

import PackageDescription

let sdkVersion = "9.14.0"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"

let facebookCSRAdapterChecksum = """
8138fb4572b0d69a4b9e88317baff57df5951c3c936646914a45510b45feafe0
"""

let package = Package(
    name: "ANFacebookCSRAdapter",
    
    defaultLocalization: "en",
    
    platforms: [
        .iOS(.v15)
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
            exact: "6.22.0"
        ),
        
        .package(
            url: "https://github.com/appnexus/mobile-sdk-ios-spm.git",
            exact: Version(stringLiteral: sdkVersion)
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
                ),
                
                .product(
                    name: "AppNexusSDK",
                    package: "mobile-sdk-ios-spm"
                )
            ]
        )
    ]
)
