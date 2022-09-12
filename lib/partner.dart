import 'dart:convert';
import 'dart:io';
import 'package:desafio_dart/address.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

class Partner {
  late String name;
  late String cpf;
  late Address address;

  Partner() {
    stdout.write('Digite Nome Completo: ');
    name = stdin.readLineSync(encoding: utf8)!;
    stdout.write('Digite CPF (Apenas Números): ');
    String input = stdin.readLineSync(encoding: utf8)!;
    cpf = CPFValidator.format(input);
    print('Endereço...');
    address = Address();
  }
}
