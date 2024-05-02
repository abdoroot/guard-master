// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RequestModel {
  int? id;
  String? name;
  String? technical_uid;
  String? companyName;
  String? country;

  String? work;
  String? adminAccepted;
  String? otp;

  String? requestStatus;
  String? createdAt;
  String? updateAt;
  String? workFilm;
  String? pcSerialNo;

  RequestModel({
    this.id,
    this.name,
    this.technical_uid,
    this.companyName,
    this.country,
    this.work,
    this.adminAccepted,
    this.otp,
    this.requestStatus,
    this.createdAt,
    this.updateAt,
    this.workFilm,
    this.pcSerialNo,
  });

  RequestModel copyWith({
    int? id,
    String? name,
    String? technical_uid,
    String? companyName,
    String? country,
    String? work,
    String? adminAccepted,
    String? otp,
    String? requestStatus,
    String? createdAt,
    String? updateAt,
    String? workFilm,
    String? pcSerialNo,
  }) {
    return RequestModel(
      id: id ?? this.id,
      name: name ?? this.name,
      technical_uid: technical_uid ?? this.technical_uid,
      companyName: companyName ?? this.companyName,
      country: country ?? this.country,
      work: work ?? this.work,
      adminAccepted: adminAccepted ?? this.adminAccepted,
      otp: otp ?? this.otp,
      requestStatus: requestStatus ?? this.requestStatus,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
      workFilm: workFilm ?? this.workFilm,
      pcSerialNo: pcSerialNo ?? this.pcSerialNo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'technical_uid': technical_uid,
      'companyName': companyName,
      'country': country,
      'work': work,
      'adminAccepted': adminAccepted,
      'otp': otp,
      'requestStatus': requestStatus,
      'createdAt': createdAt,
      'updateAt': updateAt,
      'workFilm': workFilm,
      'pcSerialNo': pcSerialNo,
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    return RequestModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      technical_uid:
          map['technical_uid'] != null ? map['technical_uid'] as String : null,
      companyName:
          map['companyName'] != null ? map['companyName'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      work: map['work'] != null ? map['work'] as String : null,
      adminAccepted:
          map['adminAccepted'] != null ? map['adminAccepted'] as String : null,
      otp: map['otp'] != null ? map['otp'] as String : null,
      requestStatus:
          map['requestStatus'] != null ? map['requestStatus'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updateAt: map['updateAt'] != null ? map['updateAt'] as String : null,
      workFilm: map['workFilm'] != null ? map['workFilm'] as String : null,
      pcSerialNo:
          map['pcSerialNo'] != null ? map['pcSerialNo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestModel.fromJson(String source) =>
      RequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RequestModel(id: $id, name: $name, technical_uid: $technical_uid, companyName: $companyName, country: $country, work: $work, adminAccepted: $adminAccepted, otp: $otp, requestStatus: $requestStatus, createdAt: $createdAt, updateAt: $updateAt, workFilm: $workFilm, pcSerialNo: $pcSerialNo)';
  }

  @override
  bool operator ==(covariant RequestModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.technical_uid == technical_uid &&
        other.companyName == companyName &&
        other.country == country &&
        other.work == work &&
        other.adminAccepted == adminAccepted &&
        other.otp == otp &&
        other.requestStatus == requestStatus &&
        other.createdAt == createdAt &&
        other.updateAt == updateAt &&
        other.workFilm == workFilm &&
        other.pcSerialNo == pcSerialNo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        technical_uid.hashCode ^
        companyName.hashCode ^
        country.hashCode ^
        work.hashCode ^
        adminAccepted.hashCode ^
        otp.hashCode ^
        requestStatus.hashCode ^
        createdAt.hashCode ^
        updateAt.hashCode ^
        workFilm.hashCode ^
        pcSerialNo.hashCode;
  }
}
