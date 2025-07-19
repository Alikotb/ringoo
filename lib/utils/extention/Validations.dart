

extension EmailValidator on String {
  bool get isEmail {
    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    return emailRegex.hasMatch(this);
  }
}

extension PhoneValidator on String {
  bool get isPhone {
    return RegExp(r'^01[0-9]{9}$').hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool get isPassword {
    final hasLetter = RegExp(r'[A-Za-z]').hasMatch(this);
    final hasNumber = RegExp(r'\d').hasMatch(this);
    return length >= 6 && hasLetter && hasNumber;
  }
}
