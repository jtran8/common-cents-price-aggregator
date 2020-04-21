const express = require('express');
const mariadb = require('./dbcon.js');
const app = express();
const port = 19829;
const PriceFinder = require('price-finder');
const priceFinder = new PriceFinder();
 
// Atoms for Peace : Amok  (from Amazon)
const uri = 'https://www.target.com/p/samsung-65-34-smart-4k-hdr-uhd-tv-glossy-black-un65nu6900/-/A-53832609';
priceFinder.findItemPrice(uri, function(err, price) {
    console.log(price); // 8.91
});

app.get('/', (req, res) => {
    let resp = {}
    stmt = 'SELECT * FROM dummy WHERE name=?';
    mariadb.pool.query(stmt, [req.query.product], function(err, rows, fields){
        resp.itemSearched = rows[0].name;
        resp.imageUrl = rows[0].img_url;
        resp.msrp = rows[0].msrp;
        resp.results = [];

        for (let i=0; i < rows.length; i++){
            let newResult = {};
            newResult.retailer = rows[i].retailer;
            newResult.price = rows[i].price;
            newResult.inStock = rows[i].inStock;
            newResult.url = rows[i].url;

            resp.results.push(newResult);
        }

        res.send(resp);
    });
});

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))