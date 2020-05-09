var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'price-aggregator-backend.coxajyvhvlmg.us-east-1.rds.amazonaws.com',
  user            : 'front_end_query_user',
  password        : 'standardmisplaceobjectivebishop',
  database        : 'common_cents'
});

module.exports.pool = pool;
