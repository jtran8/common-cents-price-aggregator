// Require neccessary packages
var express = require('express');
var mysql = require('./dbcon.js');

// Set up express
var app = express();
app.set('mysql', mysql);

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

// Set up paths
app.use('/static', express.static('public'));
app.use('/filters', require('./filters.js'));
app.use('/results', require('./results.js'));
app.use('/', express.static('public'));

// Set up error-handling
app.use(function(req,res){
  res.status(404);
  res.render('404');
});

app.use(function(err, req, res, next){
  console.error(err.stack);
  res.status(500);
  res.render('500');
});

app.listen(process.env.PORT || 3000, 
	() => console.log("Server is running..."));
