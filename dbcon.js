//This database connection is used to fetch the data requested by a user of the app.
//The database user must have SELECT privileges on all tables.
var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : '*******',
  user            : '*******',
  password        : '*******',
  database        : '*******',
});

module.exports.pool = pool;
