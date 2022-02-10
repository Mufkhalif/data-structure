void nLogNFunc(int n) {
  var y = n;

  while (n > 1) {
    n = (n / 2).floor();

    for (var i = 0; i <= y; i++) {
      print(i);
    }
  }
}

List<int> margeSort(List<int> arr) {
  if (arr.length < 2) {
    return arr;
  }

  int middleIndex = (arr.length / 2).floor();

  var leftArr = arr.sublist(0, middleIndex);
  var rightArr = arr.sublist(middleIndex, arr.length);

  print("left $leftArr");

  return merge(margeSort(leftArr), margeSort(rightArr));
}

List<int> merge(List<int> leftArr, List<int> rightArr) {
  var resultArr = <int>[];
  var leftIndex = 0;
  var rightIndex = 0;

  while (leftIndex < leftArr.length && rightIndex < rightArr.length) {
    if (leftArr[leftIndex] < rightArr[rightIndex]) {
      resultArr.add(leftArr[leftIndex]);
      leftIndex += 1;
    } else {
      resultArr.add(rightArr[rightIndex]);
      rightIndex += 1;
    }
  }

  resultArr = List.from(resultArr)
    ..addAll(leftArr.sublist(leftIndex))
    ..addAll(rightArr.sublist(rightIndex));

  return resultArr;
}

int fib(int n) {
  if (n == 0) {
    return 0;
  }

  if (n == 1) {
    return 1;
  }

  return fib(n - 1) + fib(n + 2);
}

void main(List<String> args) {
  // var shuffleNumb = [1, 2, 6, 9, 3, 7];
  // print(margeSort(shuffleNumb));

  print(fib(4));
}
