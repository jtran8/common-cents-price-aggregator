// where there will be chances made
const root = document.querySelector('#root');
// to detect searches
//const searchBar = document.querySelector('#search-bar');

const filterOptions = document.querySelector('#filter-options');
const filterButton = document.querySelector('#filter-button');
let filters = {};

// search for whatever is in the text box
// todo: search not found functionaliy
const search = async (name) => {
  const data = await queryByProductName(name);
  if (data) {
    root.innerHTML = resultsTemplate(data);
  } else {
    root.innerHTML = 'not in database yet';
  }
  //root.innerHTML = resultsTemplate(exampleResults);
};

// event handler for when filter is pressed
// TODO: ALOT OF REFACTORING
const displayFilters = async () => {
  // get all categories
  const categories = await queryAllCategories();
  // display filters interface
  filterOptions.innerHTML = filterTemplate({ categories });

  // add event listener for selecting categories
  const categorySelect = document.querySelector('#category');
  categorySelect.addEventListener('change', async (e) => {
    // get the selected category's id
    const catOptions = e.target.options;
    const catId = catOptions[catOptions.selectedIndex].id;
    // query brands by category id
    const brands = await queryBrandsByCategory(catId);
    // update brands dropdown
    const brandSelect = document.querySelector('#brand');
    brandSelect.innerHTML = genBrandsDropDown(brands.brands);

    // add event listener for selecting brands
    brandSelect.addEventListener('change', async (e) => {
      // get the selected brand's id
      const brandOptions = e.target.options;
      const brandId = brandOptions[brandOptions.selectedIndex].id;
      // query prodcuts by category and brand id
      const products = await queryProductsByCategoryAndBrand(catId, brandId);
      // update products dropdown
      const productSelect = document.querySelector('#product');
      productSelect.innerHTML = genProductsDropDown(products.products);

      // add event listener for selecting a product
      productSelect.addEventListener('change', async (e) => {
        const productOptions = e.target.options;
        const productName = productOptions[productOptions.selectedIndex].value;
        // when the product is selected - search the database for that product
        // search updates to the result page
        search(productName);
      });
    });
  });
};

displayFilters();

// initial make the root the intro jumbotron
root.innerHTML = introJumbotron;

//http://flip1.engr.oregonstate.edu:19829/?product=iPhone%2011
