import Vapor
import VaporSQLite

#if os(Linux)
import Glibc
#else
import Darwin
#endif

struct Poster {

    func postContent(title: String, content: String, makeFrontPage: Bool) {

        do {

            let sqlite = try! VaporSQLite.Provider(path: "./resources/db/data.sqlite")
            try sqlite.driver.raw("INSERT INTO posts (post_title, post_content) VALUES (?1,?2)", values: [title, content])

        } catch {
            print("sqlite Erros Occured")
        }

    }

}

struct NewPostHandler {

    func gatherContent() -> [String: Any] {

        var finalDict = [String: Any]()

        do {

            let sqlite = try! VaporSQLite.Provider(path: "./resources/db/data.sqlite")
            let results = try sqlite.driver.raw("SELECT post_content, post_title FROM posts WHERE id=(SELECT value FROM options WHERE option = 'front_page')")

            for (key, value) in results[0] {
                finalDict[key] = value
            }

        } catch {
            print("sqlite Erros Occured")
        }

        finalDict["title"] = "Add New Post"

        let imageNumber = Int(arc4random_uniform(25) + 1)
        finalDict["featuredImageURI"] = "/images/random/random-\(imageNumber).jpg"

        return finalDict
    }

}
