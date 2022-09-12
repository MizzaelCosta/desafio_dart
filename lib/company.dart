import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:desafio_dart/address.dart';
import 'package:desafio_dart/partner.dart';
import 'dart:convert';
import 'dart:io';
import 'package:uuid/uuid.dart';

class Company {
  var id = '1'; //Uuid().v1;
  DateTime registrationTime = DateTime.now();
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
    String input = stdin.readLineSync(encoding: utf8)!;
    cnpj = CNPJValidator.format(input);
    stdout.write('Digite Telefone: ');
    telefone = stdin.readLineSync(encoding: utf8)!;
    print('Endereço...');
    address = Address();
    print('Sócio...');
    partner = Partner();
  }
}
