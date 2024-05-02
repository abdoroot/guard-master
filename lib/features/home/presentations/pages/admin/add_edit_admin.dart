import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/app_constant/app_constants.dart';
import 'package:guard_master/common/helper/validator.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:guard_master/common/utils/extension.dart';
import 'package:guard_master/common/utils/utils.dart';
import 'package:guard_master/common/widgets/custom_appbar.dart';
import 'package:guard_master/common/widgets/custom_elevated_button.dart';
import 'package:guard_master/common/widgets/custom_text.dart';
import 'package:guard_master/common/widgets/custom_text_form_field.dart';
import 'package:guard_master/features/home/presentations/controllers/admin/Admins_controller.dart';
import 'package:guard_master/generated/assets/assets.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class AddEditAdminPage extends StatelessWidget {
  AddEditAdminPage({super.key, this.isEdit = false});
  final bool? isEdit;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminsController>(
        initState: isEdit! ? AdminsController.to.onEditAdmin() : null,
        builder: (AdminsController controller) {
          return Scaffold(
            appBar: CustomAppBar(
              isLogout: true,
              CustomTitle:
                  SvgPicture.asset(Assets.assetsImagesSvgLogo, height: 90),
              centerTitle: true,
              side: true,
            ),
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
                        text: S
                            .of(context)
                            .companyTradeLicenseNo(AppConstants.licenseNo)),

                    /// name
                    CustomTextFormField(
                      labelAlign: TextAlign.start,
                      labelColor: AppColors.dark1,
                      labelText: S.of(context).name,
                      hintText: S.of(context).enterYourName,
                      controller: controller.nameTEXT,
                      validator: (value) => AppValidator.validateFields(
                          value, ValidationType.notEmpty, context),
                    ),

                    /// Company Name
                    CustomTextFormField(
                      labelAlign: TextAlign.start,
                      labelColor: AppColors.dark1,
                      hintText: S.of(context).enterYourCompanyName,
                      labelText: S.of(context).companyName,
                      controller: controller.companyNameTEXT,
                      validator: (value) => AppValidator.validateFields(
                          value, ValidationType.notEmpty, context),
                    ),

                    /// mobileNumber
                    CustomTextFormField(
                      labelAlign: TextAlign.start,
                      labelColor: AppColors.dark1,
                      hintText: S.of(context).enterYourMobileNumber,
                      labelText: S.of(context).mobileNumber,
                      maxLength: AppConstants.phoneLength,
                      counterText: "",
                      controller: controller.phoneTEXT,
                      validator: (value) => AppValidator.validateFields(
                          value, ValidationType.notEmpty, context),
                    ),

                    /// email
                    CustomTextFormField(
                      labelAlign: TextAlign.start,
                      labelColor: AppColors.dark1,
                      labelText: S.of(context).email,
                      hintText: S.of(context).enterYourEmail,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(text: AppConstants.country),
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
                        /*  onPressed: () async {
                          final choses = await Utils.showBottomSheet(
                              listData: AppConstants.accountType);
                          controller.changeUserAccountType(choses);
                        }, */
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: controller.accountType.isNotEmpty
                                    ? controller.accountType
                                    : S.of(Get.context!).chosesAccountType),
                            Icon(Icons.keyboard_arrow_down,
                                color: AppColors.black),
                          ],
                        )),

                    /// pcStatus Type
                    CustomText(
                      textAlign: TextAlign.start,
                      text: S.of(context).adminStatus,
                      color: AppColors.dark1,
                    ),
                    1.h.sh,
                    CustomElevatedButton(
                        minimumSize: Size(100.w, 50),
                        color: AppColors.white,
                        elevation: 0,
                        side:
                            BorderSide(color: AppColors.struckColor, width: 1),
                        onPressed: () async {
                          final choses = await Utils.showBottomSheet(
                              listData: AppConstants.statusOfActivation);
                          controller.changePCStatus(choses);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: controller.pcStatus.isNotEmpty
                                    ? controller.pcStatus
                                    : S.of(Get.context!).chosesAccountType),
                            Icon(Icons.keyboard_arrow_down,
                                color: AppColors.black),
                          ],
                        )),
                    6.w.sh,

                    /// update button
                    controller.loadingAdd
                        ? Center(
                            child:
                                CircularProgressIndicator(color: AppColors.red))
                        : CustomElevatedButton(
                            onPressed: isEdit!
                                ? () => controller.editAdmin()
                                : () => controller.addNewAdmin(),
                            color: AppColors.black,
                            child: CustomText(
                              text: isEdit!
                                  ? S.of(context).save
                                  : S.of(context).add,
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                    4.w.sh,
                  ],
                ),
              ),
            ),
          );
        });
  }
}
