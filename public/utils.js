const debounce = (func, delay = 1000) => {
  let timeoutId;
  return (...args) => {
    if (timeoutId) {
      clearTimeout(timeoutId);
    }
    timeoutId = setTimeout(() => {
      func.apply(null, args);
    }, delay);
  };
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

function swap(array, index1, index2) {
  [ array[index1], array[index2] ] = [ array[index2], array[index1] ];
}

//Calculate the total saved from the highest priced store.
const savings = (msrp, price) => {
  return (parseFloat(msrp) - parseFloat(price)).toFixed(2);
};

//Organizes prices in descending order.
const descendingPrice = (results) => {
  return results.sort((a, b) => a.price - b.price);
};

//Sort prices in ascending order.
const ascendingPrice = (results) => {
  return results.sort((a, b) => b.price - a.price);
};

//Sort list of prices alphabetically by retailer.
const alphabetSortAsc = (results) => {
  return results.sort((a, b) => {
    const aName = a.name.toUpperCase();
    const bName = b.name.toUpperCase();
    if (aName < bName) {
      return -1;
    } else if (aName > bName) {
      return 1;
    }
    return 0;
  });
};

const alphabetSortDec = (results) => {
  return results.sort((a, b) => {
    const aName = a.name.toUpperCase();
    const bName = b.name.toUpperCase();
    if (aName < bName) {
      return 1;
    } else if (aName > bName) {
      return -1;
    }
    return 0;
  });
};
