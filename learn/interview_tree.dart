class Tree<T> {
  Tree(this.name);

  T name;
  List<Tree<T>> children = [];

  void push(Tree<T> value) {
    children.add(value);
  }

  void searchTree({
    required T value,
    Tree<T>? tree,
  }) {
    var arr = tree != null ? tree.children : children;

    print(arr);

    var isAlready = false;

    print(isAlready);

    for (var item in arr) {
      if (isAlready) break;

      if (item.name == value) {
        isAlready = true;
        return print(item.name);
      } else {
        if (item.children.isEmpty) {
          print("tidak ada");
        } else {
          this.searchTree(value: value, tree: item);
        }
      }
    }
  }

  void secondSearc(T value) {
    var currentTree = children;

    var index = 0;

    while (currentTree.isNotEmpty) {
      var childIndex = 0;

      print(currentTree);

      currentTree = currentTree[index].children;
      index++;

      // while (childIndex < currentTree.length) {
      //   childIndex++;
      // }

      // currentTree = currentTree[index].children;
      // index++;
    }
  }

  @override
  String toString() {
    if (children.isEmpty) return "$name";
    var result = children.join(" =>, \n").toString();
    return "$name  => $result";
  }
}

void main(List<String> args) {
  final tree = Tree('beverages');
  final cold = Tree('Cold');

  final hot = Tree('Hot');

  hot.push(Tree("Hot 1"));
  hot.push(Tree("Hot 2"));

  cold.push(Tree("Cold 1"));
  cold.push(Tree("Cold 2"));

  tree.push(hot);
  tree.push(cold);

  // tree.searchTree(value: "Hot 1");
  tree.secondSearc("1");
}
