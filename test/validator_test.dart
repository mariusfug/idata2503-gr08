import 'package:flutter_test/flutter_test.dart';
import 'package:idata2503_group08/services/validators.dart';

void main() {
  test('non empty string', (){
    final validator = TitleValidator();
    expect(validator.isValid('test'), true);
  });

  test('empty string', () {
    final validator = TitleValidator();
    expect(validator.isValid(''), false);
  });
}