import Vapor
import VaporSQLite

#if os(Linux)
import Glibc
#else
import Darwin
#endif

struct BlogHandler {

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

        finalDict["title"] = "Site Homepage"

        let imageNumber = Int(arc4random_uniform(25) + 1)
        finalDict["featuredImageURI"] = "/images/random/random-\(imageNumber).jpg"

        return finalDict
    }

}
