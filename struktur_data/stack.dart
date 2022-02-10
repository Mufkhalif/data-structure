class CreateStack {
  List<String> _array = [];
  List<String> getArray() => _array;

  void push(String newStack) {
    _array.add(newStack);
  }

  void pop() {
    _array.removeLast();
  }

  String peek() {
    return _array.last;
  }

  int size() {
    return _array.length;
  }
}

void main() {
  Stopwatch stopwatch = Stopwatch()..start();

  var newStack = CreateStack();

  newStack.push("Ahmad");
  newStack.push("Cahyo");
  newStack.push("Junior");
  newStack.push("Yayan");

  print(newStack._array);

  print(newStack.peek());
  print(newStack.size());

  print('doSomething() executed in ${stopwatch.elapsed}');

  calculate();
}

void calculate() {
  var listNumber = [3, 2, 3, 4, 2];

  listNumber.sort((a, b) => a.compareTo(b));

  print(listNumber);
}
