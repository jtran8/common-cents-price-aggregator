// the contents of the home screen and instructions
const introJumbotron = `
<div class="container">
    <div class="container">
        <div class="jumbotron top-level-bg">
            <h1 class="display-4 cc">¢ommon ¢ents</h1>
            <p class="lead light-text">we help you find the best price across the web.</p>
            <hr class="my-4">
            <p class="light-text">Go ahead and try a search.</p>
            <p class="lead light-text">
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

// return the html for the entire results section
const resultsTemplate = ({ itemSearched, imageUrl, msrp, results }) => {
  return `
  <div class="container">
    <div class="container result-confirm">
        <h4>Results for ${itemSearched}..</h4>
        <div class="jumbotron top-level-bg">
            <div class="row">
                <div class="col-md-3">
                    <div class="container result-box text-center">
                        <img src="${imageUrl}" class="img-fluid"></div>
                    </div>
                <div class="col-md-3">
                    <div class="container result-box text-center">
                        <div class="container">
                            <p class="lead">lowest</p>
                            <p class="price">$${findLowest(results)}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="container result-box text-center">
                        <div class="container">
                            <p class="lead">average</p>
                            <p class="price">$${findAvg(results)}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="container result-box text-center">
                        <div class="container">
                            <p class="lead">msrp</p>
                            <p class="price">$${msrp}</p>
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

// create the dropdown options for the categories
const genCategoryDropDown = (list) => {
  let options = '';
  for (const item of list) {
    options += `<option id="${item.catId}">${item.name}</option>`;
  }
  return options;
};

// create the dropdown options for the brands
const genBrandsDropDown = (list) => {
  let options = '<option selected disabled>brands</option>';
  for (const item of list) {
    options += `<option id="${item.brandId}">${item.name}</option>`;
  }
  return options;
};

// create the dropdown options for the products
const genProductsDropDown = (list) => {
  let options = '<option selected disabled>products</option>';
  for (const item of list) {
    options += `<option id="${item.upc}">${item.name}</option>`;
  }
  return options;
};

// template for filter options
const filterTemplate = ({ categories, brands }) => {
  return `
        <div class="card mb-5 top-level-bg filter-form">
            <div class="card-body">
                <form class="form ">
                    <div class="row">
                        <div class="col">
                          <label class="light-text" for="category">step 1, choose a category</label>
                          <select class="form-control form-control-sm" id="category">
                            <option selected disabled>categories</option>
                              ${genCategoryDropDown(categories.categories)}
                          </select>
                        </div>
                        <div class="col">
                          <label class="light-text" for="brand">step 2, choose a brand</label>
                          <select class="form-control form-control-sm" id="brand">
                            <option selected disabled>brands</option>
                            <option disabled>select a category first</option>
                          </select>
                        </div>
                    </div>
                    <div class="row mt-4">
                      <div class="col">
                        <label class="light-text" for="brand">step 3, choose a product</label>
                        <select class="form-control form-control-sm" id="product">
                          <option selected disabled>products</option>
                          <option disabled>select a brand first</option>
                        </select>
                      </div>
                    </div>
                </form>
            </div>
        </div>
    `;
};
