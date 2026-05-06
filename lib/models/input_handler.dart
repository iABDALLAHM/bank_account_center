import 'dart:io';

class InputHandler {
  String? readLine({required String label}) {
    print(label);
    String? input = stdin.readLineSync();
    if (input == null || input.isEmpty) {
      return null;
    }
    return input;
  }
}
