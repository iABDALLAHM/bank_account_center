import 'dart:io';
import "../bank_acount_center.dart";

UserDetails? collectUserDetails() {
  print("please enter your name:");
  String? name = stdin.readLineSync();

  print("please enter your email:");
  String? email = stdin.readLineSync();

  print("please enter your address:");
  String? address = stdin.readLineSync();

  print("please enter your phoneNumber:");
  String? phoneNumber = stdin.readLineSync();

  print("please enter your password:");
  String? password = stdin.readLineSync();
  if (name == null ||
      email == null ||
      address == null ||
      phoneNumber == null ||
      password == null) {
    return null;
  }
  return UserDetails(
    name: name,
    email: email,
    address: address,
    phoneNumber: phoneNumber,
    password: password,
  );
}
