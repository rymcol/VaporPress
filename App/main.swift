import Vapor
import VaporMustache


/*
    Includes are relative to the Views (`Resources/Views`)
    directory by default.
*/
let mustache = VaporMustache.Provider(withIncludes: [
        "header": "Includes/header.mustache",
        "footer": "Includes/footer.mustache"
    ])
])

let workDir: String?
#if Xcode
    let parent = #file.characters.split(separator: "/").map(String.init).dropLast().joined(separator: "/")
    workDir = "/\(parent)/.."
#else
    workDir = nil
#endif

let drop = Droplet(workDir: workDir, providers: [mustache])

drop.get("/") { request in
    return try app.view("index.mustache", context: [
        "greeting": "Hello, world!"
    ])
}

drop.get("blog") { request in
    return try app.view("index.mustache", context: [
        "greeting": "Hello, world!"
    ])
}

drop.get("admin/post") { request in
    return try app.view("index.mustache", context: [
        "greeting": "Hello, world!"
    ])
}

let port = drop.config["app", "port"].int ?? 80

// Print what link to visit for default port
print("Visit http://localhost:\(port)")
app.start()
