abstract class BankSystemInterface<T> {
  void addNewAccount({required T newAccount});
  List<T> previewAllAccounts();
  void searchByPassword({required String password});
}
