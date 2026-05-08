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
          _enterToYourAccount(accountType: AccountType.savingAccount);
          break;

        case MenuOptions.enterToYourCheckingAccount:
          _enterToYourAccount(accountType: AccountType.checkingAccount);
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

  void _enterToYourAccount({required AccountType accountType}) {
    switch (accountType) {
      case AccountType.savingAccount:
        String? password = inputHandler.readLine(
          label: "please enter your password",
        );

        if (password == null) {
          bankSystemView.showMessage(message: "invalid Input\n");
          return;
        }

        var account = bankSystem.findAccountByPassword(password: password);
        if (account == null) {
          bankSystemView.showMessage(
            message: "You do not exist in this system\n",
          );
          return;
        }

        bankSystemView.showMessage(message: "please Choose: \n");
        String? choice = inputHandler.readLine(label: "1.WithDraw\n2.Deposite");

        if (choice == null) {
          bankSystemView.showMessage(message: "invalid Input\n");
          return;
        }

        if (choice == "1") {
          String input =
              inputHandler.readLine(label: "please enter amount") ?? "";
          int? amount = int.tryParse(input);
          if (amount == null || amount <= 0) {
            print("Invalid amount. Please enter a positive number.");
            return;
          }

          account.withdraw(amount: amount);
        }

        if (choice == "2") {
          String input =
              inputHandler.readLine(label: "please enter balance") ?? "";
          int? balance = int.tryParse(input);
          if (balance == null || balance <= 0) {
            print("Invalid amount. Please enter a positive number.");
            return;
          }

          account.deposit(balance: balance);
        }

      case AccountType.checkingAccount:
        String? password = inputHandler.readLine(
          label: "please enter your password",
        );

        if (password == null) {
          bankSystemView.showMessage(message: "invalid Input\n");
          return;
        }

        var account = bankSystem.findAccountByPassword(password: password);
        if (account == null) {
          bankSystemView.showMessage(
            message: "You do not exist in this system\n",
          );
          return;
        }

        bankSystemView.showMessage(message: "please Choose: \n");
        String? choice = inputHandler.readLine(label: "1.WithDraw\n2.Deposite");

        if (choice == null) {
          bankSystemView.showMessage(message: "invalid Input\n");
          return;
        }

        if (choice == "1") {
          String input =
              inputHandler.readLine(label: "please enter amount") ?? "";
          int? amount = int.tryParse(input);
          if (amount == null || amount <= 0) {
            print("Invalid amount. Please enter a positive number.");
            return;
          }
          account.withdraw(amount: amount);
        }

        if (choice == "2") {
          String input =
              inputHandler.readLine(label: "please enter balance") ?? "";
          int? balance = int.tryParse(input);
          if (balance == null || balance <= 0) {
            print("Invalid amount. Please enter a positive number.");
            return;
          }

          account.deposit(balance: balance);
        }
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
    }
  }

  void addToSystem({required Account newAccount}) {
    var result = bankSystem.addNewAccount(newAccount: newAccount);
    if (result) {
      bankSystemView.showMessage(message: "Account Created Successful\n");
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
