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
    zipCode = zipCodeValidator();
  }

  String zipCodeValidator() {
    String imput = stdin.readLineSync(encoding: utf8)!;
    while (imput.length != 8) {
      stdout.write('CEP invalido! Digite um CEP com 8 digítos: ');
      imput = stdin.readLineSync(encoding: utf8)!;
    }
    return imput;
  }

  String fullAddress() {
    return '$street, $number, $district, $state, ${zipCode.substring(0, 2)}.${zipCode.substring(2, 5)}-${zipCode.substring(5, 8)}';
  }
}
