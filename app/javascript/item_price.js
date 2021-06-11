window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  // console.log(priceInput)
    priceInput.addEventListener("input", () => {
    // console.log("イベント発火")
      const inputValue = priceInput.value;
      // console.log(inputValue);
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
      // console.log(addTaxDom.innerHTML)
      const addProfitDom = document.getElementById("profit");
      addProfitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1))
  })
});