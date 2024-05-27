import 'dart:io';

main() {

  List<Person> users = [];

  while(true) {
    print("\n1. Login");
    print("2. Register");

    var input = stdin.readLineSync();

    try {
      switch (int.parse(input!)) {
        case 1:
          print("\nWhat is your login?");
          var login = stdin.readLineSync()!;
          print("What is your password?");
          var password = stdin.readLineSync()!;

          if (users.isEmpty) {
            print("!!! Wrong Credentials\n");
            continue;
          }

          for (var user in users) {
            if (user.userLogin(login, password)) {
              system(users, user.id);
            } else {
              print("!!! Wrong Credentials\n");
              continue;
            };
          }
          break;
        case 2:
          print("\nWhat is your full name?");
          var name = stdin.readLineSync()!;
          print("What is your login?");
          var login = stdin.readLineSync()!;
          print("What is your password?");
          var password = stdin.readLineSync()!;
          var user = Person(login: login, password: password, fullName: name);
          users.add(user);
          system(users, user.id);
          break;
        default:
          continue;
      }
    } catch (error) {
      print("$error");
      continue;
    }
  }

}

List<Person> system(List<Person> users, int id) {

  var stillRunning = true;
  while(stillRunning) {

    print("\n1. My info");
    print("2. My cards");
    print("3. Add card");
    print("4. Remove card");
    print("5. Withdraw money");
    print("6. Transfer money");
    print("7. Log out");
    print("8. Delete account");

    try {

      switch (int.parse(stdin.readLineSync()!)) {
        case 1:
          users.firstWhere((user) => user.id == id).printInfo();
          break;
        case 2:
          var count = 0;
          for (var card in users.firstWhere((user) => user.id == id).cards) {
            card.printInfo(count++);
          }
          break;
        case 3:
          print("Enter your card number");
          var cardNumber = stdin.readLineSync()!;

          print("Enter your card expire date");
          var expireDate = stdin.readLineSync()!;

          print("Enter your card balance");
          var balance = double.parse(stdin.readLineSync()!);

          print("Enter your card code");
          var code = int.parse(stdin.readLineSync()!);

          var card = Card(cardNumber: cardNumber, expireDate: expireDate, balance: balance, code: code);
          users.firstWhere((user) => user.id == id).addCard(card);
          print("\nCard successfully added\n");

          break;
        case 4:

          var count = 0;
          for (var card in users.firstWhere((user) => user.id == id).cards) {
            card.printInfo(count++);
          }

          print("Enter your card code");
          var index = int.parse(stdin.readLineSync()!);

          print("Enter your card code");
          var code = int.parse(stdin.readLineSync()!);

          if (users.firstWhere((user) => user.id == id).cards[index].checkCode(code)) {
            users.firstWhere((user) => user.id == id).removeCard(index);
            print("Your card has been deleted");
          } else {
            print("Wrong code");
          }

          break;
        case 5:
          var count = 0;
          for (var card in users.where((user) => user.id == id).first.cards) {
            card.printInfo(count);
          }

          print("\nChoose the number");
          var index = int.parse(stdin.readLineSync()!);

          print("Enter the amount");
          var amount = double.parse(stdin.readLineSync()!);

          print("Enter the card code");
          var code = int.parse(stdin.readLineSync()!);

          if (users.firstWhere((user) => user.id == id).cards[index].checkCode(code)) {
            users.firstWhere((user) => user.id == id).cards[index].withdraw(amount);
            print("Done");
          } else {
            print("Wrong code");
          }

          break;
        case 6:

          var count = 0;
          for (var card in users.where((user) => user.id == id).first.cards) {
            card.printInfo(count);
          }

          print("\nChoose the number");
          var number = int.parse(stdin.readLineSync()!);

          print("Which card do you want to transfer");
          var cardNumber = stdin.readLineSync()!;

          print("Enter the amount");
          var amount = double.parse(stdin.readLineSync()!);

          users.firstWhere((user) => user.id == id).cards[number].withdraw(amount);
          users.firstWhere((user) => user.cards.firstWhere((card) => card.cardNumber == cardNumber).cardNumber == cardNumber).cards.firstWhere((card) => card.cardNumber == cardNumber).addFunds(amount);

          print("Done");

          break;
        case 7:
          stillRunning = false;
          break;
        case 8:
          users.remove(users.firstWhere((user) => user.id == id));
          stillRunning = false;
          break;
        default:
          continue;
      }

    } catch (error) {
      print(error);
      continue;
    }

  }
  return users;
}

class Person {
  var id = DateTime.now().millisecondsSinceEpoch;
  late String login;
  late String password;
  late String fullName;
  List<Card> cards = [];

  Person({
    required this.login,
    required this.password,
    required this.fullName
  });

  userLogin(String login, password) => this.login == login && this.password == password;

  addCard(Card card) => cards.add(card);

  removeCard(int index) => cards.removeAt(index);

  printInfo() {
    print("\nName: $fullName");
    print("Login: $login");
    print("Password: $password\n");
  }

}

class Card {

  var id = DateTime.now().millisecondsSinceEpoch;
  final String cardNumber;
  final String expireDate;
  late double _balance;
  late int _code;

  Card({
    required this.cardNumber,
    required this.expireDate,
    required double balance,
    required int code
  }) {
    this._balance = balance;
    this._code = code;
  }

  withdraw(double amount) => this._balance -= amount;

  addFunds(double amount) => this._balance += amount;

  checkCode(int code) => this._code == code;

  printInfo(int id) {
    print("\n$id.\nCard Number: $cardNumber");
    print("Expire date: $expireDate");
    print("Balance: $_balance");
    print("Code: $_code\n");
  }

}