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

  String loopDetectionearlier() {
    var currentNode = head;
    var storeValue = [head!.value.toString()];

    while (currentNode != null) {
      currentNode = currentNode.next;

      if (currentNode?.value != null) {
        storeValue.add("${currentNode?.value}");
      }
    }

    var result = "0";
    var newStore = [];

    for (var item in storeValue) {
      if (newStore.contains(item)) {
        result = item;
        break;
      } else {
        newStore.add(item);
      }
    }

    return result;
  }

  @override
  String toString() {
    if (head == null) return "it's Empty head";
    return head.toString();
  }
}

bool checkIsLinkedlistIsPalindrome(String linkedString) {
  final removeArrow = linkedString.replaceAll(" -> ", " ");
  final reversedLinked = removeArrow.split(" ").toList().reversed.join(" ");
  return removeArrow == reversedLinked;
}

void main(List<String> args) {
  final list = LinkedList();

  list.push(6);
  list.push(7);
  list.push(8);
  list.push(7);
  list.push(8);

  print(list.loopDetectionearlier());
}
