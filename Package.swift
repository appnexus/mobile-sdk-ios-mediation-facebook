// swift-tools-version: 6.0

import PackageDescription

let sdkVersion = "9.15.0"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"

let facebookCSRAdapterChecksum = """
c3ce244fc2863e10089dafa6b8d922726f4e7ef9672022de8c8a4cad2d98478b
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
