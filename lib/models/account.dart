import "../bank_acount_center.dart";

abstract class Account {
  final UserDetails userDetails;
  Account({required this.userDetails});

  @override
  String toString();

  bool deposit({required int balance});

  bool withdraw({required int amount});

  int showBalance();
}
