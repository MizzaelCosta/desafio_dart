import 'dart:convert';
import 'dart:io';

class Address {
  late String street;
  late String number;
  late String? complemento;
  late String state;
  late String postalCode;

  Address() {
    stdout.write('Digite Rua: ');
    street = stdin.readLineSync(encoding: utf8)!;
    stdout.write('Digite Número: ');
    number = stdin.readLineSync(encoding: utf8)!;
    stdout.write('Digite Complmento: ');
    complemento = stdin.readLineSync(encoding: utf8)!;
    stdout.write('Digite Estado: ');
    state = stdin.readLineSync(encoding: utf8)!;
    stdout.write('Digite Cep: ');
    postalCode = stdin.readLineSync(encoding: utf8)!;
  }

  
}
