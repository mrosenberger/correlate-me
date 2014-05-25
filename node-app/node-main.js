var express = require("express"),
    cookie = require("cookie-parser"),
    session = require("express-session");

var app = express();

app.use(cookie());
app.use(session({secret: "sessionsecret512234"}));

app.use("/stylesheets", express.static(__dirname + "/assets/stylesheets"));
app.use("/scripts", express.static(__dirname + "/scripts/scripts"));
app.use("/images", express.static(__dirname + "/assets/images"));

app.get("/", function(req, res) {
  res.send("Welcome to CorrelateMe!");
});

app.listen(80);
