import 'dart:convert';
import 'dart:io';
import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:desafio_dart/company.dart';

void main() {
  final listCompanys = <Company>[];

  void addCompany() {
    print('''
Cadastro de Nova Empresa
Digite abaixo os campos necessários...
    ''');
    Company company = Company.addCompany();
    listCompanys.add(company);
  }

  void mensageListEmpty() {
    stdout.write('''
Sem Empresas para mostar.
Deseja adicionar uma Empresa?
(1) Sim
Outro valor para Não
Sua escolha: ''');
    String input = stdin.readLineSync(encoding: utf8)!;
    print('');
    if (input == '1') {
      addCompany();
    }
  }

  void showCompany(Company company) {
    print('''
ID: ${company.id}
CNPJ: ${company.registerNumber} Data de Cadastro: ${company.registerDate}
Razão Social: ${company.registerName}
Nome Fantasia: ${company.fantasyName}
Telefone: ${company.telefone}
Endereço: ${company.address.fullAddress()}''');
    if (CPFValidator.isValid(company.partner.registerNumber)) {
      print('''
Sócio:
CPF: ${company.partner.registerNumber}
Nome Completo: ${company.partner.registerName}
Endereço: ${company.partner.address.fullAddress()}
''');
      return;
    }
    if (CNPJValidator.isValid(company.partner.registerNumber)) {
      print('''
Sócio:
CNPJ: ${company.partner.registerNumber}
Razão Social: ${company.registerName}
Nome Fantasia: ${company.partner.registerName}
Endereço: ${company.partner.address.fullAddress()}
''');
    }
  }

  void searchCompany(List listCompanys, String value) {
    if (listCompanys.isNotEmpty) {
      stdout.write('Digite o $value');
      String imput = stdin.readLineSync(encoding: utf8)!;
      print('');
      imput = CNPJValidator.format(imput);
      if (value == 'CNPJ da Empresa: ') {
        for (var i = 0; i < listCompanys.length; i++) {
          if (listCompanys[i].registerNumber == imput) {
            showCompany(listCompanys[i]);
            return;
          }
        }
      } else if (value == 'CPF ou CNPJ do Sócio: ') {
        String cpf = CPFValidator.format(imput);
        String cnpj = CNPJValidator.format(imput);
        int counter = 0;
        for (var i = 0; i < listCompanys.length; i++) {
          if (listCompanys[i].partner.registerNumber == cnpj ||
              listCompanys[i].partner.registerNumber == cpf) {
            showCompany(listCompanys[i]);
            counter++;
          }
        }
        if (counter > 0) {
          print('Foram encontradas $counter Empresas.');
          return;
        }
      }
      print('Empresa não encontrada.');
      return;
    }
    mensageListEmpty();
  }

  void showListCompanys(List listCompanys) {
    if (listCompanys.isNotEmpty) {
      listCompanys.sort((a, b) => a.registerName.compareTo(b.registerName));
      for (var i = 0; i < listCompanys.length; i++) {
        showCompany(listCompanys[i]);
      }
      return;
    }
    mensageListEmpty();
  }

  void deleteCompanyById(List listCompanys) {
    if (listCompanys.isNotEmpty) {
      showListCompanys(listCompanys);
      stdout.write('Digite o Id da Empresa que deseja excluir: ');
      String id = stdin.readLineSync(encoding: utf8)!;
      print('');
      for (var i = 0; i < listCompanys.length; i++) {
        if (listCompanys[i].id == id) {
          showCompany(listCompanys[i]);
          stdout.write('''
Deseja realmente excluir esta Empresa?
(1) Sim
Sua escolha: ''');
          String input = stdin.readLineSync(encoding: utf8)!;
          print('');
          if (input == '1') {
            listCompanys.removeAt(i);
          }
          return;
        }
      }
      print('Empresa não encontrada.');
      return;
    }
    mensageListEmpty();
  }

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
