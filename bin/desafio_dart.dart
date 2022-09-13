import 'dart:convert';
import 'dart:io';
import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:desafio_dart/address.dart';
import 'package:desafio_dart/company.dart';
import 'package:desafio_dart/partner.dart';

void main() {
  final listCompanys = <Company>[];

  void addCompany() {
    Partner partner = Partner(
      name: 'Nome',
      '35999906032',
      address: Address(
        street: 'Rua',
        number: 'Número',
        complement: '',
        zipCode: '23456789',
        state: 'UF',
      ),
    );
    Company company = Company(
      '17942159000128',
      corporateName: 'Razao Social',
      fantasyName: 'Nome Fantasia',
      telefone: '21987654321',
      address: Address(
        street: 'Rua',
        number: 'number',
        complement: '',
        zipCode: '23456789',
        state: 'UF',
      ),
      partner: partner,
    );
    listCompanys.add(company);
  }

  void showCompany(Company company) {
    print('''
ID: ${company.id}
CNPJ: ${company.cnpj} Data de Cadastro: ${company.registerDate}
Razão Social: ${company.corporateName}
Nome Fantasia: ${company.fantasyName}
Telefone: ${company.telefone}
Endereço: ${company.address.street}, ${company.address.number}, ${company.address.complement}, ${company.address.state}, ${company.address.zipCode}
Sócio:
CPF: ${company.partner.cpf}
Nome Completo: ${company.partner.name}
Endereço: ${company.partner.address.street}, ${company.partner.address.number}, ${company.partner.address.complement}, ${company.partner.address.state}, ${company.partner.address.zipCode}
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
    print('');
    if (input == '1') {
      addCompany();
    }
  }

  void showListCompanys(List listCompanys) {
    if (listCompanys.isNotEmpty) {
      listCompanys.sort((a, b) => a.corporateName.compareTo(b.corporateName));
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
      String cnpj = input = CNPJValidator.format(input);
      for (var i = 0; i < listCompanys.length; i++) {
        if (listCompanys[i].cnpj == cnpj) {
          showCompany(listCompanys[i]);
          return;
        }
      }
      print('Empresa não encontrada.');
    }
    mensageListEmpty();
  }

  void searchCompanyByPartner(List listCompanys) {
    if (listCompanys.isNotEmpty) {
      stdout.write('Digite o CPF do Sócio: ');
      String input = stdin.readLineSync(encoding: utf8)!;
      print('');
      String cpf = input = CPFValidator.format(input);
      for (var i = 0; i < listCompanys.length; i++) {
        if (listCompanys[i].partner.cpf == cpf) {
          showCompany(listCompanys[i]);
          return;
        }
      }
      print('Empresa não encontrada.');
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
(2) Não
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
