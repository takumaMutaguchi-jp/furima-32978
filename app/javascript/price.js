function calc(){
  const item_field = document.getElementById("item-price")
  item_field.addEventListener('keyup', function() {
    let tax_field = document.getElementById("add-tax-price")
    let profit_field = document.getElementById("profit")
    let price = item_field.value
    if (300 <= price && price <= 9999999) {
      let tax = Math.floor(price / 10)
      let profit = (price - tax)
      tax_field.innerHTML = tax
      profit_field.innerHTML = profit
    } else {
      tax_field.innerHTML = ""
      profit_field.innerHTML = ""
    }
  })
}

window.addEventListener('load', calc);