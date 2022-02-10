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

class LinkedList<E> {
  LinkedList({this.head, this.tail});

  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;

  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;

    /**
     * push(1)
     * 2. -> head = Node(value: 1, next: null)
     *    -> tail = Node(value: 1, next: null)
     * 
     * push(2)
     * 3. -> head = Node(value: 2, next: Node(value: 1, next: null))
     *    -> tail = Node(value: 1, next: null)
     * 
     * push(3)
     * 3. -> head = Node(value: 3, next: Node(value: 2, next: Node(value: 1, next: null)))
     *    -> tail = Node(value: 1, next: null)
     * 
     */
  }

  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }

    print("before: $head");

    tail!.next = Node(value: value);

    print("after: $head");
    tail = tail!.next;

    /**
     * append(1)
     * LinkedList(
     *   head: Node(value: 1),
     *   tail: Node(value: 1)
     * )
     * 
     * append(2)
     * LinkedList(
     *   head: Node(value: 1, next: Node(value : 2 ) )),
     *   tail: Node(value: 1)
     * )
     * 
     * append(3)
     * LinkedList(
     *   head: Node(value: 1, next: Node(value : 2, next: Node(value : 3)))),
     *   tail: Node(value: 1)
     * )
     * 
     */
  }

  Node<E>? nodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;

    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }

    return currentNode;

    /**
     * nodeAt(1)
     * 
     * 1. currentNode = Node(value: 1, next: Node(value: 2))
     * 
     * 
     * when find with index = 1
     * 2. -> 1. currentNode = Node(value: 2, next(value: 3))
     *    -> 2. currentIndex = 1
     * 
     * 3. currentNode = Node(value: 2)
     * 
     */

    /**
     * nodeAt(2)
     * 
     * 1. currentNode = Node(value: 1, next: Node(value: 2))
     *  
     * when find with index = 2
     * 
     * 2. -> 1. currentNode = Node(value: 2, next: Node(value: 3))
     *    -> 2. currentIndex = 1
     * 
     * 3. -> 1. currentNode = Node(value: 3)
     *    -> 2. currentIndex = 2
     * 
     */

    /**
     * nodeAt(3)
     * 
     * 1. currentNode = Node(value: 1, next: Node(value: 2))
     *  
     * when find with index = 2
     * 
     * 2. -> 1. currentNode = Node(value: 2, next: Node(value: 3))
     *    -> 2. currentIndex = 1
     * 
     * 3. -> 1. currentNode = Node(value: 3, next: Node(value: 4))
     *    -> 2. currentIndex = 2
     * 
     * 4. -> 1. currentNode = Node(value: 4)
     *    -> 2. currentIndex = 3
     * 
     */
  }

  E? pop() {
    final value = head?.value;
    head = head?.next;

    if (isEmpty) {
      tail = null;
    }

    return value;

    /** 
    * LinkedList(
    *   head: Node(value: 1, next: Node(value : 2, next: Node(value : 3)))),
    *   tail: Node(value: 1)
    * ) 
    * 
    * value =  Node(value: 1)  => head.value
    * head = Node(value: 2)
    *
    * isEmpty  ? tail == null : () =>
    * 
    * return value;
    */
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
    if (isEmpty) return "Empty head";
    return head.toString();
  }
}

void main(List<String> args) {
  final list = LinkedList();

  // list.push(1);
  // list.push(2);
  // list.push(3);

  list.append(1);
  // list.append(2);
  // list.append(3);

  // print(list);
  // list.append(3);

  // print(list.nodeAt(3));

  // print('Before:  $list');

  // final poppedValue = list.pop();

  // print('After:  $list');
  // print('Popped value: $poppedValue');
}
