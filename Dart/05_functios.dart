void main() {
  print(greetEveryOne());
  print('Suma ${addTwoNumbers(10, 20)}');
  print('SumaOptional ${addTwoNumbersOptiona(10)}');
  print(greetPerson(name: 'Ruben', message: 'Hi,'));
}

String greetEveryOne() => 'Hello everyone!!';

int addTwoNumbers(int a, int b) => a + b;

int addTwoNumbersOptiona(int a, [int b = 0]) {
  //b ??= 0;
  return a + b;
}

String greetPerson({required String name, String message = 'Hola,'}) {
  return '$message $name';
}
