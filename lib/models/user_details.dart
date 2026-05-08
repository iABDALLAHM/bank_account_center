// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:crypto/crypto.dart';

class UserDetails {
  final String name;
  final String address;
  final String phoneNumber;
  final String password;
  final String email;

  UserDetails({
    required this.address,
    required this.email,
    required this.name,
    required this.password,
    required this.phoneNumber,
  });

  @override
  String toString() {
    return "UserDetails(name: $name, email: $email, phone: $phoneNumber, address: $address)";
  }

  // String _hashPassword(String password) {
  //   final bytes = utf8.encode(password);
  //   return sha256.convert(bytes).toString();
  // }
}
