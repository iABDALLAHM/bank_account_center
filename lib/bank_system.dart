import 'package:bank_account_center/account.dart';
import 'package:bank_account_center/bank_system_interface.dart';

class BankSystem implements BankSystemInterface<Account> {
  static final String _bankName = "EG-Bank";
  List<Account> accounts;
  BankSystem({required this.accounts});

  @override
  void addNewAccount({required Account newAccount}) {
    accounts.add(newAccount);
  }

  @override
  List<Account> previewAllAccounts() {
    return accounts;
  }

  @override
  bool searchByPassword({required String password}) {
    for (var account in accounts) {
      if (account.userDetails.password == password) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
