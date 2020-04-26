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
