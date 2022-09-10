import 'dart:convert';
import 'dart:io';
import 'package:desafio_dart/address.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

class Partner {
  late String name;
  late String cpf;
  late Address address;

  Partner() {
    print('Digite Nome Completo:');
    name = stdin.readLineSync(encoding: utf8)!;
    print('Digite CPF (Apenas NUmeros):');
    String input;
    cpf = CPFValidator.format(input = stdin.readLineSync(encoding: utf8)!);
    print('Endereço Sócio...');
    address = Address();
  }
}
