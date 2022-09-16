import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:desafio_dart/address.dart';
import 'package:desafio_dart/partner.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'dart:convert';

class Company {
  late final String _id;
  late final DateTime _registerDate;
  late String registerName;
  late String fantasyName;
  late String _registerNumber;
  late String telefone;
  late Address address;
  late Partner _partner;

  DateTime get registerDate => _registerDate;
  String get id => _id;
  String get registerNumber => _registerNumber;
  Partner get partner => _partner;

  Company.addCompany() {
    _id = Uuid().v1();
    _registerDate = DateTime.now();
    stdout.write('CNPJ (Apenas número): ');
    _registerNumber = cnpjValidator();
    stdout.write('Razão social: ');
    registerName = stdin.readLineSync(encoding: utf8)!;
    stdout.write('Nome Fantasia: ');
    fantasyName = stdin.readLineSync(encoding: utf8)!;
    stdout.write('Número de Telefone: ');
    telefone = telefoneValidator();
    address = Address.addAddress();
    _partner = Partner.addPartner(typePartner());
  }

  String cnpjValidator() {
    String imput = stdin.readLineSync(encoding: utf8)!;
    while (!(CNPJValidator.isValid(imput))) {
      //Exemplo de CNPJ válido 17942159000128
      stdout.write('CNPJ inválido! Digite um CNPJ que seja válido: ');
      imput = stdin.readLineSync(encoding: utf8)!;
    }
    return CNPJValidator.format(imput);
  }

  String telefoneValidator() {
    String imput = stdin.readLineSync(encoding: utf8)!;
    while (!(imput.length == 10 || imput.length == 11)) {
      stdout
          .write('Telefone inválido! Digite um número com 10 ou 11 digítos: ');
      imput = stdin.readLineSync(encoding: utf8)!;
    }
    if (imput.length == 10) {
      imput =
          '(${imput.substring(0, 2)}) ${imput.substring(2, 6)}-${imput.substring(6, 10)}';
    }
    if (imput.length == 11) {
      imput =
          '(${imput.substring(0, 2)}) ${imput.substring(2, 3)} ${imput.substring(3, 7)}-${imput.substring(7, 11)}';
    }
    return imput;
  }

  String typePartner() {
    stdout.write('''\n
Qual tipo de Sócio da Empresa?
Digite: 
(1) Para Pessoa Física (CPF)
Outro valor para Pessoa Jurídica (CNPJ)
Sua escolha: ''');
    String imput = stdin.readLineSync(encoding: utf8)!;
    return imput;
  }
}
