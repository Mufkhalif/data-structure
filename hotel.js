// const hotels = [
//   { price: 180, brand: "Hotel Tugu Lombok" },
//   { price: 78, brand: "Sheraton Senggigi Beach Resort" },
//   { price: 317, brand: "The Oberio" },
// ];

// function getValue() {
//   var max = hotels[hotels.length - 1].price;
//   var min = hotels[0].price;

//   for (let i = 0; i < hotels.length; i++) {
//     var currentPrice = hotels[i].price;

//     if (max < currentPrice) {
//       max = currentPrice;
//     } else if (currentPrice < min) {
//       min = currentPrice;
//     }
//   }

//   return { max, min };
// }

// console.log(getValue());

//  o(n2)
function prime(n) {
  for (var i = 2; i * i <= n; i++) {
    console.log(i);

    if (n % i == 0) {
      return false;
    }
  }

  return true;
}

// console.log(prime(4));

// o(n)
function factorial(n = 0) {
  if (n < 0) {
    return -1;
  }

  if (n == 0) {
    return 1;
  }

  return n * factorial(n - 1);
}

// 1. 3 * factorial(3-1);
// 1. 2 * factorial(2-1);
// 1. 1 * factorial(1-1);

console.log(factorial(3));
