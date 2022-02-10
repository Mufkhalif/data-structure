var data = "selamat datang disini";

String replaceString(String word) {
  return word.replaceAll(" ", "%");
}

bool isPalindrom(String word) {
  return word == word.split("").toList().reversed.join();
}

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

    // print(result);
  }

  var newItems = [];

  for (var i = 0; i < items.length; i++) {
    var newItem = [];

    for (var j = 0; j < items[i].length; j++) {
      if (items[i][j] == 7) {
        newItem.add(items[i][j]);
      } else if (items[i][j] - 7 == 3) {
        print(items[i][j]);
      }
    }
    // }

    print(newItem);
  }
}

void main(List<String> args) {
  // print(countStringbyWord("aabcccccaaa"));

  drawCube();
}
