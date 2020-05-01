// where there will be chances made
const root = document.querySelector('#root');
// to detect searches
const searchBar = document.querySelector('#search-bar');

let filtersDisplayed = false;
const filterOptions = document.querySelector('#filter-options');
const filterButton = document.querySelector('#filter-button');
let filters = {};

// search for whatever is in the text box
// todo: search not found functionaliy
const search = async () => {
  if (searchBar.value === '') {
    root.innerHTML = introJumbotron;
  }
  const data = await queryByProductName(searchBar.value);
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
  filtersDisplayed = !filtersDisplayed;
  if (filtersDisplayed) {
    const categories = await queryAllCategories();
    filterOptions.innerHTML = filterTemplate({ categories });
    const categorySelect = document.querySelector('#category');
    categorySelect.addEventListener('change', async (e) => {
      const options = e.target.options;
      const selected = options[options.selectedIndex].value;
      filters.category = selected;
      const brands = await queryBrandsByCategory(selected);
      document.querySelector('#brand').innerHTML = genBrandsDropDown(brands);
    });
  } else {
    filterOptions.innerHTML = '';
    filters = {};
  }

  //root.innerHTML = resultsTemplate(exampleResults);
};

// event listener to tell when a search is happening
searchBar.addEventListener('input', debounce(search, 500));

filterButton.addEventListener('click', displayFilters);

// initial make the root the intro jumbotron
root.innerHTML = introJumbotron;

//http://flip1.engr.oregonstate.edu:19829/?product=iPhone%2011
