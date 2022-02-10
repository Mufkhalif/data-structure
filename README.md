
# Interview Question in DataStructure (ARRAY)


1.3 
URLify: Write a method to replace all spaces in a string with '%20'. You may assume that the string
has sufficient space at the end to hold the additional characters, and that you are given the "true"
length of the string. (Note: If implementing in Java, please use a character array so that you can
perform this operation in place.) 

answer

```dart
var data = "selamat datang kembali";

String replaceString(String word) {
  return word.replaceAll(" ", "%");
}

void main(List<String> args) {
  print(replaceString(data));
}
```

<br>

1.4 Palindrome Permutation: Given a string, write a function to check if it is a permutation of a palindrome. A palindrome is a word or phrase that is the same forwards and backwards. A permutation
is a rearrangement of letters. The palindrome does not need to be limited to just dictionary words.
EXAMPLE
Input: Tact Coa
Output: True (permutations : "taco cat" , "atco eta" , etc. )
Hints: #106, h 0134, § 136


```dart
bool isPalindrom(String word) {
  return word == word.split("").toList().reversed.join();
}

void main(List<String> args) {
  print(isPalindrom("harimau"));
}
```
<br>


1.5 One Away: There are three types of edits that can be performed on strings: insert a character,
remove a character, or replace a character. Given two strings, write a function to check if they are
one edit (or zero edits) away.

Example:

pale , pie - > true <br>
pales , pale - > true <br>
pale , bale - > true <br>
pale , bake - > false <br>

Hints: #23, #97, it 130

```dart

bool oneAwayCheck(String shortStr, String longStr) {
  int offset = 0;

  for (var i = 0; i < longStr.length; i++) {
    if (offset == 1 && i == longStr.length - 1) {
      break;
    }

    if (shortStr[i] != longStr[i] && offset == 0) {
      offset++;
    }

    if (shortStr[i] != longStr[i + offset] && offset == 0) {
      return false;
    }
  }

  return true;
}

void main(List<String> args) {
  print(oneAwayCheck("selamat", "bekamar"));
}
```
<br>


1.6 String Compression: Implement a method to perform basic string compression using the counts
of repeated characters. For example, the string aabcccccaaa would become a2blc5a3, If the
"compressed" string would not become smaller than the original string, your method should return
the original string. You can assume the string has only uppercase and lowercase letters (a - z).
Hints: #92, if 110 


```dart
String countStringbyWord(String query) {
  var listString = query.split("").toList();
  var result = "", current = "", currentNumb = 1;

  for (var i = 0; i < listString.length; i++) {
    if (current.isEmpty) {
      current = listString[i];
      result = "$current$currentNumb";
    } else if (listString[i] == current) {
      currentNumb++;
      result = "${result.substring(0, result.length - 2)}$current$currentNumb";
    } else {
      current = listString[i];
      currentNumb = 1;
      result = "$result$current$currentNumb";
    }
  }
  return result;
}

void main(List<String> args) {
  print(countStringbyWord("aabcccccaaa"));
}
```
<br>

1.7 Rotate Matrix: Given an image represented by an NxN matrix, where each pixel in the image is 4
bytes, write a method to rotate the image by 90 degrees. Can you do this in place?
Hints: «51,0100 

```dart
void drawCube() {
  var items = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];

  for (var i = 0; i < items.length; i++) {
    var result = "";

    for (var j = 0; j < items[i].length; j++) {
      result = result + " " + items[i][j].toString();
    }

    print(result);
  }
}
```

<br>
<br>

# Interview Question in DataStructure (LINKEDLIST)

2.1 Remove Dups: Write code to remove duplicates from an unsorted linked list.
FOLLOW UP
How would you solve this problem if a temporary buffer is not allowed?
Hints: #9, #40 

```
NOT_ANSWERED
```

<br>

2.3 Delete Middle Node: Implement an algorithm to delete a node in the middle (i.e., any node but
the first and last node, not necessarily the exact middle) of a singly linked list, given only access to
that node.
EXAMPLE
Input: the node c from the linked list a - >b- >c - >d - >e- > f
Result: nothing is returned, but the new linked list looks like a->b->d->e-> f
Hints: #72

```dart

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

  @override
  String toString() {
    if (head == null) return "it's Empty head";
    return head.toString();
  }
}

void main(List<String> args) {
  final list = LinkedList();

  list.push(1);
  list.push(2);
  list.push(3);
  list.push(4);
  list.push(5);

  print('Before: $list');

  final node = list.nodeAt(2);
  final removedValue = list.removeAfter(node!);

  print('After:  $list');
  print('Removed value: $removedValue');
}

```
<br>


2.4 Partition: Write code to partition a linked list around a value x, such that all nodes less than x come
before all nodes greater than or equal to x. Ifxis contained within the list, the values of x only need
to be after the elements less than x (see below). The partition element x can appear anywhere in the
"right partition"; it does not need to appear between the left and right partitions.

EXAMPLE
Input: 3 -> 5 -> 8 -> 5 -> 10 -> 2 -> 1 [partition = 5]
Output: 3 -> 1 -> 2 -> 10 -> 5 -> 5 -> 8
Hints: #3, #24 


```DART
/**
* NOT_ANSWERED
/
```
<br>

2.5 Sum Lists: You have two numbers represented by a linked list, where each node contains a single
digit. The digits are stored in reverse order, such that the Vs digit is at the head of the list. Write a
function that adds the two numbers and returns the sum as a linked list.
EXAMPLE
Input: (7- > 1 -> 6) + (5 -> 9 -> 2).That is,617 + 295.
Output: 2 -> 1 -> 9. That is, 912.
FOLLOW UP
Suppose the digits are stored in forward order. Repeat the above problem.
EXAMPLE
Input: (6 -> 1 -> 7) + (2 -> 9 -> 5).That is, 617 + 295,
Output:9 -> 1 -> 2,Thatis

```dart
class LinkedList {
  /* ......... ALL DEFINITION CLASS LinkedList BEFORE*/

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
}

```