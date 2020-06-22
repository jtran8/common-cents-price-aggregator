const cheerio = require("cheerio");
const axios = require("axios");

const siteUrl = "https://www.amazon.com/dp/B07S6CBB9S/ref=dp_cerb_1";
let siteName = "";


const fetchData = async () => {
    const result = await axios.get(siteUrl);
    return cheerio.load(result.data);
  };
  
const getResults = async () => {
    const $ = await fetchData();
    const price = $('#price_inside_buybox').text();
    console.log(price);
};


const PriceFinder = require('price-finder');
const priceFinder = new PriceFinder();
 
// Atoms for Peace : Amok  (from Amazon)
const uri = 'https://www.target.com/p/nespresso-vertuoplus-black-deluxe-bundle-by-breville/-/A-53027982';
priceFinder.findItemPrice(uri, function(err, price) {
    console.log(price);
});