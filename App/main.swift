import Vapor
import VaporMustache


/*
    Includes are relative to the Views (`Resources/Views`)
    directory by default.
*/
let app = Application(providers: [
    VaporMustache.Provider(withIncludes: [
        "header": "Includes/header.mustache",
        "footer": "Includes/footer.mustache"
    ])
])

app.get("/") { request in
    return try app.view("template.mustache", context: [
        "greeting": "Hello, world!"
    ])
}

let port = app.config["app", "port"].int ?? 80

// Print what link to visit for default port
print("Visit http://localhost:\(port)")
app.start()
