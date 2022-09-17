// ignore_for_file: recursive_getters

import 'package:desafio_dart/partner/partner_pf.dart';
import 'package:desafio_dart/address/address.dart';
import 'package:desafio_dart/partner/partner_pj.dart';

abstract class Partner {
  factory Partner.addPartner(String value) {
    if (value == '1') {
      return PartnerPF.addPartner();
    } else {
      return PartnerPJ.addPartner();
    }
  }
  Address get address => address;
  String get registerName => registerName;
  String get registerNumber => registerNumber;
}
