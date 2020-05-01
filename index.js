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
// TODO: if filters are applied change query
const displayFilters = async () => {
  const categories = await queryAllCategories();
  //   const categories = 'await queryAllCategories();';
  filterOptions.innerHTML = filterTemplate({ categories });
  const categorySelect = document.querySelector('#category');
  categorySelect.addEventListener('change', async (e) => {
    const catOptions = e.target.options;
    const catId = catOptions[catOptions.selectedIndex].id;
    filters.category = catId;
    const brands = await queryBrandsByCategory(catId);
    console.log(brands.brands);
    const brandSelect = document.querySelector('#brand');
    brandSelect.innerHTML = genBrandsDropDown(brands.brands);
    brandSelect.addEventListener('change', async (e) => {
      const brandOptions = e.target.options;
      const brandId = brandOptions[brandOptions.selectedIndex].id;
      filters.brand = brandId;
      const products = await queryProductsByCategoryAndBrand(catId, brandId);
      const productSelect = document.querySelector('#product');
      productSelect.innerHTML = genProductsDropDown(products.products);
      productSelect.addEventListener('change', async (e) => {
        const productOptions = e.target.options;
        const productName = productOptions[productOptions.selectedIndex].value;
        search(productName);
      });
    });
  });
};

// event listener to tell when a search is happening
//searchBar.addEventListener('input', debounce(search, 500));

displayFilters();

// initial make the root the intro jumbotron
root.innerHTML = introJumbotron;

//http://flip1.engr.oregonstate.edu:19829/?product=iPhone%2011
