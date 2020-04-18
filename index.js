// example object to represent the api call to the database
const exampleResults = {
  itemSearched : 'iPhone 11',
  imageUrl     :
    'https://cdn.tmobile.com/content/dam/t-mobile/en-p/cell-phones/apple/Apple-iPhone-11-Pro/Midnight-Green/Apple-iPhone-11-Pro-Midnight-Green-frontimage.jpg',
  msrp         : 799.99,
  results      : [
    {
      retailer : 'Best Buy',
      price    : 701.0,
      inStock  : true,
      url      :
        'https://www.bestbuy.com/site/iphone/iphone-11-shop-by-carrier/pcmcat1568147287090.c?id=pcmcat1568147287090'
    },
    {
      retailer : 'Apple',
      price    : 699.99,
      inStock  : true,
      url      :
        'https://www.apple.com/iphone-11/?afid=p238%7Cs2Eu8PK7l-dc_mtid_20925d2q39172_pcrid_431569481416_pgrid_80926719554_&cid=wwa-us-kwgo-iphone--slid--'
    },
    {
      retailer : 'Target',
      price    : 710.0,
      inStock  : false,
      url      : 'https://www.target.com/p/apple-iphone-11/-/A-78052843'
    }
  ]
};

// the contents of the home screen and instructions
const introJumbotron = `
<div class="container">
    <div class="container">
        <div class="jumbotron">
            <h1 class="display-4 cc">¢ommon ¢ents</h1>
            <p class="lead">we help you find the best price across the web.</p>
            <hr class="my-4">
            <p>Go ahead and try a search.</p>
            <p class="lead">
            We support Best Buy, Amazon, Newegg and more.
            </p>
        </div>
    </div>
</div>
`;

// generate a table baseds on the results object
// this will be a table with retailer, price, and stock
const genTable = (results) => {
  let table = `
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">Retailer</th>
            <th scope="col" class="text-center">Price</th>
            <th scope="col" class="text-right">In Stock</th>
        </tr>
        </thead>
        <tbody>
    `;

  for (result of results) {
    table += `
            <tr>
                <th scope="row"><a href="${result.url}">${result.retailer}</th>
                <td class="text-center">$${result.price}</td>
                <td class="text-right">${result.inStock ? 'Yes' : 'No'}</td>
            </tr>
            `;
  }

  table.concat(`
        </tbody>
    </table>
  `);

  return table;
};

// return the lowest price in the array
const findLowest = (results) => {
  let lowest = results[0].price;
  for (result of results) {
    if (result.price < lowest) {
      lowest = result.price;
    }
  }
  return lowest;
};

// return the average price in the array
const findAvg = (results) => {
  let sum = 0.0;
  let count = 0;
  for (result of results) {
    sum += result.price;
    count++;
  }
  return (sum / count).toFixed(2);
};

// return the html for the entire results section
const resultsTemplate = ({ itemSearched, imageUrl, msrp, results }) => {
  return `
  <div class="container">
    <div class="container result-confirm">
        <h4>Results for ${itemSearched}..</h4>
        <div class="jumbotron">
            <div class="row">
                <div class="col-md-3">
                    <div class="container result-box text-center">
                        <img src="${imageUrl}" class="img-fluid"></div>
                    </div>
                <div class="col-md-3">
                    <div class="container result-box text-center">
                        <div class="container">
                            <p class="lead">lowest</p>
                            <h5>$${findLowest(results)}</h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="container result-box text-center">
                        <div class="container">
                            <p class="lead">average</p>
                            <h5>$${findAvg(results)}</h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="container result-box text-center">
                        <div class="container">
                            <p class="lead">msrp</p>
                            <h5>$${msrp}</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-5">
                <div class="col-sm-12">
                    <div class="container">
                        ${genTable(results)}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    `;
};

// where there will be chances made
const root = document.querySelector('#root');
// to detect searches
const searchBar = document.querySelector('#search-bar');

// a temporary function to simulate a search for iphone 11
const temporaryInputFunc = () => {
  if (searchBar.value === 'iPhone 11') {
    root.innerHTML = resultsTemplate(exampleResults);
  } else if (searchBar.value === '') {
    root.innerHTML = introJumbotron;
  }
};

// event listener to tell when a search is happening
searchBar.addEventListener('input', temporaryInputFunc);
// initial make the root the intro jumbotron
root.innerHTML = introJumbotron;
