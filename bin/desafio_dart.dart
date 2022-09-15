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
(2) Não
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
CNPJ: ${CNPJValidator.format(company.registerNumber)} Data de Cadastro: ${company.registerDate}
Razão Social: ${company.registerName}
Nome Fantasia: ${company.fantasyName}
Telefone: (${company.telefone.substring(0, 2)}) ${company.telefone.substring(2, 6)}-${company.telefone.substring(6, 10)}
Endereço: ${company.address.street}, ${company.address.number}, ${company.address.district}, ${company.address.state}, ${company.address.zipCode.substring(0, 2)}.${company.address.zipCode.substring(2, 5)}-${company.address.zipCode.substring(5, 8)}''');
    if (CPFValidator.isValid(company.partner.registerNumber)) {
      print('''
Sócio:
CPF: ${CPFValidator.format(company.partner.registerNumber)}
Nome Completo: ${company.partner.registerName}
Endereço: ${company.partner.address.street}, ${company.partner.address.number}, ${company.partner.address.district}, ${company.partner.address.state}, ${company.address.zipCode.substring(0, 2)}.${company.address.zipCode.substring(2, 5)}-${company.address.zipCode.substring(5, 8)}
''');
      return;
    }
    if (CNPJValidator.isValid(company.partner.registerNumber)) {
      print('''
Sócio:
CNPJ: ${CNPJValidator.format(company.partner.registerNumber)}
Razão Social: ${company.registerName}
Nome Fantasia: ${company.partner.registerName}
Endereço: ${company.partner.address.street}, ${company.partner.address.number}, ${company.partner.address.district}, ${company.partner.address.state}, ${company.address.zipCode.substring(0, 2)}.${company.address.zipCode.substring(2, 5)}-${company.address.zipCode.substring(5, 8)}
''');
    }
  }

  void searchCompany(List listCompanys, String value) {
    if (listCompanys.isNotEmpty) {
      stdout.write('Digite o $value');
      String input = stdin.readLineSync(encoding: utf8)!;
      print('');
      for (var i = 0; i < listCompanys.length; i++) {
        if (listCompanys[i].registerNumber == input ||
            listCompanys[i].partner.registerNumber == input) {
          showCompany(listCompanys[i]);
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
