class Node<T> {
  Node({required this.value, this.next});

  T value;
  Node<T>? next;

  @override
  String toString() {
    if (next == null) return "$value";
    return "$value -> ${next.toString()}";
  }
}

class LinkedList<Z> {
  LinkedList({this.head, this.tail});

  Node<Z>? head;
  Node<Z>? tail;

  bool get isEmpty => head == null;

  void push(Z value) {
    if (isEmpty) {
      head = Node(value: value, next: head);
      tail ??= head;

      return;
    }

    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  Node<Z>? nodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;

    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex++;
    }

    return currentNode;
  }

  Z? pop() {
    final value = head?.value;

    head = head?.next;

    if (isEmpty) {
      tail = null;
    }

    return value;
  }

  Z? removeAfter(Node<Z> node) {
    final value = node.next!.value;

    if (node.next == tail) {
      tail = node;
    }

    node.next = node.next!.next;
    return value;
  }

  int sumValue() {
    var currentNode = head;
    var value = head!.value.toString();

    while (currentNode != null) {
      currentNode = currentNode.next;

      if (currentNode?.value != null) {
        value = "$value${currentNode?.value}";
      }
    }

    return int.parse(value);
  }

  @override
  String toString() {
    if (head == null) return "it's Empty head";
    return head.toString();
  }
}

void main(List<String> args) {
  final list = LinkedList();

  list.push(6);
  list.push(1);
  list.push(7);

  final list2 = LinkedList();

  list2.push(2);
  list2.push(9);
  list2.push(5);

  print(list.sumValue() + list2.sumValue());

  // list.push(4);
  // list.push(5);

  // print('Before: $list');

  // final node = list.nodeAt(2);
  // final removedValue = list.removeAfter(node!);

  // print('After:  $list');
  // print('Removed value: $removedValue');
}
