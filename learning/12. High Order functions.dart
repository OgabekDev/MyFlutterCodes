main() {

  button("OgabekDev",  (name) =>
    "OgabekDev" == name
  );


  print(myFunc("OgabekDev", (value) => true)());
}

// simple function
void simpleFunction() {}

// return function
String returnFunction() {
  return "some text";
}

// high order function
int Function(int) twice(int Function(int) f) {
  return (int x) {
    return f(f(x));
  };
}

void button(String name, bool Function(String) function) {

  var isSuccess = function(name);

  isSuccess ? print("Correct") : print("Incorrect");

}

bool randomFunction(String name, bool Function(String) function) {
  return function(name);
}

bool Function() myFunc(String name, bool Function(int) function) {
  return () {
    return function(1);
  };
}