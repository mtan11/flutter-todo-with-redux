import 'package:flutter_test/flutter_test.dart';
import 'package:todo_with_redux/const/validator.dart';

void main() {
  test('Empty Title Test', () {
    var result = Validator.validateTitle('');
    expect(result, 'Please enter title.');
  });
  test('Empty Content Test', () {
    var result = Validator.validateContent('');
    expect(result, 'Please enter some content.');
  });
  test('Invalid Content Test', () {
    var result = Validator.validateContent(
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.');
    expect(result, 'Content  must be less than 150.');
  });
}
