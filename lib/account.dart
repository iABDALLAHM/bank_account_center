import 'package:bank_account_center/user_details.dart';

abstract class Account {
  UserDetails userDetails;
  Account({required this.userDetails});

  @override
  String toString();

  void deposite({required int balance});

  void withDraw({required int amount});

  int? showBalance();
}
