class TextFieldValidation {
  static String? email({required String? value}) {
    final emailRegExp = RegExp(
      r"[a-z0-9!#$%&'+/=?^_`{|}~-]+@[a-z0-9](?:[a-z0-9-]*[a-z0-9])?(?:\.[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)+",
    );
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? mobile({required String value}) {
    if (value.trim() == '') {
      return 'Don\'t leave Empty';
    } else if (value.length != 10) {
      return 'Mobile Number Should be 10 Digit';
    }
    return null;
  }

  static String? otp({required String value}) {
    if (value.trim() == '') {
      return 'Don\'t leave Empty';
    } else if (value.length != 4) {
      return 'Otp Should be 4 Digit';
    }
    return null;
  }

  static String? name({required String value}) {
    if (value.trim() == '') {
      return 'Don\'t leave Empty';
    } else if (value.length < 4) {
      return 'Name Should be greater then 4 character';
    }
    return null;
  }

  static String? notEmpty({required String value}) {
    if (value.trim() == '') {
      return 'Don\'t leave Empty';
    }
    return null;
  }

  static String? password({required String value}) {
    if (value.trim() == '') {
      return 'Don\'t leave Empty';
    } else if (value.length < 4) {
      return 'Password should not be smaller then 4';
    }
    return null;
  }

  static String? dob(DateTime? value) {
    if (value == null) {
      return 'Please enter Date of birth.';
    }
    return null;
  }

  static String? pinCode(String value) {
    if (value.trim().isEmpty) {
      return 'Don\'t leave empty';
    } else if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return 'Enter a Valid PIN code';
    }
    return null;
  }

  static String? ifsc({required String? value}) {
    final ifscCodeRegExp = RegExp(
      r'^[A-Za-z]{4}0[A-Z0-9]{6}$',
    );
    if (value == null || value.isEmpty) {
      return 'IFSC code cannot be empty';
    }

    if (!ifscCodeRegExp.hasMatch(value)) {
      return 'Invalid IFSC code';
    }

    return null;
  }

  static String? fullName({required String? value}) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters long';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name should contain alphabetic characters only';
    }
    return null;
  }

  static String? gst({required String? value}) {
    {
      final RegExp gstRegex = RegExp(
        r"^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$",
      );
      if (value == null || value.isEmpty) {
        return 'GST Number is required';
      }
      if (!gstRegex.hasMatch(value)) {
        return 'Please Enter Valid GST Number';
      }
      return null;
    }
  }
}
