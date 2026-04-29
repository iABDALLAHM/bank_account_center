import 'package:bank_account_center/account.dart';

class CheckingAccount extends Account {
  int _balance = 0;

  CheckingAccount({required super.userDetails});
  @override
  String toString() {
    return "The Account Name: ${userDetails.name}";
  }

  @override
  void deposite({required int balance}) {
    _balance += balance;
  }

  @override
  int showBalance() {
    return _balance;
  }

  @override
  void withDraw({required int amount}) {
    if (amount > _balance) {
      _balance -= amount;
    }
  }
}
