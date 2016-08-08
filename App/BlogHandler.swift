import Vapor

#if os(Linux)
import Glibc
#else
import Darwin
#endif

struct BlogHandler {

    func gatherContent() -> [String: Any] {

        var content = [[String:Any]]()
        var finalDict = [String: Any]()

        // do {
        //
        //     let sqlite = try! VaporSQLite.Provider(path: "./resources/db/data.sqlite")
        //     var results = try sqlite.driver.raw("SELECT post_content, post_title FROM posts ORDER BY id DESC LIMIT 5 OFFSET ?1", values: [0])
        //
        //     finalDict["content"] = results
        //     finalDict["contentCount"] = results.count
        //
        // } catch {
        //     print("sqlite Erros Occured")
        // }

        for _ in 1...5 {
            let randomContent = ContentGenerator().generate()
            let index: Int = Int(arc4random_uniform(UInt32(randomContent.count)))
            let value = Array(randomContent.values)[index]
            let imageNumber = Int(arc4random_uniform(25) + 1)
            content.append(["post_title": "Test Post \(index)", "post_content": value, "featuredImageURI": "/images/random/random-\(imageNumber).jpg", "featuredImageAltText": "Demo Image \(imageNumber)"])
        }

        finalDict["title"] = "VaporPress | Blog"

        // let imageNumber = Int(arc4random_uniform(25) + 1)
        // finalDict["featuredImageURI"] = "/images/random/random-\(imageNumber).jpg"
        finalDict["content"] = content

        return finalDict
    }

}
