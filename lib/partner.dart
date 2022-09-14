import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:desafio_dart/address.dart';
import 'dart:convert';
import 'dart:io';

class Partner {
  late String name;
  late String _cpf;
  late Address address;

  String get cpf => _cpf;

  Partner.addPartner() {
    print('\nSócio...');
    stdout.write('Nome Completo: ');
    name = stdin.readLineSync(encoding: utf8)!;
    stdout.write('CPF (Apenas números): ');
    _cpf = stdin.readLineSync(encoding: utf8)!;
    while (!(CPFValidator.isValid(_cpf))) {
      //Exemplo de CPF válido 35999906032
      stdout.write('CPF inválido! Digite um CPF que seja válido: ');
      _cpf = stdin.readLineSync(encoding: utf8)!;
    }
    address = Address.addAddress();
  }
}
