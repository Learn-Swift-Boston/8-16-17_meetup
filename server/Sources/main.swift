import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

let server = HTTPServer()
server.serverPort = 8080

func getSchedule(request: HTTPRequest, response: HTTPResponse) {
	response.setBody(string: "{\"schedule\": [ {\"startTime\": \"6:30pm\", \"event\": \"Networking\"}, {\"startTime\": \"7:00pm\", \"event\": \"Introductions\"}, {\"startTime\": \"7:15pm\", \"event\": \"Open Floor Q&A\"}, {\"startTime\": \"7:30pm\", \"event\": \"Group Breakout\"}]}")
	.completed()
}

var routes = Routes()
routes.add(method: .get, uri: "schedule", handler: getSchedule)

server.addRoutes(routes)

do {
	try server.start()
} catch PerfectError.networkError(let err, let msg) {
	print(err)
}
