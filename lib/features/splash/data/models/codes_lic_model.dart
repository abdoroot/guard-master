// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CodesLicModel {
  String? activationCode;
  List<String>? otp;
  String? pcSerialNo;
  CodesLicModel({
    this.activationCode,
    this.otp,
    this.pcSerialNo,
  });

  CodesLicModel copyWith({
    String? activationCode,
    List<String>? otp,
    String? pcSerialNo,
  }) {
    return CodesLicModel(
      activationCode: activationCode ?? this.activationCode,
      otp: otp ?? this.otp,
      pcSerialNo: pcSerialNo ?? this.pcSerialNo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'activationCode': activationCode,
      'otp': otp,
      'pcSerialNo': pcSerialNo,
    };
  }

  factory CodesLicModel.fromMap(Map<String, dynamic> map) {
    return CodesLicModel(
      activationCode: map['activationCode'] != null
          ? map['activationCode'] as String
          : null,
      otp: map['otp'] != null
          ? List<String>.from((map['otp'] as List<dynamic>))
          : null,
      pcSerialNo:
          map['pcSerialNo'] != null ? map['pcSerialNo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CodesLicModel.fromJson(String source) =>
      CodesLicModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CodesLicModel(activationCode: $activationCode, otp: $otp, pcSerialNo: $pcSerialNo)';

  @override
  bool operator ==(covariant CodesLicModel other) {
    if (identical(this, other)) return true;

    return other.activationCode == activationCode &&
        listEquals(other.otp, otp) &&
        other.pcSerialNo == pcSerialNo;
  }

  @override
  int get hashCode =>
      activationCode.hashCode ^ otp.hashCode ^ pcSerialNo.hashCode;
}
