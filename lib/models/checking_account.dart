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
  bool deposit({required int balance}) {
    if (balance > 0) {
      _balance += balance;
      return true;
    }
    return false;
  }

  @override
  bool withdraw({required int amount}) {
    if (amount <= _balance) {
      _balance -= amount;
      return true;
    }
    return false;
  }
}
