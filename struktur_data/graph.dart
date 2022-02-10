class Node {
  final String key;
  final List<Node> neightbors;

  Node({
    required this.key,
    required this.neightbors,
  });

  void addNeightbors(Node key) {
    this.neightbors.add(key);
  }

  @override
  String toString() {
    return '{ key: $key, neightbors: $neightbors}';
  }
}

class CreateGraph {
  List<Node> nodes = [];
  List<String> edges = [];

  final directed = false;

  void addNode(String key) {
    final newNode = Node(key: key, neightbors: []);
    nodes.add(newNode);
  }

  Node getNode(String key) {
    return nodes.firstWhere((element) => element.key == key);
  }

  void addEdge(String node1Key, String node2Key) {
    final node1 = this.getNode(node1Key);
    final node2 = this.getNode(node2Key);

    node1.addNeightbors(node2);

    if (!directed) {
      node2.addNeightbors(node1);
    }
  }

  void show() {
    for (var item in nodes) {
      var listString = [];

      for (var neightbor in item.neightbors) {
        listString.add(neightbor.key);
      }

      print(item.key + " => " + listString.join(", ").toString());
    }
  }
}

void main() {
  final graph = CreateGraph();

  graph.addNode("Amel");
  graph.addNode("Carla");
  graph.addNode("Rayzen");
  graph.addNode("Fadli");

  graph.addEdge("Amel", "Rayzen");
  graph.addEdge("Rayzen", "Carla");
  graph.addEdge("Amel", "Fadli");

  graph.show();
}
