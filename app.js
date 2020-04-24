const express = require('express');
//const mariadb = require('./dbcon.js');
const app = express();
const port = 19829;
const PriceFinder = require('price-finder');
const priceFinder = new PriceFinder();
 
//Atoms for Peace : Amok  (from Amazon)
const uris = [
  'https://www.samsclub.com/p/switch-nintendo-switch/prod23652009?CAWELAID=730010300002297196&pid=_Aff_LS&siteID=jniXEdcEVNs-I.OfDgH1tO7vsZm5AMALCw&ranMID=38733&ranEAID=jniXEdcEVNs&ranSiteID=jniXEdcEVNs-I.OfDgH1tO7vsZm5AMALCw',
  'https://www.techforless.com/cgi-bin/tech4less/sqlresults?id=9TCAN9x2',
  'https://www.target.com/p/nintendo-switch-with-neon-blue-and-neon-red-joy-con/-/A-77464001?clkid=9f83bd1eN640011eabe2242010a246c14&lnm=201333&afid=priceviewer&ref=tgt_adv_xasd0002',
  'https://www.bestbuy.com/site/nintendo-switch-32gb-console-neon-red-neon-blue-joy-con/6364255.p?skuId=6364255',

];
priceFinder.findItemPrice(uri, function(err, price) {
    console.log(price); // 8.91
});


app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))