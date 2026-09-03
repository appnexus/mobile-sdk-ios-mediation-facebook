// swift-tools-version: 6.0

import PackageDescription

let sdkVersion = "9.14.1-beta"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"

let facebookCSRAdapterChecksum = """
9a8161fa62925cacca3f4857f64f16a5363a716366f2b1adbfc21342146bbd4e
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
