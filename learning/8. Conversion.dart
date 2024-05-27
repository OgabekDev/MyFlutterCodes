main() {

  // Convert String to Integers and Doubles

  // String to Int
  var intString = "123";
  var intNumber = int.parse(intString);
  var sum = intNumber + 100;
  print(sum);

  // String to Double
  var doubleString = "12.45";
  var doubleNumber = double.parse(doubleString);
  var sumDouble = doubleNumber + 45.8;
  print(sumDouble);

  // Int to String
  doubleString = doubleNumber.toString();
  print(doubleString);

  // Double to String
  intString = intNumber.toString();
  print(intString);

}