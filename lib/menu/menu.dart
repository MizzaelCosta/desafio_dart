import 'dart:convert';
import 'dart:io';
import 'package:desafio_dart/menu/menu_functions.dart';

void userMenu() {
  bool exitMenu = false;
  do {
    stdout.write('''

*********   MENU   *********

  (1) Cadastrar nova Empresa
  (2) Buscar Empresa por CNPJ
  (3) Buscar Empresa por Sócio
  (4) Listar Empresas
  (5) Excluir Empresa
  (6) Sair

Digite a opção desejada: ''');
    String inputMenu = stdin.readLineSync(encoding: utf8)!;
    print('');
    switch (inputMenu) {
      case '1':
        {
          addCompany();
          break;
        }
      case '2':
        {
          searchCompany(listCompanys, 'CNPJ da Empresa: ');
          break;
        }
      case '3':
        {
          searchCompany(listCompanys, 'CPF ou CNPJ do Sócio: ');
          break;
        }
      case '4':
        {
          showListCompanys(listCompanys);
          break;
        }
      case '5':
        {
          deleteCompanyById(listCompanys);
          break;
        }
      default:
        {
          (inputMenu == '6') ? exitMenu = true : print('Opção inválida.\n');
        }
    }
  } while (!exitMenu);
}
