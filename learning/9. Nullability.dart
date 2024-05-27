import 'dart:io';

main() {

  // User input tye conversation

  print("Enter number");

  // Get user input
  var number = stdin.readLineSync();

  var sum = int.parse(number!) + 100;  // Nullable

  print(sum);



}