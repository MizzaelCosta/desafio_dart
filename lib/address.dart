import 'dart:convert';
import 'dart:io';

class Address {
  late String street;
  late String number;
  late String district;
  late String state;
  late String zipCode;

  Address.addAddress() {
    print('Endereço...');
    stdout.write('Rua: ');
    street = stdin.readLineSync(encoding: utf8)!;
    stdout.write('Número: ');
    number = stdin.readLineSync(encoding: utf8)!;
    stdout.write('Bairro: ');
    district = stdin.readLineSync(encoding: utf8)!;
    stdout.write('Estado: ');
    state = stdin.readLineSync(encoding: utf8)!;
    stdout.write('CEP: ');
    zipCode = stdin.readLineSync(encoding: utf8)!;
    while (zipCode.length != 8) {
      stdout.write('CEP invalido! Digite um CEP com 8 digítos: ');
      zipCode = stdin.readLineSync(encoding: utf8)!;
    }
  }
}
