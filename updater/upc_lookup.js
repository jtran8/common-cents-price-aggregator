const mariadb = require('./dbcon.js');

var numProds;
var prods;
var idx;

mariadb.pool.query('SELECT upc FROM products', function(err, rows, fields){
  if (err) throw err;
  numProds = rows.length;
  idx = 0;
  prods = rows;
  setInterval(updateItem, 865000);  //upcitemdb.com's free api only allows 100 calls per day. This is the proper interval to keep calls at that rate.
});

function updateItem(){
  if (idx == numProds){
    idx = 0
  }

  let upc = prods[idx].upc;
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
            AttemptProductUpdate(response, prods[idx].upc);

        } catch (error) {
            console.error(error.message);
            idx +=1;
        };
      });
    })
    
    req.on('error', error => {
      console.error(error)
    })
    
    req.end()
}

function AttemptProductUpdate(response, upc){
  let item_results = JSON.parse(response);
  for (let i=0; i < item_results.items[0].offers.length; i++){
    let seller = item_results.items[0].offers[i];
    AddRetailer(seller, upc);
  }
  idx +=1;
}

function AddRetailer(seller, upc){
  mariadb.pool.query('INSERT INTO retailers (`name`) VALUES (?) ON DUPLICATE KEY UPDATE retailerId=retailerId', [seller.merchant], function(err, result){
    if(err) throw err;
    GetRetailerId(seller, upc)
  });
}

function GetRetailerId(seller, upc){
  mariadb.pool.query('SELECT retailerId FROM retailers WHERE name=?', [seller.merchant], function(err, rows, fields){
    if(err) throw err;
    insertUpdateProductRetailer(upc, rows[0].retailerId, seller.link, seller.price);
  });
}

function insertUpdateProductRetailer(upc, sellerId, link, price){
  mariadb.pool.query('INSERT INTO productRetailer (`upc`, `retailerId`, `price`, `url`) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE price=?, url=?', [upc, sellerId, price, link, price, link], function(err, result){
    if(err) throw err;
  });
}

console.log("Update started...");