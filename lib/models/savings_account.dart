import "../bank_acount_center.dart";

class SavingsAccount extends Account {
  int _balance = 0;

  final int _minBalance = 1000;

  SavingsAccount({required super.userDetails});

  @override
  String toString() {
    return "The Account Name: ${userDetails.name}";
  }

  @override
  int showBalance() {
    return _balance;
  }

  @override
  void deposit({required int balance}) {
    if (balance > 0) {
      _balance += balance;
      print("deposite done");
    }
  }

  @override
  void withdraw({required int amount}) {
    if ((_balance - amount) > _minBalance) {
      _balance -= amount;
      print("withDraw done");
    }
  }
}
