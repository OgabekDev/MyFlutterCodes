main() {

  // Maps  Key/Value pairs
  var map = {"Ogabek" : "Matyakubov", "Ben" : "Wilson"};
  print(map);
  print(map["Ogabek"]);

  // Show keys
  print(map.keys);

  // Show values
  print(map.values);

  // Show length
  print(map.length);

  // Add item
  map["Key"] = "Value";
  print(map);

  // Add many item
  map.addAll({"Key1" : "Value1", "Key2" : "Value2"});
  print(map);

  // Remove item
  map.remove("Key");
  print(map);

  // Clear map
  map.clear();
  print(map);

}