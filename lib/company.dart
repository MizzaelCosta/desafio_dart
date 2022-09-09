import 'package:desafio_dart/address.dart';
import 'package:desafio_dart/partner.dart';
import 'package:desafio_dart/id.dart';

class Company {
  late Id id;
  late DateTime registrationTime;/*
  String razaoSocial;
  String nomeFantasia;
  String cnpj;
  Address address;
  String telefone;
  Socio socio;*/

  Company(/*{
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.cnpj,
    required this.endereco,
    required this.telefone,
    required this.socio,
  }*/
      ) {
    registrationTime = DateTime.now();
    id = Id();
  }
}
