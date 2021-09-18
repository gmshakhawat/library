const String PASSWORD_PATTERN =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
const String PASSWORD_PATTERN_CAPITAL = r'^(?=.*?[A-Z])';
const String PASSWORD_PATTERN_SMALL = r'^(?=.*?[a-z])';
const String PASSWORD_PATTERN_NUMBER = r'^(?=.*?[0-9])';
const String PASSWORD_PATTERN_SPECIAL = r'^(?=.*?[!@_#\$&*~]).{1,}';

const String EMAIL_PATTERN_SPECIAL =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
const String MOBILE_NUMBER_PATTERN_SPECIAL = r'^((01){1}[2-9]{1}\d{8})$';
class InputValidation {
  email(val) {
    if (val.length < 1) {
    } else if (val.contains(RegExp(EMAIL_PATTERN_SPECIAL.toString()))) {
      print("NO ERROR");
      return null;
    } else {
      print("ERROR");

      return"Please enter valid email";
    }
  }

  phone(val) {
    if (val.contains(new RegExp(MOBILE_NUMBER_PATTERN_SPECIAL))) {
      print("NO ERROR");
      return null;
    } else {
      print("ERROR");

      return "Please enter valid email";
    }
  }




   match(val,{String? prev}) {
    if(val!=prev) {
      return null;
    }
  }
}


