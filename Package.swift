// swift-tools-version:5.3
//
// Copyright (c) 2023 DEPT Digital Products, Inc.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import PackageDescription

let package = Package(
    name: "ReducerArchitecture",
    platforms: [
        .macOS(.v11), .iOS(.v14), .tvOS(.v14)
    ],
    products: [
        .library(
            name: "ReducerArchitecture",
            targets: ["ReducerArchitecture"]
        )
    ],
    dependencies: [
        .package(name: "CombineEx", url: "https://github.com/RocketLaunchpad/CombineEx.git", .branch("main"))
    ],
    targets: [
        .target(
            name: "ReducerArchitecture",
            dependencies: ["CombineEx"],
            swiftSettings: [.unsafeFlags([
                "-Xfrontend",
                "-warn-long-function-bodies=100",
                "-Xfrontend",
                "-warn-long-expression-type-checking=100"
            ])]
        )
    ]
)
