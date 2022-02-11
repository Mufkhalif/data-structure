class Node {
  Node({required this.name, required this.neightbors});

  final String name;
  final List<Node> neightbors;

  void addNeightbors(Node key) {
    this.neightbors.add(key);
  }

  @override
  String toString() {
    if (neightbors.isEmpty) return '{ key: $name }';
    return '{ name: $name, neightbors: $neightbors}';
  }
}

class CreateGraph {
  CreateGraph(this.isDirected);

  List<Node> nodes = [];
  List<String> edges = [];

  final bool isDirected;

  void push(String value) {
    nodes.add(Node(name: value, neightbors: []));
  }

  Node? getNode(String value) {
    return nodes.firstWhere((element) => element.name == value);
  }

  void addEdges(String str1, String str2) {
    final node1 = this.getNode(str1);
    final node2 = this.getNode(str2);

    if (node1 == null) {
      return print("Graph 1 not found");
    }

    if (node2 != null) {
      node1.addNeightbors(node2);

      if (!isDirected) {
        node2.addNeightbors(node1);
      }
    } else {
      return print("Graph 2 not found");
    }
  }

  void show() {
    for (var item in nodes) {
      var listString = [];
      for (var neightbor in item.neightbors) {
        listString.add(neightbor.name);
      }
      print(item.name + " => " + listString.join(", ").toString());
    }
  }
}

void main(List<String> args) {
  final graph = CreateGraph(true);

  graph.push("Amel");
  // graph.push("Carla");
  // graph.push("Ridwan");

  graph.addEdges("Amel", "Carla");
  graph.addEdges("Amel", "Ridwan");

  graph.show();
}
