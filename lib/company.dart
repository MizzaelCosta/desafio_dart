import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:desafio_dart/address.dart';
import 'package:desafio_dart/partner.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'dart:convert';

class Company {
  late final String _id = Uuid().v1();
  late final DateTime _registerDate = DateTime.now();
  late String corporateName;
  late String fantasyName;
  late String _cnpj;
  late String telefone;
  late Address address;
  late Partner partner;

  DateTime get registerDate => _registerDate;
  dynamic get id => _id;
  String get cnpj => _cnpj;

  Company.addCompany() {
    stdout.write('CNPJ (Apenas número): ');
    _cnpj = stdin.readLineSync(encoding: utf8)!;
    while (!(CNPJValidator.isValid(cnpj))) {
      //Exemplo de CNPJ válido 17942159000128
      stdout.write('CNPJ inválido! Digite um CNPJ que seja válido: ');
      _cnpj = stdin.readLineSync(encoding: utf8)!;
    }
    stdout.write('Razão social: ');
    corporateName = stdin.readLineSync(encoding: utf8)!;
    stdout.write('Nome Fantasia: ');
    fantasyName = stdin.readLineSync(encoding: utf8)!;
    stdout.write('Número de Telefone: ');
    telefone = stdin.readLineSync(encoding: utf8)!;
    while (telefone.length != 10) {
      stdout.write('Telefone inválido! Digite um número com 10 digítos: ');
      telefone = stdin.readLineSync(encoding: utf8)!;
    }
    address = Address.addAddress();
    partner = Partner.addPartner();
  }
}
