class Utils {
  static List<String> generateListOfString(int length) {
    return List.generate(length, (index) => 'Item $index');
  }

  static List<String> addNewItemToTheListOfStrings(List<String> items) {
    return items..add('Item ${items.length}');
  }
}
