class Validators {
  //to have all validators in one class

  static String? validatePassword(String? val) {
    {
      // Check if the PIN Code input is empty.
      if (val!.isEmpty) {
        return 'PIN Code is Empty';
      }
      // Check if the length of the PIN Code is less than 6 characters.
      else if (val.length < 6) {
        return 'PIN Code Must Be 6 Chars at least';
      }
      // If the PIN Code isn't empty and has a length of at least 6 characters, return null (indicating no errors).
      else {
        return null;
      }
    }
  }
  static String? nameValidate(String value, context) {
    if (value.isEmpty) {
      return 'Name Is Empty';
    } else {
      return null;
    }
  }
  static String? validateEmail(String? value) {
    {
      // A regular expression pattern to match valid email addresses.
      final RegExp emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
      );

      // Check if the email input is empty.
      if (value!.isEmpty) {
        return 'Email Address Is Empty';
      } else {
        // Check if the provided email doesn't match the regular expression pattern.
        if (!emailRegex.hasMatch(value)) {
          return 'Email Address is Not Valid';
        }
        // If the email input isn't empty and matches the regex pattern, return null (indicating no errors).
        return null;
      }
    }
  }

  static String? confirmPasswordValidate(String value, String value2, context) {
    // Check if the PIN code input is empty
    if (value!.isEmpty) {
      return 'PIN Code is Empty';
    } else if (value.length < 6) {
      // Validate if the length of the PIN code is less than 6 characters
      return 'PIN Code Must Be 6 Chars at least';
    } else if (value != value2) {
      // Validate if the length of the PIN code is less than 6 characters
      return 'PIN Code Not Match';
    } else {
      // Return null if the PIN code meets the criteria, indicating no validation errors
      return null;
    }
  }
}
