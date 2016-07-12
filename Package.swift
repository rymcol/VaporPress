import PackageDescription

let package = Package(
    name: "VaporApp",
    dependencies: [
        .Package(url: "https://github.com/qutheory/vapor-sqlite.git", versions: Version(0,0,0)..<Version(10,0,0)),
		.Package(url: "https://github.com/qutheory/vapor-mustache.git", majorVersion: 0, minor: 9),
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
