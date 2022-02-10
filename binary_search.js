let sortedArray = [11, 24, 30, 43, 51, 61, 73, 86];

function isExists(num, array = []) {
  var midPoint = Math.floor(array.length / 2);

  console.log({ midPoint });

  let firstHalf = array.slice(0, midPoint);
  let secondHalf = array.slice(midPoint, array.length - 1);

  if (array[midPoint] === num) return true;

  let isFirstHalf = false;

  if (array[midPoint] < num) {
    // console.log("conditiion 1");
    isFirstHalf = false;
  } else if (array[midPoint] > num) {
    // console.log("conditiion 2");
    isFirstHalf = true;
  }

  if (array.length == 1) {
    return false;
  } else {
    if (isFirstHalf) {
      return isExists(num, firstHalf);
    } else {
      return isExists(num, secondHalf);
    }
  }
}

console.log(isExists(27, sortedArray));

// let myArray = [1, 5, 0, 6, 1, 9, 9, 2, 13, 24, 27];

// function getMax(input) {
//   var max = 0;

//   for (var i = 0; i < input.length; i++) {
//     if (max < input[i]) {
//       max = input[i];
//     }
//   }

//   return max;
// }

// // console.log(getMax(myArray));

// let myArray1 = [1, 5, 0, 6, 1, 9, 9, 2];

// function sort(input) {
//   var sortedArray = [];
//   for (var i = 0; i < input.length; i++) {
//     // O(n)
//     let min = input[i];

//     for (var j = i + 1; i < input.length; i++) {
//       // O(n)
//       if (input[i] < input[j]) min = input[j];
//     }

//     sortedArray.push(min);
//   }
//   return sortedArray;
// }

// // console.log(sort(myArray1));
