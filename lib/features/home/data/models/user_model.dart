import 'dart:convert';

class UserModel {
  String? uid;
  String? name;
  String? activationCode;
  String? companyName;

  String? phone;
  String? email;
  String? country;
  String? accountType;
  int? companyLicenseNo;
  String? pcSerialNo;
  String? createdAt;
  String? updateAt;

  String? fCM;
  String? adminAccepted;
  String? pcStatus;
  UserModel({
    this.uid,
    this.name,
    this.companyName,
    this.phone,
    this.activationCode,
    this.email,
    this.country,
    this.accountType,
    this.companyLicenseNo,
    this.createdAt,
    this.updateAt,
    this.pcSerialNo,
    this.pcStatus,
    this.fCM,
    this.adminAccepted,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? companyName,
    String? mobileNumber,
    String? email,
    String? activeCode,
    String? adminAccepted,
    String? country,
    String? accountType,
    String? createdAt,
    String? updateAt,
    String? fcm,
    String? pcSerialNo,
    String? pcStatus,
    int? companyLicenseNo,
  }) =>
      UserModel(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        companyName: companyName ?? this.companyName,
        phone: mobileNumber ?? this.phone,
        email: email ?? this.email,
        activationCode: activeCode ?? this.activationCode,
        fCM: fcm ?? this.fCM,
        adminAccepted: adminAccepted ?? this.adminAccepted,
        country: country ?? this.country,
        accountType: accountType ?? this.accountType,
        companyLicenseNo: companyLicenseNo ?? this.companyLicenseNo,
        createdAt: createdAt ?? this.createdAt,
        updateAt: updateAt ?? this.updateAt,
        pcSerialNo: pcSerialNo ?? this.pcSerialNo,
        pcStatus: pcStatus ?? this.pcStatus,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        if (uid != null) 'uid': uid,
        if (name != null) 'name': name,
        if (companyName != null) 'companyName': companyName,
        if (phone != null) 'mobileNumber': phone,
        if (email != null) 'email': email,
        if (activationCode != null) 'activeCode': activationCode,
        if (country != null) 'country': country,
        if (adminAccepted != null) 'adminAccepted': adminAccepted,
        if (fCM != null) 'fcm': fCM,
        if (accountType != null) 'accountType': accountType,
        if (companyLicenseNo != null) 'companyLicenseNo': companyLicenseNo,
        if (createdAt != null) 'createdAt': createdAt,
        if (updateAt != null) 'updateAt': updateAt,
        if (pcSerialNo != null) 'pcSerialNo': pcSerialNo,
        if (pcStatus != null) 'pcStatus': pcStatus,
      };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        uid: map['uid'] != null ? map['uid'] as String : null,
        name: map['name'] != null ? map['name'] as String : null,
        activationCode:
            map['activeCode'] != null ? map['activeCode'] as String : null,
        adminAccepted: map['adminAccepted'] != null
            ? map['adminAccepted'] as String
            : null,
        companyName:
            map['companyName'] != null ? map['companyName'] as String : null,
        phone:
            map['mobileNumber'] != null ? map['mobileNumber'] as String : null,
        email: map['email'] != null ? map['email'] as String : null,
        country: map['country'] != null ? map['country'] as String : null,
        fCM: map['fcm'] != null ? map['fcm'] as String : null,
        accountType:
            map['accountType'] != null ? map['accountType'] as String : null,
        companyLicenseNo: map['companyLicenseNo'] != null
            ? map['companyLicenseNo'] as int
            : null,
        createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
        updateAt: map['updateAt'] != null ? map['updateAt'] as String : null,
        pcSerialNo:
            map['pcSerialNo'] != null ? map['pcSerialNo'] as String : null,
        pcStatus: map['pcStatus'] != null ? map['pcStatus'] as String : null,
      );

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserModel(uid: $uid, adminAccepted: $adminAccepted, fcm: $fCM, name: $name, companyName: $companyName, mobileNumber: $phone, email: $email, country: $country, accountType: $accountType, companyLicenseNo: $companyLicenseNo, createdAt: $createdAt, updateAt: $updateAt, pcSerialNo: $pcSerialNo, pcStatus: $pcStatus, activeCode: $activationCode)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.activationCode == activationCode &&
        other.adminAccepted == adminAccepted &&
        other.companyName == companyName &&
        other.phone == phone &&
        other.email == email &&
        other.fCM == fCM &&
        other.country == country &&
        other.accountType == accountType &&
        other.createdAt == createdAt &&
        other.updateAt == updateAt &&
        other.pcSerialNo == pcSerialNo &&
        other.pcStatus == pcStatus &&
        other.companyLicenseNo == companyLicenseNo;
  }

  @override
  int get hashCode =>
      uid.hashCode ^
      name.hashCode ^
      fCM.hashCode ^
      companyName.hashCode ^
      phone.hashCode ^
      email.hashCode ^
      activationCode.hashCode ^
      country.hashCode ^
      adminAccepted.hashCode ^
      accountType.hashCode ^
      createdAt.hashCode ^
      updateAt.hashCode ^
      pcSerialNo.hashCode ^
      pcStatus.hashCode ^
      companyLicenseNo.hashCode;
}
