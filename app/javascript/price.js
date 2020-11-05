function price (){
  const itemPrice = document.getElementById("item-price");
  
  itemPrice.addEventListener('keyup', () => {
    const salesCommission = itemPrice.value * 0.1 ;
    const addTaxPrice = document.getElementById('add-tax-price');
    addTaxPrice.innerHTML = `${Math.floor(salesCommission)}`;

    const salesProfit = itemPrice.value - salesCommission;
    const profit = document.getElementById('profit');
    profit.innerHTML = `${Math.floor(salesProfit)}`;
  });
}

window.addEventListener('load', price);
