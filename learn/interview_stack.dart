class CreateStack {
  List<int> stacks = [];

  void push(int value) {
    stacks.insert(0, value);
  }

  void pop() {
    stacks.removeAt(0);
  }

  int peek() {
    return stacks.first;
  }

  bool get isEmpty => stacks.isEmpty;

  int getMin() {
    stacks.sort((a, b) => a.compareTo(b));
    return stacks[0];
  }

  List<int> short() {
    stacks.sort((a, b) => a.compareTo(b));
    return stacks;
  }

  @override
  String toString() {
    return stacks.toString();
  }
}

class CreateQueue<T> {
  List<T> queue = [];

  void push(T value) {
    queue.add(value);
  }

  void pop() {
    queue.removeAt(0);
  }

  T peek() {
    return queue.first;
  }

  bool get isEmpty => queue.isEmpty;
}

class CreateMultiStack {
  List<CreateStack> stack = [];

  void createStack(int value) {
    for (var i = 0; i < value; i++) {
      stack.add(CreateStack());
    }
  }

  void push(int index, int value) {
    if (stack.isEmpty) {
      return print("Please create numb of stack first");
    }

    stack[index].push(value);
  }

  void pop(int index, int value) {
    if (stack.isEmpty) {
      return print("Please create numb of stack first");
    }

    stack[index].pop();
  }

  void pee(int index, int value) {
    if (stack.isEmpty) {
      return print("Please create numb of stack first");
    }

    stack[index].peek();
  }

  bool isEmpty(int index, int value) {
    if (stack.isEmpty) {
      return true;
    }

    return stack[index].isEmpty;
  }

  void show() {
    for (var item in stack) {
      print(item.stacks.toString());
    }
  }
}

void main(List<String> args) {
  var stack = CreateStack();

  stack.push(1);
  stack.push(2);
  stack.push(3);

  print("before");

  print(stack.stacks);
  print(stack.getMin());
}
