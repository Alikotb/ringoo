import 'package:ringoo/utils/extention/Validations.dart';
import 'package:rxdart/rxdart.dart';

class RegisterViewModel {
  final subject = BehaviorSubject<String>();

  Stream<String> get stream => subject.stream;

  void dispose() {
    subject.close();
  }

  void inputValidation(
    String email,
    String password,
    String confirmPassword,
    String phone,
    String name,
  ) {
    if (email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        phone.isEmpty ||
        name.isEmpty) {
      subject.addError("All fields are required");
      return;
    }
    if (!email.isEmail) {
      subject.addError("Invalid email");
      return;
    }
    if (!password.isPassword) {
      subject.addError("Password must be at least 6 characters and numbers");
      return;
    }
    if (password != confirmPassword) {
      subject.addError("Passwords do not match");
      return;
    }
    if (!phone.isPhone) {
      subject.addError("Invalid phone number");
      return;
    }
    if (name.length < 3) {
      subject.addError("Name must be at least 3 characters");
      return;
    }
    subject.add("Success");
  }
}
