// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "bazel_rbe_symlink_bug",
  dependencies: [
    .package(url: "https://github.com/pinterest/PINOperation", exact: "3.0.4"),
  ]
)
