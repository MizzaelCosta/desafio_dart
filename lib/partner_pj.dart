import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:desafio_dart/address.dart';
import 'dart:convert';
import 'dart:io';
import 'package:desafio_dart/partner.dart';

class PartnerPJ implements Partner {
  late String _registerName;
  late String fantasyName;
  late String _registerNumber;

  @override
  late Address address;
  @override
  String get registerNumber => _registerNumber;
  @override
  String get registerName => _registerName;

  PartnerPJ.addPartner() {
    print('\nSócio...');
    stdout.write('Razão Social: ');
    _registerName = stdin.readLineSync(encoding: utf8)!;
    stdout.write('Nome Fantasia: ');
    fantasyName = stdin.readLineSync(encoding: utf8)!;
    stdout.write('CNPJ (Apenas números): ');
    _registerNumber = cnpjValidator();
    address = Address.addAddress();
  }

  String cnpjValidator() {
    String imput = stdin.readLineSync(encoding: utf8)!;
    while (!(CNPJValidator.isValid(imput))) {
      //Exemplo de CPF válido 35999906032
      stdout.write('CNPJ inválido! Digite um CNPJ que seja válido: ');
      imput = stdin.readLineSync(encoding: utf8)!;
    }
    return CNPJValidator.format(imput);
  }
}
