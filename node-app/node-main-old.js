// Required packages:
var http = require("http");
var mysql = require("mysql");
var cookie = require("cookie-parser");
var express = require("express");
var session = require("express-session");
var mysqlStore = require("connect-mysql")(session);

var app = express();

// Network config object:
var server_config = {
	address: "127.0.0.1",
	port: "80"
};

var server = http.createServer();

var settings = require("./settings/settings.json");
app.set('views', __dirname + '/templates');

app.use(cookie());

app.use(session({ secret: settings['session secret'],
	name: 'sid',
	cookie: { secure: true },
	store: sessionStore
}));

// Server initialization:
/*function (req, res) {
    res.writeHead(200, {"Content-Type": "text/plain"});
    res.end("Hello Node.js\n");
}).listen(server_config.port, server_config.address);*/

console.log("Server running at http://" + server_config.address + ":" + server_config.port + "/");
