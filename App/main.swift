import Vapor
import HTTP

let drop = Droplet()

drop.get("/") { request in
    let header = CommonHandler().getHeader()
    let footer = CommonHandler().getFooter()
    let pageContent = IndexHandler().loadPageContent()
    let fullPage = header + footer + pageContent

    return Response(status: .ok, body: fullPage)
}

drop.get("blog") { request in
    let header = CommonHandler().getHeader()
    let footer = CommonHandler().getFooter()
    let pageContent = BlogHandler().loadPageContent()
    let fullPage = header + footer + pageContent

    return Response(status: .ok, body: fullPage)
}

let port = drop.config["app", "port", "host"].int ?? 80

// Print what link to visit for default port
print("Visit http://localhost:\(port)")
drop.serve()
