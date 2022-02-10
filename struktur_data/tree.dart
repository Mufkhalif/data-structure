class TreeNode<T> {
  TreeNode(this.value);
  T value;
  List<TreeNode<T>> children = [];

  void add(TreeNode<T> child) {
    children.add(child);
  }

  void show() {
    var listChildren = [];

    for (var item in children) {
      listChildren.add(item.value);
    }

    print(value.toString() + " => " + (listChildren.join(", ")));
  }
}

void main() {
  final beverages = TreeNode('Beverages');
  final hot = TreeNode('Hot');
  final cold = TreeNode('Cold');

  hot.add(TreeNode("Hot 1"));
  hot.add(TreeNode("Hot 2"));
  hot.add(TreeNode("Hot 3"));

  cold.add(TreeNode("Cold 1"));
  cold.add(TreeNode("Cold 2"));
  cold.add(TreeNode("Cold 3"));

  beverages.add(cold);
  beverages.add(hot);

  beverages.show();
}
