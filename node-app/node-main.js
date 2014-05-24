// Required packages:
var http = require("http");
var mysql = require("mysql");

// Network config object:
var server_config = {
	address: "127.0.0.1",
	port: "80"
};

// Server initialization:
http.createServer(function (req, res) {
    res.writeHead(200, {"Content-Type": "text/plain"});
    res.end("Hello Node.js\n");
}).listen(server_config.port, server_config.address);
console.log("Server running at http://" + server_config.address + ":" + server_config.port + "/");
