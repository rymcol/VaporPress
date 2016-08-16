import Vapor
import VaporMustache

let mustache = VaporMustache.Provider(withIncludes: [
        "header": "Includes/header.mustache",
        "footer": "Includes/footer.mustache"
    ])

let drop = Droplet(initializedProviders: [mustache])

drop.get("/") { request in
    return try drop.view("index.mustache", context: IndexHandler().gatherContent())
}

drop.get("blog") { request in
    return try drop.view("blog.mustache", context: BlogHandler().gatherContent())
}

let port = drop.config["app", "port", "host"].int ?? 80

// Print what link to visit for default port
print("Visit http://localhost:\(port)")
drop.serve()
