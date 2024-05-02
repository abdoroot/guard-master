import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guard_master/common/app_constant/app_constants.dart';
import 'package:guard_master/common/utils/utils.dart';
import 'package:guard_master/generated/l10n.dart';

enum ValidationType {
  phone,
  appName,
  cardNumber,
  notEmpty,
  email,
  ipAddress,
  password,
  validationCode
}

class AppValidator {
  static FilteringTextInputFormatter priceValueOnly() {
    return FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'));
  }

  static String? validateFields(
    String? value,
    ValidationType fieldType,
    BuildContext context, {
    int? length,
  }) {
    if (value == null) {
      return S.of(context).requiredField;
    } else if (fieldType == ValidationType.email) {
      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
        return S.of(context).enterValidateEmail;
      }
    } else if (fieldType == ValidationType.password) {
      if (value.length < 6) {
        return S.of(context).enterValidatePassword;
      }
    } else if (fieldType == ValidationType.phone) {
      if (value.length != AppConstants.phoneLength) {
        return S.of(context).validPhone;
      }
    } else if (fieldType == ValidationType.notEmpty) {
      if (value.trim().isEmpty || value.isEmpty) {
        return S.of(context).requiredField;
      }
    } else if (fieldType == ValidationType.validationCode) {
      if (value.isEmpty || value.length != AppConstants.codeLength) {
        return Utils.showError(S.of(context).enterAValidVerificationCode) ?? '';
      }
    }
    return null;
  }
}
