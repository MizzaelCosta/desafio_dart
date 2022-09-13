import 'dart:convert';
import 'dart:io';

class Address {
  String street;
  String number;
  String? complement;
  String state;
  String zipCode;

  Address({
    required this.street,
    required this.number,
    this.complement,
    required this.state,
    required this.zipCode,
  }) {
    while (zipCode.length != 8) {
      //Exemplo de CEP válido 26157579
      stdout.write('CEP invalido! Digite um CEP com 8 caracteres: ');
      zipCode = stdin.readLineSync(encoding: utf8)!;
    }
    zipCode = '${zipCode.substring(0, 5)}-${zipCode.substring(5, 8)}';
  }
}