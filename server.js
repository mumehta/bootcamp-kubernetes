var express = require('express');

// Constants
var PORT = 3000;

// App
var app = express();
app.get('/', function (req, res){
  res.send('TEST');
});

app.get('/kogulan', function (req, res){
  res.json({"status":"happy as a hippo"});
});

app.listen(PORT);
console.log('APP Running on http://localhost:' + PORT);
