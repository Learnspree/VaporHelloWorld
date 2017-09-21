import Vapor

extension Droplet {
    func setupRoutes() throws {

        // NEXT - see steps in https://www.twilio.com/blog/2016/10/getting-started-with-the-vapor-swift-web-framework.html HELLO VAPOR section

        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }

        get("plaintext") { req in
            return "Hello, world!"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)
    }
}
