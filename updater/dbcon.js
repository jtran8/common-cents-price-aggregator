//This database connection is used to update the stored product data.
//The database user must have at least SELECT, INSERT, and UPDATE privileges on all tables.
var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : '*******',
  user            : '*******',
  password        : '*******',
  database        : '*******',
});

module.exports.pool = pool;
