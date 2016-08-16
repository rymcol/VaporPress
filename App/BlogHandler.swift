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

        for _ in 1...5 {
            let randomContent = ContentGenerator().generate()
            let index: Int = Int(arc4random_uniform(UInt32(randomContent.count)))
            let value = Array(randomContent.values)[index]
            let imageNumber = Int(arc4random_uniform(25) + 1)
            content.append(["post_title": "Test Post \(index)", "post_content": value, "featuredImageURI": "/images/random/random-\(imageNumber).jpg", "featuredImageAltText": "Demo Image \(imageNumber)"])
        }

        finalDict["title"] = "VaporPress | Blog"
        finalDict["content"] = content

        return finalDict
    }

}
