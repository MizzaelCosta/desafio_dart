import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:desafio_dart/address.dart';
import 'package:desafio_dart/partner.dart';
import 'dart:convert';
import 'dart:io';
import 'package:uuid/uuid.dart';

class Company {
  final id = '1'; //Uuid().v1;
  final DateTime registrationTime = DateTime.now();
  late String razaoSocial;
  late String nomeFantasia;
  late String cnpj;
  late String telefone;
  late Address address;
  late Partner partner;

  Company() {
    print('Empresa...');
    stdout.write('Digite Razao Social: ');
    razaoSocial = stdin.readLineSync(encoding: utf8)!;
    stdout.write('Digite Nome Fantasia: ');
    nomeFantasia = stdin.readLineSync(encoding: utf8)!;
    stdout.write('Digite CNPJ (Apenas Números): ');
    cnpj = cnpjValidator();
    stdout.write('Digite Telefone: ');
    telefone = stdin.readLineSync(encoding: utf8)!;
    print('Endereço...');
    address = Address();
    print('\nSócio...');
    partner = Partner();
  }

  String cnpjValidator() {
    String input = stdin.readLineSync(encoding: utf8)!;
    while (!(CNPJValidator.isValid(input))) {
      //CNPJ válido 17942159000128
      stdout.write('CNPJ inválido! Digite um CNPJ que seja válido:');
      input = stdin.readLineSync(encoding: utf8)!;
    }
    String value = CNPJValidator.format(input);
    return value;
  }
}
