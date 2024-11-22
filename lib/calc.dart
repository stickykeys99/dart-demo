import 'dart:io';

void main() {
  stdout.write('Enter a number: ');
  num? a = num.tryParse(stdin.readLineSync() ?? '');
  if (a == null) return print('Please enter a valid number.');

  stdout.write('Enter +,-,*, or /: ');
  String? op = stdin.readLineSync();
  if (op == null || op == '' || !'+-*/'.contains(op))
    return print('Please enter a valid operation.');

  stdout.write('Enter another number: ');
  num? b = num.tryParse(stdin.readLineSync() ?? '');
  if (b == null) return print('Please enter a valid number.');

  switch (op) {
    case '+':
      return print(a + b);
    case '-':
      return print(a - b);
    case '*':
      return print(a * b);
    case '/':
      if (b == 0) return print('Cannot divide by zero.');
      return print(a / b);
    default:
  }
}
