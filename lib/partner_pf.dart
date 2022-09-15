import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:desafio_dart/address.dart';
import 'dart:convert';
import 'dart:io';
import 'package:desafio_dart/partner.dart';

class PartnerPF implements Partner {
  late String _registerName;
  late String _registerNumber;
  late Address _address;

  @override
  String get registerNumber => _registerNumber;
  @override
  String get registerName => _registerName;
  @override
  Address get address => _address;

  PartnerPF.addPartner() {
    print('\nSócio...');
    stdout.write('Nome Completo: ');
    _registerName = stdin.readLineSync(encoding: utf8)!;
    stdout.write('CPF (Apenas números): ');
    _registerNumber = stdin.readLineSync(encoding: utf8)!;
    while (!(CPFValidator.isValid(_registerNumber))) {
      //Exemplo de CPF válido 35999906032
      stdout.write('CPF inválido! Digite um CPF que seja válido: ');
      _registerNumber = stdin.readLineSync(encoding: utf8)!;
    }
    _address = Address.addAddress();
  }
}
