import 'package:bank_account_center/cli/bank_system_cli.dart';
import 'package:bank_account_center/models/bank_system.dart';
import 'package:bank_account_center/models/bank_system_view.dart';
import 'package:bank_account_center/models/input_handler.dart';

void main() {
  BankSystemCli bankAccountCenterCli = BankSystemCli(
    bankSystem: BankSystem(accounts: []),
    bankSystemView: BankSystemView(),
    inputHandler: InputHandler(),
  );
  bankAccountCenterCli.start();
}
