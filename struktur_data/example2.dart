class Node<T> {
  Node({
    required this.value,
    this.left,
    this.right,
  });

  T value;
  Node<T>? left;
  Node<T>? right;
}

dynamic sum(Node? node) {
  if (node == null) {
    return 0;
  }

  return sum(node.left) + node.value + sum(node.right);
}

void main(List<String> args) {
  final node = Node(value: 5);
  final leftNode = Node(value: 3);
  final rightNode = Node(value: 2);

  final leftNode1 = Node(value: 4);

  leftNode.left = leftNode1;

  node.left = leftNode;
  // node.right = rightNode;

  print(sum(node));
}
