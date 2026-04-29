class UserDetails {
  String? _name;
  String? _address;
  String? _phoneNumber;
  String? _password;
  String? _email;

  UserDetails({
    required String email,
    required String address,
    required String phoneNumber,
    required String password,
    required String name,
  }) {
    _name = name;
    _address = address;
    _email = email;
    _password = password;
    _phoneNumber = phoneNumber;
  }

  set name(String name) {
    _name = name;
  }

  String? get name {
    return _name;
  }

  set address(String address) {
    _address = address;
  }

  String? get address {
    return _address;
  }

  set phoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
  }

  String? get phoneNumber {
    return _phoneNumber;
  }

  set password(String password) {
    _password = password;
  }

  String? get password {
    return _password;
  }

  set email(String email) {
    _email = email;
  }

  String? get email {
    return _email;
  }
}
