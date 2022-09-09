import 'package:desafio_dart/endereco.dart';
import 'package:desafio_dart/socio.dart';
import 'package:desafio_dart/id.dart';

class Empresa {
  late Id id;
  late DateTime horarioCadastro;/*
  String razaoSocial;
  String nomeFantasia;
  String cnpj;
  Endereco endereco;
  String telefone;
  Socio socio;*/

  Empresa(/*{
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.cnpj,
    required this.endereco,
    required this.telefone,
    required this.socio,
  }*/){
    horarioCadastro = DateTime.now();
    id = Id();
  }
}
