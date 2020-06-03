const mariadb = require('./dbcon.js');

var numProds;
var prods;

mariadb.pool.query('SELECT * FROM productRetailer WHERE (url NOT LIKE "%upcitemdb%") AND (url NOT LIKE "%bestbuy%")', function(err, rows, fields){
  if (err) throw err;
  numProds = rows.length;
  prods = rows;
  getPrice(rows, 0);
});

function getPrice(rows, idx){
  if (idx != numProds){
    row = rows[idx];
    const PriceFinder = require('price-finder');
    const priceFinder = new PriceFinder();
    
    priceFinder.findItemPrice(row.url, function(err, price) {
      console.log(JSON.stringify(row));
      console.log(price);

      if (typeof price !== 'undefined' && price !== null && price != 0){
        mariadb.pool.query('UPDATE productRetailer SET price=? WHERE upc=? AND retailerID=?', [price, row.upc, row.retailerId], function(err, result){
          if(err) throw err;
        });
      }
    });

    let timeout = Math.floor(Math.random() * 10000);
    console.log(timeout);
    console.log('');

    setTimeout(() => {getPrice(rows, idx+1)}, timeout);
  }

  console.log("finished");
}

console.log("Update started...");