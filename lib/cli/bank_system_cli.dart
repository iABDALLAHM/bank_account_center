import "../bank_acount_center.dart";

class BankSystemCli {
  final BankSystemInterface bankSystem;
  final BankSystemView bankSystemView;
  final InputHandler inputHandler;
  bool isRunning;
  BankSystemCli({
    this.isRunning = true,
    required this.bankSystem,
    required this.bankSystemView,
    required this.inputHandler,
  });

  void start() {
    while (isRunning) {
      _showMenu();
      String? choice = inputHandler.readLine(
        label: "please choose from these:\n",
      );
      switch (choice) {
        case MenuOptions.createSavingAccount:
          createNewAccount(accountType: AccountType.savingAccount);
          break;

        case MenuOptions.createCheckingAccount:
          createNewAccount(accountType: AccountType.checkingAccount);
          break;

        case MenuOptions.previewAllAccounts:
          _previewAllAccounts();
          break;

        case MenuOptions.enterToYourSavingAccount:
        case MenuOptions.enterToYourCheckingAccount:
          _enterToYourAccount();
          break;

        case MenuOptions.exit:
          _exitSystem();
          break;

        default:
          bankSystemView.showMessage(message: "invalid Input\n");
          break;
      }
    }
  }

  void _enterToYourAccount() {
    var account = authenticateAccount();

    if (account == null) {
      bankSystemView.showMessage(message: "You do not exist in this system\n");
      return;
    }

    handleOperations(existAccount: account);
  }

  Account? authenticateAccount() {
    String? password = inputHandler.readLine(
      label: "Please enter your password",
    );

    if (password == null) {
      bankSystemView.showMessage(message: "invalid Input\n");
      return null;
    }

    var account = bankSystem.findAccountByPassword(password: password);
    return account;
  }

  void handleOperations({required Account existAccount}) {
    bankSystemView.showMessage(message: "Please Choose: \n");
    String? choice = inputHandler.readLine(label: "1.WithDraw\n2.Deposite");

    if (choice == null) {
      bankSystemView.showMessage(message: "invalid Input\n");
      return;
    }

    if (choice == "1") {
      handleWithdraw(existAccount: existAccount);
    }

    if (choice == "2") {
      handleDeposit(existAccount: existAccount);
    }
  }

  void handleDeposit({required Account existAccount}) {
    String input =
        inputHandler.readLine(label: "Please enter the balance") ?? "";
    int? balance = int.tryParse(input);
    if (balance == null || balance <= 0) {
      bankSystemView.showMessage(
        message: "Invalid amount. Please enter a positive number.\n",
      );
      return;
    }

    var result = existAccount.deposit(balance: balance);

    if (result) {
      bankSystemView.showMessage(message: "Operation Done\n");
      return;
    }

    if (result == false) {
      bankSystemView.showMessage(message: "Operation Not successful\n");
      return;
    }
  }

  void handleWithdraw({required Account existAccount}) {
    String input =
        inputHandler.readLine(label: "Please enter the amount") ?? "";
    int? amount = int.tryParse(input);
    if (amount == null || amount <= 0) {
      bankSystemView.showMessage(
        message: "Invalid amount. Please enter a positive number.\n",
      );
      return;
    }

    var result = existAccount.withdraw(amount: amount);
    if (result) {
      bankSystemView.showMessage(message: "Operation Done\n");
      return;
    }

    if (result == false) {
      bankSystemView.showMessage(message: "Operation not successful\n");
      return;
    }
  }

  void createNewAccount({required AccountType accountType}) {
    switch (accountType) {
      case AccountType.savingAccount:
        var userDetails = collectUserDetails();

        if (userDetails == null) {
          bankSystemView.showMessage(message: "invalid Input\n");
          return;
        }

        final newSavingsAccount = SavingsAccount(
          userDetails: UserDetails(
            email: userDetails.email,
            address: userDetails.address,
            phoneNumber: userDetails.phoneNumber,
            password: userDetails.password,
            name: userDetails.name,
          ),
        );

        addToSystem(newAccount: newSavingsAccount);
        break;

      case AccountType.checkingAccount:
        var userDetails = collectUserDetails();

        if (userDetails == null) {
          bankSystemView.showMessage(message: "invalid Input\n");
          return;
        }

        final newCheckingAccount = CheckingAccount(
          userDetails: UserDetails(
            email: userDetails.email,
            address: userDetails.address,
            phoneNumber: userDetails.phoneNumber,
            password: userDetails.password,
            name: userDetails.name,
          ),
        );

        addToSystem(newAccount: newCheckingAccount);
        break;
    }
  }

  void addToSystem({required Account newAccount}) {
    var result = bankSystem.addNewAccount(newAccount: newAccount);
    if (result) {
      bankSystemView.showMessage(message: "Account Created Successfully\n");
    } else {
      bankSystemView.showMessage(message: "This Account is Already Exist\n");
    }
  }

  void _previewAllAccounts() {
    bankSystemView.showMessage(
      message:
          "This is All Accounts in The System: ${bankSystem.previewAllAccounts()}",
    );
  }

  void _exitSystem() {
    isRunning = false;
    bankSystemView.showMessage(message: "Bank System Closed\n");
  }

  void _showMenu() {
    bankSystemView.showMessage(message: "========EG-Bank System========\n");
    bankSystemView.showMessage(message: "please Choose From These Options:\n");
    bankSystemView.showMessage(message: "1. Create New Saving Account");
    bankSystemView.showMessage(message: "2. Create New Checking Account");
    bankSystemView.showMessage(message: "3. Preview All Accounts");
    bankSystemView.showMessage(message: "4. Saving Account");
    bankSystemView.showMessage(message: "5. Checking Account");
    bankSystemView.showMessage(message: "6. Exit System\n");
  }
}