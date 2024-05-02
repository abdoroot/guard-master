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
import 'package:guard_master/features/auth/presentations/controllers/otp_controller.dart';
import 'package:guard_master/generated/assets/assets.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

class OTPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OTPController>(
        init: OTPController(),
        builder: (OTPController controller) {
          return Scaffold(
            appBar: CustomAppBar(
              heightAppBar: 60,
              fromScreen: PagesString.forgetPassword,
              onPressBack: () => Get.offNamed(PagesString.forgetPassword),
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
                    text: S.of(context).changePassword,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: AppColors.red),
                  ),
                  2.h.sh,
                  CustomText(
                    textAlign: TextAlign.center,
                    text: S
                        .of(context)
                        .aConfirmationCodeToChangeThePasswordHasBeenSent,
                    color: AppColors.dark0,
                  ),
                  4.h.sh,
                  Pinput(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    length: 6,
                    defaultPinTheme: PinTheme(
                      width: 25.w,
                      height: 60,
                      textStyle: const TextStyle(
                        fontSize: 22,
                        color: Color.fromRGBO(30, 60, 87, 1),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: AppColors.struckColor),
                      ),
                    ),
                    validator: (value) => AppValidator.validateFields(
                        value, ValidationType.validationCode, context),
                    keyboardType: TextInputType.number,
                    controller: controller.codeTEXT,
                    onCompleted: (pin) {
                      controller.verificationCode();
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
                          onPressed: () => controller.verificationCode(),
                          child: Text(
                            S.of(context).changePassword,
                          ),
                        ),
                  SizedBox(
                    height: 30.h,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomText(
                        textAlign: TextAlign.center,
                        text: S.of(context).approvedByDubaiCivilDefense,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
