const express = require('express');
const mariadb = require('./dbcon.js');
const app = express();
const port = 19829;

/*mariadb.pool.query('SELECT * FROM productRetailer WHERE upc=3', function(err, rows, fields){
  if (err) throw err;
  console.log(rows.length === 0);
});*/

mariadb.pool.query('SELECT upc FROM product', function(err, rows, fields){
  if (err) throw err;
  updateItem(rows[3].upc);
});

function insertUpdateProductRetailer(upc, sellerId, link, price){
  //console.log(upc + ' ' + sellerId);
  mariadb.pool.query('SELECT * FROM productRetailer WHERE upc=? AND retailerId=?', [upc, sellerId], function(err, rows, fields){
    if (rows.length === 0){
      mariadb.pool.query('INSERT INTO productRetailer (`upc`, `retailerId`, `price`, `url`) VALUES (?, ?, ?, ?)', [upc, sellerId, price, link], function(err, result){
        if (err) throw err;
      });
    }
    else if (rows.length == 1){
      mariadb.pool.query('UPDATE productRetailer SET `price`=?, `url`=? WHERE `upc`=? AND `retailerId`=?', [price, link, upc, sellerId], function(err, result){
        if (err) throw err;
      });
    }
  });
}

function updateItem(upc){
  const https = require('https');
  const options = {
    hostname: 'api.upcitemdb.com',
    path: '/prod/trial/lookup?upc=' + upc,
    method: 'GET'
  }

  const req = https.request(options, res => {
      console.log(`statusCode: ${res.statusCode}`)
      let response = "";
      res.on('data', d => {
        response += d;
      })

      res.on("end", () => {
        try {
            let item_results = JSON.parse(response);
            for (let i=0; i < item_results.items[0].offers.length; i++){
              let seller = item_results.items[0].offers[i];
              let sellerId;
              mariadb.pool.query('SELECT * FROM retailer WHERE name=?', [seller.merchant], function(err, rows, fields){
                if (rows.length === 0){
                  mariadb.pool.query('INSERT INTO retailer (`name`) VALUES (?)', [seller.merchant], function(err, result){
                    if (err) throw err;
                    sellerId = result.insertId;
                    insertUpdateProductRetailer(upc, result.insertId, seller.link, seller.price);
                  });
                }
                else if (rows.length == 1){
                  sellerId = rows[0].retailerId;
                  insertUpdateProductRetailer(upc, rows[0].retailerId, seller.link, seller.price);
                }
              });
            }
        } catch (error) {
            console.error(error.message);
        };
      });
    })
    
    req.on('error', error => {
      console.error(error)
    })
    
    req.end()
}

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))