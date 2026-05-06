import "../bank_acount_center.dart";

class BankSystem implements BankSystemInterface {
  final List<Account> _accounts;

  BankSystem({required List<Account> accounts}) : _accounts = accounts;

  @override
  bool addNewAccount({required Account newAccount}) {
    for (var existAccount in _accounts) {
      if (newAccount.userDetails.name == existAccount.userDetails.name) {
        return false;
      }
    }
    _accounts.add(newAccount);
    return true;
  }

  @override
  List<Account> previewAllAccounts() {
    return _accounts;
  }

  @override
  Account? findAccountByPassword({required String password}) {
    for (var account in _accounts) {
      if (account.userDetails.password == password) {
        return account;
      }
    }
    return null;
  }
}
