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
          listCompanys.forEach((element) {
            print('Razaõ Social: ${element.razaoSocial}');
          });
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
          print('Listar Empresas');
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
