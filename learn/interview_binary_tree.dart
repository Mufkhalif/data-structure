import 'dart:math';

class BinaryNode<T> {
  BinaryNode(this.value);
  T value;
  BinaryNode<T>? leftChild;
  BinaryNode<T>? rightChild;

  void traverseInOrder(void Function(T value) action) {
    leftChild?.traverseInOrder(action);
    action(value);
    rightChild?.traverseInOrder(action);
  }

  void traversePreOrder(void Function(T value) action) {
    action(value);
    leftChild?.traversePreOrder(action);
    rightChild?.traversePreOrder(action);
  }

  void traversePostOrder(void Function(T value) action) {
    leftChild?.traversePostOrder(action);
    rightChild?.traversePostOrder(action);
    action(value);
  }

  T getRandomNode() {
    var random = Random();
    var store = [];

    this.traverseInOrder((value) {
      store.add(value);
    });

    return store[random.nextInt(store.length)];
  }

  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(
    BinaryNode<T>? node, [
    String top = "",
    String root = "",
    String bottom = "",
  ]) {
    if (node == null) {
      return '$root null \n';
    }

    if (node.leftChild == null && node.rightChild == null) {
      return "$root ${node.value}\n";
    }
    final a = _diagram(
      node.rightChild,
      '$top ',
      '$top┌──',
      '$top│ ',
    );
    final b = '$root${node.value}\n';
    final c = _diagram(
      node.leftChild,
      '$bottom│ ',
      '$bottom└──',
      '$bottom ',
    );
    return '$a$b$c';
  }
}

BinaryNode<int> createBinaryTree() {
  final zero = BinaryNode(0);
  final one = BinaryNode(1);
  final five = BinaryNode(5);
  final seven = BinaryNode(7);
  final eight = BinaryNode(8);
  final nine = BinaryNode(9);

  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;

  return seven;
}

BinaryNode? balenced(
  List list,
  int start,
  int end,
) {
  if (start > end) return null;

  int mid = ((end + start) / 2).floor();

  BinaryNode root = BinaryNode(list[mid]);

  root.leftChild = balenced(list, start, mid - 1);
  root.rightChild = balenced(list, mid + 1, end);

  return root;
}

void runGetRandomTree() {
  var nums = [-10, -3, 0, 5, 9];
  final tree = balenced(nums, 0, nums.length - 1);
  tree!.getRandomNode();
}

void main(List<String> args) {
  var nums = [-10, -3, 0, 5, 9];

  final tree = balenced(nums, 0, nums.length - 1);

  print(tree!.getRandomNode());
}
