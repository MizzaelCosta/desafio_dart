import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:desafio_dart/address.dart';
import 'package:desafio_dart/partner.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'dart:convert';

class Company {
  final String _id = Uuid().v1();
  final DateTime _registerDate = DateTime.now();
  String corporateName;
  String fantasyName;
  String _cnpj;
  String telefone;
  Address address;
  Partner partner;

  DateTime get registerDate => _registerDate;
  dynamic get id => _id;
  String get cnpj => _cnpj;

  Company(
    this._cnpj, {
    required this.corporateName,
    required this.fantasyName,
    required this.telefone,
    required this.address,
    required this.partner,
  }) {
    while (!(CNPJValidator.isValid(_cnpj))) {
      //Exemplo de CNPJ válido 17942159000128
      stdout.write('CNPJ inválido! Digite um CNPJ que seja válido: ');
      _cnpj = stdin.readLineSync(encoding: utf8)!;
    }
    _cnpj = CNPJValidator.format(_cnpj);
    while (telefone.length != 11) {
      //Exemplo de CEP válido 26157579
      stdout.write('Número invalido! Digite um Número com 11 caracteres: ');
      telefone = stdin.readLineSync(encoding: utf8)!;
    }
    telefone =
        '(${telefone.substring(0, 2)}) ${telefone.substring(2, 3)} ${telefone.substring(3, 7)}-${telefone.substring(7, 11)}';
  }
}
