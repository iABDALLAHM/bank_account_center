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
}
