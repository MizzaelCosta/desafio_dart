import 'dart:convert';
import 'dart:io';

class Address {
  late String street;
  late String number;
  late String? complemento;
  late String state;
  late String postalCode;

  Address() {
    print('Digite Rua:');
    street = stdin.readLineSync(encoding: utf8)!;
    print('Digite Número:');
    number = stdin.readLineSync(encoding: utf8)!;
    print('Digite Complmento:');
    complemento = stdin.readLineSync(encoding: utf8)!;
    print('Digite Estado:');
    state = stdin.readLineSync(encoding: utf8)!;
    print('Digite Cep:');
    postalCode = stdin.readLineSync(encoding: utf8)!;
  }
}
