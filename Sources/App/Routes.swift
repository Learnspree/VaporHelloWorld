import Vapor

extension Droplet {
    func setupRoutes() throws {


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

        get("person") { request in
            guard let name = request.data["name"]?.string,
            let city = request.data["city"]?.string else {
                throw Abort.badRequest
            }
 
            return try Response(status: .created, json: JSON(node: [
                "name": name,
                "city": city
            ]))
        }
        
        try resource("posts", PostController.self)
    }
}
