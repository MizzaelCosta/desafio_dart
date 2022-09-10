import 'dart:convert';
import 'dart:io';
import 'package:desafio_dart/address.dart';
import 'package:desafio_dart/company.dart';
import 'package:desafio_dart/partner.dart';

void main() {
  bool exitMenu = false;
  final listCompanys = <Company>[];

  void showList(List listCompany) {
    // ignore: avoid_function_literals_in_foreach_calls
    listCompanys.forEach((element) {
      print('''
ID: ${element.id}'
CNPJ: ${element.cnpj} Data Cadastro: ${element.registrationTime}
Nome Fantasia: ${element.nomeFantasia}
Telefone: ${element.telefone}
Endereço: ${element.address.street}, ${element.address.number}, ${element.address.complemento}, ${element.address.state}, ${element.address.postalCode}
Sócio:
CPF: ${element.partner.cpf}
Nome Completo: ${element.partner.name}
Endereço: ${element.partner.address.street}, ${element.partner.address.number}, ${element.partner.address.complemento}, ${element.partner.address.state}, ${element.partner.address.postalCode}
''');
    });
  }

  do {
    print('''
           ****   MENU   ****  
        (1) Cadastrar nova Empresa
        (2) Buscar Empresa por CNPJ
        (3) Buscar Empresa por Sócio
        (4) Listar Empresas
        (5) Excluir Empresa
        (6) Sair
        ''');
    String inputMenu = stdin.readLineSync(encoding: utf8)!;
    switch (inputMenu) {
      case '1':
        {
          // ignore: unused_local_variable
          Company company = Company();
          listCompanys.add(company);
          break;
        }
      case '2':
        {
          print('Buscar Empresa por CNPJ');
          break;
        }
      case '3':
        {
          print('Buscar Empresa por Sócio');
          break;
        }
      case '4':
        {
          listCompanys.sort((a, b) => a.razaoSocial.compareTo(b.razaoSocial));
          showList(listCompanys);
          break;
        }
      case '5':
        {
          print('Excluir Empresa');
          break;
        }
      default:
        {
          (inputMenu == '6') ? exitMenu = true : print('Opção inválida.');
        }
    }
  } while (!exitMenu);
}
