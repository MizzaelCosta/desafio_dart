import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:desafio_dart/address.dart';
import 'package:desafio_dart/partner.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'dart:convert';

class Company {
  late final String _id = Uuid().v1();
  late final DateTime _registerDate = DateTime.now();
  late String registerName;
  late String fantasyName;
  late String _registerNumber;
  late String telefone;
  late Address address;
  late Partner _partner;

  DateTime get registerDate => _registerDate;
  dynamic get id => _id;
  String get registerNumber => _registerNumber;
  Partner get partner => _partner;

  Company.addCompany() {
    stdout.write('CNPJ (Apenas número): ');
    _registerNumber = cnpjValidator(stdin.readLineSync(encoding: utf8)!);
    stdout.write('Razão social: ');
    registerName = stdin.readLineSync(encoding: utf8)!;
    stdout.write('Nome Fantasia: ');
    fantasyName = stdin.readLineSync(encoding: utf8)!;
    stdout.write('Número de Telefone: ');
    telefone = telefoneValidator(stdin.readLineSync(encoding: utf8)!);
    address = Address.addAddress();    
    _partner = Partner.addPartner(typePartner());
  }

  String cnpjValidator(String cnpj) {
    while (!(CNPJValidator.isValid(_registerNumber))) {
      //Exemplo de CNPJ válido 17942159000128
      stdout.write('CNPJ inválido! Digite um CNPJ que seja válido: ');
      _registerNumber = stdin.readLineSync(encoding: utf8)!;
    }
    return cnpj;
  }

  String telefoneValidator(String telefone) {
    while (telefone.length != 10 || telefone.length != 11) {
      stdout
          .write('Telefone inválido! Digite um número com 10 ou 11 digítos: ');
      telefone = telefoneFormat(stdin.readLineSync(encoding: utf8)!);
    }
    return telefone;
  }

  String telefoneFormat(String telefone) {
    if (telefone.length == 10) {
      telefone =
          '${telefone.substring(0, 2)}) ${telefone.substring(2, 6)}-${telefone.substring(6, 10)}';
    } else {
      telefone =
          '${telefone.substring(0, 2)}) ${telefone.substring(2, 6)}-${telefone.substring(6, 10)}';
    }
    return telefone;
  }

  String typePartner() {
    stdout.write('''\n
Qual tipo de Sócio da Empresa?
(1) PF (Pessoa Física)
(2) PJ (Pessoa Jurídica)
Sua escolha: ''');
    String input = stdin.readLineSync(encoding: utf8)!;
    return input;
  }
}
