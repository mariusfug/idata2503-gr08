abstract class StringValidator {
  bool isValid(String value);
}

class TitleValidator implements StringValidator {

  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}