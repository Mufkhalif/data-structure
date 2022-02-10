bool search(List list, int value, int min, int max) {
  if (min > max) {
    return false;
  }

  final int mid = ((max + min) / 2).floor();

  if (value < list[mid]) {
    return search(list, value, min, mid - 1);
  } else if (value > list[mid]) {
    return search(list, value, mid + 1, max);
  } else {
    return true;
  }
}

void main() {
  final list = [1, 2, 5, 7, 9, 12, 25, 26];
  print(search(list, 5, 0, list.length - 1));
}
