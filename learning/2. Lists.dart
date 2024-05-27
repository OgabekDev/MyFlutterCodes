main() {

  // Lists
  var myList = [1, 2, 3];
  print(myList);
  print(myList[0]);

  // Change item
  myList[2] = 41;
  print(myList);

  // Create empty list
  var newList = [];
  print(newList);

  // Add to list
  newList.add(41);
  print(newList);

  // Add multiply to list
  newList.addAll([10, 20, 24]);
  print(newList);

  // Insert a specific position (position, item)
  newList.insert(0, 10203);
  print(newList);
  
  // Insert many elements
  newList.insertAll(1, [11, 12, 13, 14, 15]);
  print(newList);

  // Mixed list
  var mixedList = [1, 2, 3, "John", "Bob", "John"];
  print(mixedList);

  // Remove from list
  mixedList.remove("John");
  print(mixedList);

  // Remove from list by index
  mixedList.removeAt(0);
  print(mixedList);



}