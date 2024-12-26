class FieldsValidator {
  static String? validatePassword({required String password}) {
    String errorMessage = "";
    if (password.isEmpty) {
      return "This Field is required";
    }
    if (password.length < 6) {
      errorMessage += 'Password must be longer than 6 characters.\n';
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      errorMessage += 'Uppercase letter is missing.\n';
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      errorMessage += 'Lowercase letter is missing.\n';
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      errorMessage += 'Digit is missing.\n';
    }
    if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      errorMessage += 'Special character is missing.\n';
    }
    return errorMessage.isEmpty ? null : errorMessage;
  }

  static String? validateEmail({required String email}) {
    if (email.isEmpty) {
      return 'This field is required';
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  static String? validateEmpty({required String value}) {
    if (value.isEmpty) {
      return "This field is required";
    }
    return null;
  }
}
