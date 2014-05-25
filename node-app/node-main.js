var express = require("express"),
    cookie = require("cookie-parser"),
    session = require("express-session"),
    bodyParser = require("body-parser"),
    ejs = require("ejs"),
    underscore = require("underscore"),
    path = require("path");

var app = express();

app.set("view engine", "ejs");

app.use(cookie());
app.use(session({secret: "sessionsecret512234"}));
app.use(bodyParser());

app.use('/public', express.static(path.join(__dirname, 'vendor/thoughtbrain')));

app.set("views", __dirname + "/templates");

app.use("/stylesheets", express.static(path.join(__dirname, "assets/stylesheets")));
app.use("/scripts", express.static(path.join(__dirname, "assets/scripts")));
app.use("/images", express.static(path.join(__dirname, "assets/images")));

app.get("/", function(req, res) {
  res.render("index");
});

app.get("/about", function(req, res) {
  res.render("about");
});

app.get("/sign-up", function(req, res) {
  res.render("sign-up");
});

app.get("/sign-in", function(req, res) {
  res.render("sign-in");
});

app.get("/template-test", function(req, res) {
  res.render("myview");
});

app.post("/perform-sign-up", function(req, res) {
  console.log("performing sign up!");
});

app.get("/signed-in", function(req, res) {
  if (req.session.user_id) {
    res.send("Logged in as " + req.session.user_id);
  } else {
    res.send("Not signed in.");
  }
});

app.listen(80);
console.log("Server running.");
