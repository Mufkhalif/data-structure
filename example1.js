function sum(array = []) {
  var sum = 0;
  var product = 1;

  for (var i = 0; i < array.length; i++) {
    sum += array[i];
  }

  for (var i = 0; i < array.length; i++) {
    product *= array[i];
  }

  console.log(sum, product);
}

function oQuadrad(array = []) {
  for (var i = 0; i < array.length; i++) {
    for (var j = i + 1; j < array.length; j++) {
      console.log(array[i], array[j]);
    }
  }
}

// sum([20, 30, 40, 30]);
// oQuadrad([1, 2, 3]);

function hitung(n) {
  console.log(n);

  if (n <= 1) {
    return 1;
  }
  return hitung(n - 1) + hitung(n - 1);
}

function newHitung(n = []) {
  var value = 0;

  for (var i = 0; i < n.length; i++) {
    for (var j = i; j < n.length; j++) {
      value += 2;
    }

    console.log(value);
  }
}

// newHitung([1, 2, 3, 4, 5, 6]);

function reverse(array = []) {
  for (var i = 0; i < array.length / 2; i++) {
    var other = array.length - i - 1;
    var temp = array[i];

    console.log({ other, temp });

    array[i] = array[other];
    array[other] = temp;
  }

  console.log(array);
}

reverse([1, 2, 3, 4, 5, 6]);
