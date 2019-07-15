const Observable = require('./observable');
const watcher = require('./watcher');

let cart = new Observable({ price: 5, quantity: 2, name: 'shopping cart' });
let salesTax = new Observable({tax: 1.05});
let total = 0;

function calculateTotal() {
  total = cart.price * cart.quantity * salesTax.tax;
}

// registers dependencies between cart.price, cart.quantity, and salesTax.tax and total. 
// total is automatically re-calculated whenever price, quantity or tax is changed.
watcher(calculateTotal);

console.log(total);
cart.price = 20;
console.log(total);
cart.quantity = 3;
console.log(total);
salesTax.tax = 1.1;
console.log(total);