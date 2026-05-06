import "../bank_acount_center.dart";

class CheckingAccount extends Account {
  int _balance = 0;

  CheckingAccount({required super.userDetails});
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
    _balance += balance;
  }

  @override
  void withdraw({required int amount}) {
    if (amount <= _balance) {
      _balance -= amount;
    }
  }
}
