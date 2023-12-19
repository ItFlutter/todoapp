validInput(int min, int max, String value) {
  if (value.isEmpty) {
    return "The Field is required";
  }
  if (value.length < min) {
    return "The value must be $min or greater";
  }
  if (value.length > max) {
    return "The value must be $max or less";
  }
}
