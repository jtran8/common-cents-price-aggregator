var mariadb = require('mariadb/callback');
var pool = mariadb.createPool({
  connectionLimit : 10,
  host            : '******************',
  user            : '******************',
  password        : '******************',
  database        : '******************'
});

module.exports.pool = pool;