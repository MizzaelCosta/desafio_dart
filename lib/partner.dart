import 'package:desafio_dart/address.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'dart:io';
import 'dart:convert';

class Partner {
  String name;
  String _cpf;
  Address address;

  Partner(
    this._cpf, {
    required this.name,
    required this.address,
  }) {
    while (!(CPFValidator.isValid(_cpf))) {
      //Exemplo de CPF válido 35999906032
      stdout.write('CPF inválido! Digite um CPF que seja válido: ');
      _cpf = stdin.readLineSync(encoding: utf8)!;
    }
    _cpf = CPFValidator.format(_cpf);
  }

  String get cpf => _cpf;
}
