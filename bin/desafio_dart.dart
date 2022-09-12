import 'dart:convert';
import 'dart:io';
import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:desafio_dart/company.dart';

void main() {
  bool exitMenu = false;
  final listCompanys = <Company>[];

  void addCompany() {
    Company company = Company();
    listCompanys.add(company);
  }

  void showCompany(Company company) {
    print('''
ID: ${company.id}
CNPJ: ${company.cnpj} Data Cadastro: ${company.registrationTime}
Nome Fantasia: ${company.nomeFantasia}
Telefone: ${company.telefone}
Endereço: ${company.address.street}, ${company.address.number}, ${company.address.complemento}, ${company.address.state}, ${company.address.postalCode}
Sócio:
CPF: ${company.partner.cpf}
Nome Completo: ${company.partner.name}
Endereço: ${company.partner.address.street}, ${company.partner.address.number}, ${company.partner.address.complemento}, ${company.partner.address.state}, ${company.partner.address.postalCode}
''');
  }

  void mensageListEmpty() {
    print('''
Sem Empresas para mostar.
Deseja adicionar uma Empresa?
(1) Sim
(2) Não
Sua escolha: ''');
    String input = stdin.readLineSync(encoding: utf8)!;
    if (input == '1') {
      addCompany();
    }
  }

  void showListCompanys(List listCompanys) {
    if (listCompanys.isNotEmpty) {
      listCompanys.sort((a, b) => a.razaoSocial.compareTo(b.razaoSocial));
      for (var i = 0; i < listCompanys.length; i++) {
        showCompany(listCompanys[i]);
      }
      return;
    }
    mensageListEmpty();
  }

  void searchCompanyByCnpj(List listCompanys) {
    if (listCompanys.isNotEmpty) {
      stdout.write('Digite o CNPJ da Empresa: ');
      String input = stdin.readLineSync(encoding: utf8)!;
      print('');
      String cnpj = CNPJValidator.format(input);
      for (var i = 0; i < listCompanys.length; i++) {
        if (listCompanys[i].cnpj == cnpj) {
          showCompany(listCompanys[i]);
          return;
        }
      }
      print('Empresa não encontrada.');
      return;
    }
    mensageListEmpty();
  }

  void searchCompanyByPartner(List listCompanys) {
    if (listCompanys.isNotEmpty) {
      stdout.write('Digite o CPF do Sócio: ');
      String input = stdin.readLineSync(encoding: utf8)!;
      print('');
      String cpf = CPFValidator.format(input);
      for (var i = 0; i < listCompanys.length; i++) {
        if (listCompanys[i].partner.cpf == cpf) {
          showCompany(listCompanys[i]);
          return;
        }
      }
      print('Empresa não encontrada.');
      return;
    }
    mensageListEmpty();
  }

  void deleteCompanyById(List listCompanys) {
    if (listCompanys.isNotEmpty) {
      showListCompanys(listCompanys);
      stdout.write('Digite o Id da Empresa que deseja excluir: ');
      String id = stdin.readLineSync(encoding: utf8)!;
      for (var i = 0; i < listCompanys.length; i++) {
        if (listCompanys[i].id == id) {
          showCompany(listCompanys[i]);
          stdout.write('''
Deseja realmente excluir esta Empresa?
(1) Sim
(2) Não
Sua escolha: ''');
          String input = stdin.readLineSync(encoding: utf8)!;
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
    print('');
    String inputMenu = stdin.readLineSync(encoding: utf8)!;
    switch (inputMenu) {
      case '1':
        {
          addCompany();
          break;
        }
      case '2':
        {
          searchCompanyByCnpj(listCompanys);
          break;
        }
      case '3':
        {
          searchCompanyByPartner(listCompanys);
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
