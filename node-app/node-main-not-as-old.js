
var 
  fs = require('fs'),
  http = require('http'),
  express = require('express'),
  cookie = require('cookie-parser'),
  session = require('express-session'),
  MysqlStore = require('connect-mongo')(session);

var settings = require("./settings/default.json");

var app = express();
var server = http.createServer(app);

app.set('views', __dirname + '/templates');

var sessionStore = new MysqlStore({
  db: {
    "user": "root",
    "password": "glider1651618",
    "db": "correlateme"
  }
});

//app.use(express.logger());
app.use(cookie());
app.use(session({ 
    secret: settings.session_secret,
    name: 'sid',
    cookie: { secure: true },
    store: sessionStore
}));

app.use('/stylesheets', express.static(__dirname + '/assets/stylesheets'));
app.use('/scripts', express.static(__dirname + '/scripts/scripts'));
app.use('/images', express.static(__dirname + '/assets/images'));

app.get('/', function mainPage(req, res)
  { res.render('index.jade', function (err, html)
    { if (err)
      throw err;
      else
        res.send(html);
    });
});

server.listen(process.env.PORT || settings['port']);