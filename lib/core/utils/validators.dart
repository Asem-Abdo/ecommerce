import 'dart:math';

class Validators {
  Validators._();

  static String? validateEmail(String? val) {
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (val == null || val.trim().isEmpty) {
      return 'Email is required';
    } else if (emailRegex.hasMatch(val) == false) {
      return 'Invalid email';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    final RegExp passwordRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8 || !passwordRegex.hasMatch(value)) {
      return 'Strong password please';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    } else if (value != password) {
      return 'Password does not match';
    } else {
      return null;
    }
  }

  static String? validateUserName(String? value) {
    final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9]{4,24}$');
    if (value == null || value.isEmpty) {
      return 'Username is required';
    } else if (!usernameRegex.hasMatch(value)) {
      return 'Invalid username';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? value) {
    final RegExp phoneRegex = RegExp(r'^[0-9]{10}$');
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (value.trim().length != 11) {
      return 'Phone number must be 11 digits';
    } else {
      return null;
    }
  }
}
