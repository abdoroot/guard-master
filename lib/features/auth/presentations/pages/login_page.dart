import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/helper/validator.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:guard_master/common/routes/pages.dart';
import 'package:guard_master/common/utils/extension.dart';
import 'package:guard_master/common/widgets/custom_appbar.dart';
import 'package:guard_master/common/widgets/custom_elevated_button.dart';
import 'package:guard_master/common/widgets/custom_text.dart';
import 'package:guard_master/common/widgets/custom_text_form_field.dart';
import 'package:guard_master/features/auth/presentations/controllers/login_controller.dart';
import 'package:guard_master/generated/assets/assets.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (LoginController controller) {
        return Scaffold(
          appBar: CustomAppBar(
            heightAppBar: 56,
            fromScreen: PagesString.initial,
            onPressBack: () {},
            backButton: false,
          ),
          body: Form(
            key: controller.globalKey,
            child: AutofillGroup(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                children: <Widget>[
                  SvgPicture.asset(Assets.assetsImagesSvgLogo),
                  4.h.sh,
                  CustomText(
                    textAlign: TextAlign.center,
                    text: S.of(context).welcome(""),
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: AppColors.red),
                  ),
                  2.h.sh,
                  CustomText(
                    textAlign: TextAlign.center,
                    text: S.of(context).enterLoginInformation,
                    color: AppColors.dark0,
                  ),
                  4.h.sh,
                  CustomTextFormField(
                    textAlign: TextAlign.center,
                    autofillHints: [AutofillHints.email],
                    labelText: S.of(context).email,
                    hintText: S.of(context).hintEmail,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(Assets.assetsImagesSvgSmsIc),
                    ),
                    controller: controller.emailTEXT,
                    validator: (value) => AppValidator.validateFields(
                        value, ValidationType.email, context),
                  ),
                  4.h.sh,
                  CustomTextFormField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    autofillHints: [AutofillHints.password],
                    labelText: S.of(context).password,
                    hintText: S.of(context).hintPassword,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        Assets.assetsImagesSvgLock,
                      ),
                    ),
                    controller: controller.passwordTEXT,
                    validator: (value) => AppValidator.validateFields(
                        value, ValidationType.password, context),
                  ),
                  3.h.sh,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => controller.forgetPassword(),
                      child: CustomText(
                        text: S.of(context).forgotYourPassword,
                        fontWeight: FontWeight.w700,
                        color: AppColors.red,
                      ),
                    ),
                  ),
                  2.h.sh,
                  controller.loading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.red,
                          ),
                        )
                      : CustomElevatedButton(
                          onPressed: () => controller.login(),
                          child: Text(
                            S.of(context).login,
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
          ),
        );
      },
    );
  }
}
