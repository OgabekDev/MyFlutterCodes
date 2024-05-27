main() {

  myFunc();

  var someText = myFuncWithReturn();
  print(someText);

  var sum = myFuncWithArguments(10, 15);
  print(sum);

}

myFunc() {
  print("This is my first function");
}

myFuncWithReturn() {
  return "This is return function";
}

myFuncWithArguments(int firstNumber, int secondNumber) {
  return firstNumber + secondNumber;
}