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
    name = nameValidator();
    stdout.write('Digite CPF (Apenas Números): ');
    cpf = cpfValidator();
    print('Endereço...');
    address = Address();
  }

  String cpfValidator() {
    String input = stdin.readLineSync(encoding: utf8)!;
    while (!(CPFValidator.isValid(input))) {
      //CPF válido 35999906032
      stdout.write('CPF inválido! Digite um CPF que seja válido:');
      input = stdin.readLineSync(encoding: utf8)!;
    }
    String value = CPFValidator.format(input);
    return value;
  }

  String nameValidator() {
    String input = stdin.readLineSync(encoding: utf8)!;
    List fullName = input.split(" ");
    while (fullName.length < 2) {
      stdout.write('Digite o Nome completo:');
      input = stdin.readLineSync(encoding: utf8)!;
      fullName = input.split(" ");
    }
    return input;
  }
}
