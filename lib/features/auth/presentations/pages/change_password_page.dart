import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/helper/validator.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:guard_master/common/utils/extension.dart';
import 'package:guard_master/common/widgets/custom_appbar.dart';
import 'package:guard_master/common/widgets/custom_elevated_button.dart';
import 'package:guard_master/common/widgets/custom_text.dart';
import 'package:guard_master/common/widgets/custom_text_form_field.dart';
import 'package:guard_master/features/auth/presentations/controllers/change_password_controller.dart';
import 'package:guard_master/generated/assets/assets.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
      init: ChangePasswordController(),
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBar(
            isLogout: true,
            CustomTitle: SvgPicture.asset(
              Assets.assetsImagesSvgLogo,
              width: 20.w,
              height: 20.w,
            ),
            backButton: true,
            centerTitle: true,
            side: true,
          ),
          body: Form(
            key: controller.globalKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              children: <Widget>[
                4.h.sh,
                CustomText(
                  textAlign: TextAlign.center,
                  text: S.of(context).changePassword,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: AppColors.red),
                ),
                2.h.sh,
                CustomText(
                  textAlign: TextAlign.center,
                  text:
                      S.of(context).enterTheOldPasswordAndAddTheNewPasswordThen,
                  color: AppColors.dark0,
                ),
                4.h.sh,
                CustomTextFormField(
                  obscureText: true,
                  labelAlign: TextAlign.start,
                  textAlign: TextAlign.center,
                  labelText: S.of(context).oldPassword,
                  hintText: S.of(context).hintPassword,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      Assets.assetsImagesSvgLock,
                    ),
                  ),
                  controller: controller.oldPasswordTEXT,
                  validator: (value) => AppValidator.validateFields(
                      value, ValidationType.password, context),
                ),
                4.h.sh,
                CustomTextFormField(
                  obscureText: true,
                  labelAlign: TextAlign.start,
                  textAlign: TextAlign.center,
                  labelText: S.of(context).newPassword,
                  hintText: S.of(context).hintPassword,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      Assets.assetsImagesSvgLock,
                    ),
                  ),
                  controller: controller.newPasswordTEXT,
                  validator: (value) => AppValidator.validateFields(
                      value, ValidationType.password, context),
                ),
                4.h.sh,
                CustomTextFormField(
                  obscureText: true,
                  labelAlign: TextAlign.start,
                  textAlign: TextAlign.center,
                  labelText: S.of(context).reenterYourNewPassword,
                  hintText: S.of(context).hintPassword,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      Assets.assetsImagesSvgLock,
                    ),
                  ),
                  controller: controller.confirmNewPasswordTEXT,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).requiredField;
                    }
                    if (value != controller.newPasswordTEXT.text) {
                      return S.of(context).passwordsDoNotMatch;
                    }
                    return null;
                  },
                ),
                5.h.sh,
                controller.loading
                    ? Center(
                        child: CircularProgressIndicator(color: AppColors.red))
                    : CustomElevatedButton(
                        onPressed: () => controller.changePassword(),
                        color: AppColors.black,
                        child: CustomText(
                          text: S.of(context).save,
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                2.h.sh,
              ],
            ),
          ),
        );
      },
    );
  }
}
