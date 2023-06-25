class Validator {
  static bool isNumber(String? input) {
    if (input == null || input.isEmpty) {
      return false;
    }

    final numberRegex = RegExp(r'^[0-9]+$');
    return numberRegex.hasMatch(input);
  }

  static bool isLengthInRange(String? input, int minLength, int maxLength) {
    if (input == null || input.isEmpty) {
      return false;
    }

    final length = input.length;
    return length >= minLength && length <= maxLength;
  }
}
