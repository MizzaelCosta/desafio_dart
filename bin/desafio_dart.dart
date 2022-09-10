import 'dart:convert';
import 'dart:io';
import 'package:desafio_dart/company.dart';

void main() {
  bool exitMenu = false;
  final listCompanys = <Company>[];

  void addCompany(List listCompanys) {
    print('razaoSocial:');
    String razaoSocial = stdin.readLineSync(encoding: utf8)!;
    Company company = Company(razaoSocial: razaoSocial);

    listCompanys.add(company);
  }

  void showList(List listCompany) {
    listCompanys.forEach((element) {
      print('ID: ${element.id}');
      print('Data de Registro: ${element.registrationTime}');
      print('Razaõ Social: ${element.razaoSocial}\n');
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
          addCompany(listCompanys);

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
