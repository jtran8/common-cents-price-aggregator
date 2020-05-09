const filtersURL = 'http://flip3.engr.oregonstate.edu:22222/filters';
const resultsURL = 'http://flip3.engr.oregonstate.edu:22222/results';
// get searched product from database
const queryByUPC = async (upc) => {
  try {
    const resp = await axios.get(`${resultsURL}/${upc}`);
    console.log(resp.data);
    const data = resp.data;
    return data;
  } catch (error) {
    console.log(error);
    return null;
  }
};

const queryAllCategories = async () => {
  try {
    const resp = await axios.get(filtersURL);
    return resp.data;
  } catch (error) {
    console.log(error);
    return null;
  }
};

const queryBrandsByCategory = async (catId) => {
  try {
    const resp = await axios.get(`${filtersURL}/${catId}`);
    return resp.data;
  } catch (error) {
    console.log(error);
    return null;
  }
};

const queryProductsByCategoryAndBrand = async (catId, brandId) => {
  try {
    const resp = await axios.get(`${filtersURL}/0${catId}/${brandId}`);
    return resp.data;
  } catch (error) {
    console.log(error);
    return null;
  }
};

// examples

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
      savings  : 0.0,
      inStock  : true,
      url      :
        'https://www.bestbuy.com/site/iphone/iphone-11-shop-by-carrier/pcmcat1568147287090.c?id=pcmcat1568147287090'
    },
    {
      retailer : 'Apple',
      price    : 699.99,
      savings  : 0.0,
      inStock  : true,
      url      :
        'https://www.apple.com/iphone-11/?afid=p238%7Cs2Eu8PK7l-dc_mtid_20925d2q39172_pcrid_431569481416_pgrid_80926719554_&cid=wwa-us-kwgo-iphone--slid--'
    },
    {
      retailer : 'Target',
      price    : 710.0,
      savings  : 0.0,
      inStock  : false,
      url      : 'https://www.target.com/p/apple-iphone-11/-/A-78052843'
    }
  ]
};
