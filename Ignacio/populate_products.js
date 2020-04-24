const mariadb = require('./dbcon.js');

products = [
  ['Switch Console with Neon Blue & Red Joy-Con', '045496882174', 'Nintendo', 'Video Games'],
  ['Over-Ear Wireless Noise-Cancelling Headphones (WH1000XM3/B)', '027242911574', 'Sony', 'Headphones'],
  ['Galaxy S20+ 5G Enabled 128GB (Unlocked) - Cosmic Black', '887276395968', 'Samsung', 'Cell Phones'],
  ['AirPods Pro', '190199246850', 'Apple', 'Headphones'],
];

for (let i=0; i < products.length; i++){
  let prod = products[i];
  let brandId;
  let catId;
  mariadb.pool.query('INSERT INTO categories (`name`) VALUES (?) ON DUPLICATE KEY UPDATE name=?', [prod[3], prod[3]], function(err, result){
    if(err) throw err;

    mariadb.pool.query('SELECT `catId`, `name` FROM `categories` WHERE name=?', [prod[3]], function(err, rows, fields){
      if(err) throw err;
      catId = rows[0].catId;

      mariadb.pool.query('INSERT INTO brands (`name`) VALUES (?) ON DUPLICATE KEY UPDATE name=?', [prod[2], prod[2]], function(err, result){
        if(err) throw err;

        mariadb.pool.query('SELECT `brandId`, `name` FROM `brands` WHERE name=?', [prod[2]], function(err, rows, fields){
          if(err) throw err;
          brandId = rows[0].brandId;

          mariadb.pool.query('INSERT INTO categoryBrand (`catId`, `brandId`) VALUES (?, ?) ON DUPLICATE KEY UPDATE catId=?, brandId=?', [catId, brandId, catId, brandId], function(err, result){
            if(err) throw err;
          });

          mariadb.pool.query('INSERT INTO products (`name`, `upc`, `brandId`, `catId`) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE catId=?', [prod[0], parseInt(prod[1]), brandId, catId, catId], function(err, result){
            if(err) throw err;
          });
        })
      });
    });
  });
}