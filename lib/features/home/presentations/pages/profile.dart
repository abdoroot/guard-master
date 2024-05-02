import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/app_constant/app_constants.dart';
import 'package:guard_master/common/helper/validator.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:guard_master/common/utils/extension.dart';
import 'package:guard_master/common/widgets/custom_elevated_button.dart';
import 'package:guard_master/common/widgets/custom_text.dart';
import 'package:guard_master/common/widgets/custom_text_form_field.dart';
import 'package:guard_master/features/auth/presentations/pages/change_password_page.dart';
import 'package:guard_master/features/home/presentations/controllers/profile_controller.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return Scaffold(
            body: Center(
              child: Form(
                key: controller.globalKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  children: [
                    CustomText(
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w700,
                        color: AppColors.red,
                        fontSize: 12.sp,
                        text: S.of(context).companyTradeLicenseNo(
                            controller.user?.companyLicenseNo ??
                                AppConstants.licenseNo)),

                    /// name
                    CustomTextFormField(
                      labelAlign: TextAlign.start,
                      labelColor: AppColors.dark1,
                      labelText: S.of(context).name,
                      controller: controller.nameTEXT,
                      validator: (value) => AppValidator.validateFields(
                          value, ValidationType.notEmpty, context),
                    ),

                    /// Company Name
                    CustomTextFormField(
                      labelAlign: TextAlign.start,
                      labelColor: AppColors.dark1,
                      labelText: S.of(context).companyName,
                      controller: controller.companyNameTEXT,
                      validator: (value) => AppValidator.validateFields(
                          value, ValidationType.notEmpty, context),
                    ),

                    /// mobileNumber
                    CustomTextFormField(
                      labelAlign: TextAlign.start,
                      labelColor: AppColors.dark1,
                      labelText: S.of(context).mobileNumber,
                      controller: controller.mobileNumberTEXT,
                    ),

                    /// email
                    CustomTextFormField(
                      labelAlign: TextAlign.start,
                      labelColor: AppColors.dark1,
                      labelText: S.of(context).email,
                      enabled: false,
                      controller: controller.emailTEXT,
                      validator: (value) => AppValidator.validateFields(
                          value, ValidationType.email, context),
                    ),

                    /// country
                    CustomText(
                      textAlign: TextAlign.start,
                      text: S.of(context).country,
                      color: AppColors.dark1,
                    ),
                    1.h.sh,
                    CustomElevatedButton(
                        minimumSize: Size(100.w, 50),
                        color: AppColors.white,
                        elevation: 0,
                        side:
                            BorderSide(color: AppColors.struckColor, width: 1),

                        /*  onPressed: () {
                          showCountryPicker(
                            favorite: [AppConstants.favCountryCode],
                            countryListTheme: CountryListThemeData(
                                bottomSheetHeight: 60.h,
                                inputDecoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    hintText: S.of(context).search,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(100)))),
                            context: context,
                            showPhoneCode: false,
                            showSearch: false,
                            onSelect: (value) => controller.onChangeCountry(value),
                          );
                        }, */
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: controller.user?.country ??
                                    AppConstants.country),
                            Icon(Icons.keyboard_arrow_down,
                                color: AppColors.black),
                          ],
                        )),

                    /// Account Type
                    CustomText(
                      textAlign: TextAlign.start,
                      text: S.of(context).accountType,
                      color: AppColors.dark1,
                    ),
                    1.h.sh,
                    CustomElevatedButton(
                        minimumSize: Size(100.w, 50),
                        color: AppColors.white,
                        elevation: 0,
                        side:
                            BorderSide(color: AppColors.struckColor, width: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: controller.user?.accountType ?? ""),
                            Icon(Icons.keyboard_arrow_down,
                                color: AppColors.black),
                          ],
                        )),
                    6.w.sh,

                    /// update button
                    controller.loading
                        ? Center(
                            child:
                                CircularProgressIndicator(color: AppColors.red))
                        : CustomElevatedButton(
                            onPressed: () => controller.updateInformation(),
                            color: AppColors.black,
                            child: CustomText(
                              text: S.of(context).updateInformation,
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                    2.h.sw,
                    TextButton(
                      onPressed: () {
                        Get.to(
                          () => ChangePasswordPage(),
                        );
                      },
                      child: CustomText(text: S.of(context).changePassword),
                    ),
                    4.h.sh
                  ],
                ),
              ),
            ),
          );
        });
  }
}
