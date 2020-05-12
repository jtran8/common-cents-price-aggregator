const mariadb = require('./dbcon.js');

products = [
  ['Switch Console with Neon Blue & Red Joy-Con', '045496882174', 'Nintendo', 'Video Games'],
  ['Over-Ear Wireless Noise-Cancelling Headphones (WH1000XM3/B)', '027242911574', 'Sony', 'Headphones'],
  ['Galaxy S20+ 5G Enabled 128GB (Unlocked) - Cosmic Black', '887276395968', 'Samsung', 'Cell Phones'],
  ['AirPods Pro', '190199246850', 'Apple', 'Headphones'],
];

for (let i=0; i < products.length; i++){  
  ProductUpdate(products[i])
}

function ProductUpdate(prodArr){
  let prod = {
    name: prodArr[0],
    upc: parseInt(prodArr[1]),
    brand: prodArr[2],
    cat: prodArr[3]
  }
  InsertIntoCategories(prod);
}

function InsertIntoCategories(prod){
  mariadb.pool.query('INSERT INTO categories (`name`) VALUES (?) ON DUPLICATE KEY UPDATE name=name', [prod.name], function(err, result){
    if(err) throw err;

    GetCategoryId(prod);
  });
}

function GetCategoryId(prod) {
  mariadb.pool.query('SELECT `catId`, `name` FROM `categories` WHERE name=?', [prod.name], function(err, rows, fields){
    if(err) throw err;
    prod.catId = rows[0].catId;
    //let catId = rows[0].catId;
    InsertIntoBrands(prod)
  });
}

function InsertIntoBrands(prod){
  mariadb.pool.query('INSERT INTO brands (`name`) VALUES (?) ON DUPLICATE KEY UPDATE name=name', [prod.brand], function(err, result){
    if(err) throw err;
    GetBrandId(prod);
  });
}

function GetBrandId(prod){
  mariadb.pool.query('SELECT `brandId`, `name` FROM `brands` WHERE name=?', [prod.brand], function(err, rows, fields){
    if(err) throw err;
    prod.brandId = rows[0].brandId;
    //brandId = rows[0].brandId;

    InsertIntoCategoryBrand(prod);
    InsertIntoProducts(prod);
  });
}

function InsertIntoCategoryBrand(prod){
  mariadb.pool.query('INSERT INTO categoryBrand (`catId`, `brandId`) VALUES (?, ?) ON DUPLICATE KEY UPDATE catId=catId, brandId=brandId', [prod.catId, prod.brandId], function(err, result){
    if(err) throw err;
  });
}

function InsertIntoProducts(prod){
  mariadb.pool.query('INSERT INTO products (`name`, `upc`, `brandId`, `catId`) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE catId=catId', [prod.name, prod.upc, prod.brandId, prod.catId], function(err, result){
    if(err) throw err;
  });
}