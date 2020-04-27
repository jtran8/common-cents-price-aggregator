// get searched product from database
const queryByProductName = async (itemName) => {
  try {
    const resp = await axios.get('localhost:3000', {
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
