import 'dart:convert';
import 'dart:io';

void main() {
  bool exitMenu = true;

  do {
    print('''
        CADASTRO 
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
          print('Cadastrar nova Empresa');
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
          (inputMenu == '6') ? exitMenu = false : print('Opção inválida.');
        }
    }
  } while (exitMenu);
}
