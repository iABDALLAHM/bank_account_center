import "../bank_acount_center.dart";

abstract class BankSystemInterface {
  bool addNewAccount({required Account newAccount});
  List<Account> previewAllAccounts();
  Account? findAccountByPassword({required String password});
}
