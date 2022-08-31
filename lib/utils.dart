class Utils {
  static List<String> generateListOfString(int length) {
    return List.generate(length, (index) => 'Item $index');
  }
}
