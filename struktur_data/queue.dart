class CreateQueue {
  List<String> _queue = [];

  List<String> queue() => _queue;

  void enqueue(String newItem) {
    _queue.insert(0, newItem);
  }

  void dequeue() {
    _queue.removeAt(_queue.length - 1);
  }

  String peek() {
    return _queue.last;
  }

  int size() {
    return _queue.length;
  }
}

void main() {
  final newQueue = CreateQueue();

  newQueue.enqueue("Avengers");
  newQueue.enqueue("Dark");
  newQueue.enqueue("Lupin");
  newQueue.enqueue("The sherlock holmes");

  newQueue.dequeue();

  print(newQueue.peek());
  print(newQueue.size());
}
