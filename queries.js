const dbURL = 'http://localhost:19830';
// get searched product from database
const queryByProductName = async (itemName) => {
  try {
    const resp = await axios.get(dbURL, {
      params : {
        product : itemName
      }
    });
    const data = resp.data;
    return data;
  } catch (error) {
    console.log(error);
    return null;
  }
};

const queryAllCategories = async () => {
  try {
    // const resp = await axios.get(dbURL, {
    //   params : {
    //     product : itemName
    //   }
    // });
    // const data = resp.data;
    const data = [ 'games', 'tvs', 'shoes', 'cell phones' ];
    return data;
  } catch (error) {
    console.log(error);
    return null;
  }
};

const queryBrandsByCategory = async (category) => {
  try {
    // const resp = await axios.get(dbURL, {
    //   params : {
    //     product : itemName
    //   }
    // });
    // const data = resp.data;
    if (category === 'tvs') {
      return [ 'samsung', 'sony', 'vizio', 'lg' ];
    } else if (category === 'cell phones') {
      return [ 'apple', 'samsung', 'lg', 'google' ];
    } else if (category === 'shoes') {
      return [ 'nike', 'adidas', 'new balance', 'converse' ];
    } else if (category === 'games') {
      return [ 'xbox', 'playstation', 'nintendo' ];
    }
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
