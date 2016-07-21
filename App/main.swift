import Vapor
import VaporMustache
import VaporSQLite
/*
    Includes are relative to the Views (`Resources/Views`)
    directory by default.
*/
let mustache = VaporMustache.Provider(withIncludes: [
        "header": "Includes/header.mustache",
        "footer": "Includes/footer.mustache"
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
    return try drop.view("index.mustache", context: IndexHandler().gatherContent())
}

drop.get("blog") { request in
    return try drop.view("blog.mustache", context: [
        "postTitle": "Hello, world!"
    ])
}

drop.get("admin/post") { request in
    return try drop.view("post-new.mustache", context: [
        "greeting": "Hello, world!"
    ])
}

let port = drop.config["app", "port", "host"].int ?? 80

// Print what link to visit for default port
print("Visit http://localhost:\(port)")
drop.serve()
