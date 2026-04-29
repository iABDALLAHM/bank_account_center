import 'dart:io';
import 'package:bank_account_center/bank_system.dart';
import 'package:bank_account_center/checking_account.dart';
import 'package:bank_account_center/savings_account.dart';
import 'package:bank_account_center/user_details.dart';

class BankSystemCli {
  BankSystem bankSystem = BankSystem(accounts: []);
  late SavingsAccount newSavingsAccount;
  late CheckingAccount newCheckingAccount;

  void start() {
    while (true) {
      _showMenu();
      String? choice = stdin.readLineSync();
      if (choice == "1") {
        _createNewSavingAccount();
      } else if (choice == "2") {
        _createNewCheckingAccount();
      } else if (choice == "3") {
        _previewAllAccounts();
      } else if (choice == "4") {
        _enterToYourSavingAccount();
      } else if (choice == "5") {
        _enterToYourCheckingAccount();
      } else if (choice == "6") {
        print("Bank System Closed\n");
        break;
      }
    }
  }

  void _showMenu() {
    print("========EG-Bank System=============");
    print("Please Choose From These Options:\n");

    print("1. Create New Saving Account");
    print("2. Create New Checking Account");
    print("3. Preview All Accounts");
    print("4. Saving Account");
    print("5. Checking Account");

    print("6. Exist System\n");
  }

  void _enterToYourCheckingAccount() {
    print("please enter your password");
    String password = stdin.readLineSync()!;

    var value = bankSystem.searchByPassword(password: password);
    if (value) {
      print("please Choose: ");

      print("1.WithDraw");
      print("2.Deposite");

      String choice = stdin.readLineSync()!;
      if (choice == "1") {
        print("please enter amount");
        String amount = stdin.readLineSync()!;
        newSavingsAccount.withDraw(amount: int.parse(amount));
      } else if (choice == "2") {
        print("please enter balance");
        String balance = stdin.readLineSync()!;
        newCheckingAccount.deposite(balance: int.parse(balance));
      }
    } else {
      print("You are not exist in this system\n");
    }
  }

  void _enterToYourSavingAccount() {
    print("please enter your password");
    String password = stdin.readLineSync()!;

    var value = bankSystem.searchByPassword(password: password);
    if (value) {
      print("please Choose: ");

      print("1.WithDraw");
      print("2.Deposite");

      String choice = stdin.readLineSync()!;
      if (choice == "1") {
        print("please enter amount");
        String amount = stdin.readLineSync()!;
        newSavingsAccount.withDraw(amount: int.parse(amount));
      } else if (choice == "2") {
        print("please enter balance");
        String balance = stdin.readLineSync()!;
        newCheckingAccount.deposite(balance: int.parse(balance));
      }
    } else {
      print("You are not exist in this system\n");
    }
  }

  void _previewAllAccounts() {
    print(
      "This is All Accounts in The System: ${bankSystem.previewAllAccounts()}",
    );
  }

  void _createNewCheckingAccount() {
    print("plaese enter your name:");
    String name = stdin.readLineSync()!;

    print("plaese enter your email:");
    String email = stdin.readLineSync()!;

    print("plaese enter your address:");
    String address = stdin.readLineSync()!;

    print("plaese enter your phoneNumber:");
    String phoneNumber = stdin.readLineSync()!;

    print("plaese enter your password:");
    String password = stdin.readLineSync()!;
    newCheckingAccount = CheckingAccount(
      userDetails: UserDetails(
        email: email,
        address: address,
        phoneNumber: phoneNumber,
        password: password,
        name: name,
      ),
    );
    bankSystem.addNewAccount(newAccount: newCheckingAccount);
    print("Checking Account Created Successful\n");
  }

  void _createNewSavingAccount() {
    print("plaese enter your name:");
    String name = stdin.readLineSync()!;

    print("plaese enter your email:");
    String email = stdin.readLineSync()!;

    print("plaese enter your address:");
    String address = stdin.readLineSync()!;

    print("plaese enter your phoneNumber:");
    String phoneNumber = stdin.readLineSync()!;

    print("plaese enter your password:");
    String password = stdin.readLineSync()!;

    newSavingsAccount = SavingsAccount(
      userDetails: UserDetails(
        email: email,
        address: address,
        phoneNumber: phoneNumber,
        password: password,
        name: name,
      ),
    );
    bankSystem.addNewAccount(newAccount: newSavingsAccount);
    print("Saving Account Created Successful\n");
  }
}
