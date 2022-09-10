import 'dart:convert';
import 'dart:io';
import 'package:desafio_dart/address.dart';

class Partner {
  late String name;
  late String cpf;
  late Address address;

  Partner() {
    name = stdin.readLineSync(encoding: utf8)!;
    cpf = stdin.readLineSync(encoding: utf8)!;
    print('Endereço Sócio...');
    address = Address();
  }
}
