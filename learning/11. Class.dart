main() {

  var ogabekdev = Person(fullName: "Ogabek Matyakubov", age: 20, sex: Sex.Male);
  ogabekdev.showDate();
}

class Person {
  String fullName;
  int age;
  Sex sex;


  Person({
    required this.fullName,
    required this.age,
    required this.sex
  });

  showDate() {
    print("My name is $fullName. I am $age years old. As you know I'm $sex");
  }
}

enum Sex {
  Male,
  Female
}