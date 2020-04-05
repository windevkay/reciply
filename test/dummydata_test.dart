import 'package:test/test.dart';
import 'package:reciply/dummy_data.dart';

void main(){
  group('DUMMY DATA TEST', () {
    test('Test for 10 categories', () {
      expect(DUMMY_CATEGORIES.length, 10);
    });

    test('Test for 10 meals in data', () {
      expect(DUMMY_MEALS.length, 10);
    });
  });
}