class Node<T> {
  Node({
    required this.value,
    this.next,
  });

  T value;
  Node<T>? next;

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class LinkedList<E> {
  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;

  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  void append(E value) {
    // 1
    if (isEmpty) {
      push(value);
      return;
    }

    // 2
    tail!.next = Node(value: value);

    // 3
    tail = tail!.next;
  }

  Node<E>? nodeAt(int index) {
    // 1
    var currentNode = head;
    var currentIndex = 0;

    // 2
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }

  Node<E> insertAfter(Node<E> node, E value) {
    // 1
    if (tail == node) {
      append(value);
      return tail!;
    }

    // 2
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }
}

void main() {
  // final node1 = Node(value: 1);
  // final node2 = Node(value: 2);
  // final node3 = Node(value: 3);
  // final node4 = Node(value: 4);

  // node1.next = node2;
  // node2.next = node3;
  // node3.next = node4;

  // print(node3);

  final list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print('Before: $list');

  var middleNode = list.nodeAt(1)!;
  list.insertAfter(middleNode, 42);

  // final listAppaned = LinkedList<int>();
  // listAppaned.append(1);
  // listAppaned.append(2);
  // listAppaned.append(3);
  // print(listAppaned);

  print(list);
}
