var express = require("express"),
    cookie = require("cookie-parser"),
    session = require("express-session"),
    bodyParser = require("body-parser"),
    ejs = require("ejs");

var app = express();

app.set("view engine", "ejs");

app.use(cookie());
app.use(session({secret: "sessionsecret512234"}));
app.use(bodyParser());

app.set("views", __dirname + "/templates");

app.use("/stylesheets", express.static(__dirname + "/assets/stylesheets"));
app.use("/scripts", express.static(__dirname + "/assets/scripts"));
app.use("/images", express.static(__dirname + "/assets/images"));

app.get("/", function(req, res) {
  req.session.user_id = 65332;
  res.send("Welcome to CorrelateMe!");

});

app.get("/template-test", function(req, res) {
  res.render("myview");
})

app.get("/signed-in", function(req, res) {
  if (req.session.user_id) {
    res.send("Logged in as " + req.session.user_id);
  } else {
    res.send("Not signed in.");
  }
});

app.listen(80);
console.log("Server running.");