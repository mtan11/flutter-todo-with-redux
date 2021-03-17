class Validator {
  static String validateTitle(String value) {
    if (value == '') {
      return 'Please enter title.';
    }
    if (value.length > 50) {
      return 'Content  must be less than 50.';
    }
    return null;
  }

  static String validateContent(String value) {
    if (value == '') {
      return 'Please enter some content.';
    }
    if (value.length > 150) {
      return 'Content  must be less than 150.';
    }
    return null;
  }
}
