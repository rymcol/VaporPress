import Vapor

#if os(Linux)
import Glibc
#else
import Darwin
#endif

struct IndexHandler {

    func gatherContent() -> [String: Any] {

        var post = "No Content Was Found"

        let randomContent = ContentGenerator().generate()
        if let randomVal = randomContent["Test Post 1"] {
            post = randomVal as! String
        }
        let imageNumber = Int(arc4random_uniform(25) + 1)

        return [
            "post_content": "\(post)",
            "post_title": "Test Post 1",
            "featuredImageURI": "/images/random/random-\(imageNumber).jpg",
            "featuredImageAltText": "Demo Image \(imageNumber)",
            "title": "VaporPress | Home"
        ]
    }

}
