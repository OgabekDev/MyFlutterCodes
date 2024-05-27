import 'dart:io';

main() {

  // User input
  print("Enter your name");

  // Allow user to enter their name
  var name = stdin.readLineSync();   // -> This is only for String

  print("Hello $name");

}