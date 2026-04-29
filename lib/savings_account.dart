import 'package:bank_account_center/account.dart';

class SavingsAccount extends Account {
  int _balance = 0;

  final int _minBalance = 1000;

  SavingsAccount({required super.userDetails});

  @override
  String toString() {
    return "The Account Name: ${userDetails.name}";
  }

  @override
  void deposite({required int balance}) {
    if (balance > 0) {
      _balance += balance;
      print("deposite done");
    }
  }

  @override
  int showBalance() {
    return _balance + _minBalance;
  }

  @override
  void withDraw({required int amount}) {
    if ((_balance - amount) > _minBalance) {
      _balance -= amount;
      print("withDraw done");
    }
  }
}
