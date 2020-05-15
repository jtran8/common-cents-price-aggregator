const dropdowns = [
  {
    element    : document.querySelector('#category'),
    getOptions : async () => {
      return genCategoryDropDown((await queryAllCategories()).categories);
    },
    queryTerm  : ''
  },
  {
    element    : document.querySelector('#brand'),
    getOptions : async () => {
      return genBrandsDropDown((await queryBrandsByCategory(queryTerm)).brands);
    },
    queryTerm  : ''
  }
];

const chainedDropdown = (ddObjs = []) => {
  for (let i = 0; i < ddObjs.length - 1; i++) {
    if (i === 0) {
      ddObjs[i].element.innerHTML = ddObjs[i].getOptions(ddObjs[i].queryTerm);
    }
    ddObjs[i].element.addEventListener('change', async (e) => {
      ddObjs[i + 1].queryTerm =
        e.target.options[e.target.options.selectedIndex].id;
      ddObjs[i + 1].element.innerHTML = ddObjs[i + 1].getOptions(
        ddObjs[i + 1].queryTerm
      );
    });
  }
};
