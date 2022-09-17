import 'dart:convert';
import 'dart:io';
import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:desafio_dart/company/company.dart';

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
    listCompanys.sort((a, b) =>
        a.registerName.toUpperCase().compareTo(b.registerName.toUpperCase()));
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
