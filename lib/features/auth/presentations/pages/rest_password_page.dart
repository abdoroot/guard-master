import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/helper/validator.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:guard_master/common/routes/pages.dart';
import 'package:guard_master/common/utils/extension.dart';
import 'package:guard_master/common/widgets/custom_appbar.dart';
import 'package:guard_master/common/widgets/custom_elevated_button.dart';
import 'package:guard_master/common/widgets/custom_text.dart';
import 'package:guard_master/common/widgets/custom_text_form_field.dart';
import 'package:guard_master/features/auth/presentations/controllers/rest_password_controller.dart';
import 'package:guard_master/generated/assets/assets.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class RestPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestPasswordController>(
      builder: (RestPasswordController controller) {
        return Scaffold(
          appBar: CustomAppBar(
            heightAppBar: 60,
            fromScreen: PagesString.login,
            onPressBack: () => Get.offAllNamed(PagesString.login),
          ),
          body: Form(
            key: controller.globalKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              children: <Widget>[
                SvgPicture.asset(Assets.assetsImagesSvgLogo),
                4.h.sh,
                CustomText(
                  textAlign: TextAlign.center,
                  text: S.of(context).restorePassword,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: AppColors.red),
                ),
                2.h.sh,
                CustomText(
                  textAlign: TextAlign.center,
                  text: S.of(context).enterTheNewPassword,
                  color: AppColors.dark0,
                ),
                4.h.sh,
                CustomTextFormField(
                  obscureText: true,
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
                  textAlign: TextAlign.center,
                  labelText: S.of(context).confirmNewPassword,
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
                4.h.sh,
                controller.loading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.red,
                        ),
                      )
                    : CustomElevatedButton(
                        onPressed: () => controller.rest(),
                        child: Text(
                          S.of(context).restore,
                        ),
                      ),
                2.h.sh,
                CustomText(
                  textAlign: TextAlign.center,
                  text: S.of(context).approvedByDubaiCivilDefense,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
