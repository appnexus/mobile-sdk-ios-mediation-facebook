// swift-tools-version: 6.0

import PackageDescription

let sdkVersion = "9.12.2"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"

let facebookCSRAdapterChecksum = """
d44a99fae50f28115555f47788281824a845379cd98900b51c47bbf02ccc09af
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
