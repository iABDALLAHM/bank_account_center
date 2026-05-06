import "../bank_acount_center.dart";

abstract class Account {
  final UserDetails userDetails;
  Account({required this.userDetails});

  @override
  String toString();

  void deposit({required int balance});

  void withdraw({required int amount});

  int showBalance();
}
