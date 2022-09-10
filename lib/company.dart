import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:desafio_dart/address.dart';
import 'package:desafio_dart/partner.dart';
import 'dart:convert';
import 'dart:io';
import 'package:desafio_dart/id.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

class Company {
  late Id id;
  late DateTime registrationTime;
  late String razaoSocial;
  late String nomeFantasia;
  late String cnpj;
  late String telefone;
  late Address address;
  late Partner partner;

  Company() {
    registrationTime = DateTime.now();
    id = Id();
    print('Empresa...');
    print('Digite Razao Social:');
    razaoSocial = stdin.readLineSync(encoding: utf8)!;
    print('Digite Nome Fantasia:');
    nomeFantasia = stdin.readLineSync(encoding: utf8)!;
    print('Digite CNPJ:');
    String input;
    cnpj = CNPJValidator.format(input = stdin.readLineSync(encoding: utf8)!);
    print('Digite Telefone:');
    telefone = stdin.readLineSync(encoding: utf8)!;
    print('Endereço Empresa...');
    address = Address();
    print('Sócio...');
    partner = Partner();
  }
}
