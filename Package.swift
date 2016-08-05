import PackageDescription

let package = Package(
    name: "VaporPress",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 0, minor: 16),
		.Package(url: "https://github.com/vapor/mustache-provider.git", majorVersion: 0, minor: 0),
    ],
    exclude: [
	    "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
		"Tests",
    ]
)
