import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/app_constant/app_constants.dart';
import 'package:guard_master/common/helper/cach.dart';
import 'package:guard_master/common/helper/validator.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:guard_master/common/utils/extension.dart';
import 'package:guard_master/common/widgets/custom_elevated_button.dart';
import 'package:guard_master/common/widgets/custom_text.dart';
import 'package:guard_master/common/widgets/custom_text_form_field.dart';
import 'package:guard_master/features/home/data/models/user_model.dart';
import 'package:guard_master/features/home/presentations/controllers/home_controller.dart';
import 'package:guard_master/features/home/presentations/controllers/user/otp_controller.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class OTP extends StatelessWidget {
  OTP({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OTPRequestController>(
        init: OTPRequestController(),
        builder: (controller) {
          return Scaffold(
            body: Form(
              key: controller.globalKey,
              child: StreamBuilder(
                  stream: HomeController.to.getAllTechnicians(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.red,
                        ),
                      );

                    List<UserModel> _currentTechnical = <UserModel>[];

                    snapshot.data!.docs.forEach((e) async {
                      final UserModel data = UserModel.fromMap(e.data());
                      if (HomeController.to.accountType ==
                              KeyStorage.typeTechnical &&
                          data.uid == FirebaseAuth.instance.currentUser?.uid) {
                        _currentTechnical.add(data);
                      }
                    });

                    if (_currentTechnical.first.pcStatus !=
                        AppConstants.statusOfActivation[0])
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.no_accounts_outlined,
                              size: 10.h,
                              color: AppColors.dark4,
                            ),
                            3.h.sh,
                            CustomText(
                              text: S.of(context).yourAccountNotActive,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ],
                        ),
                      );

                    controller.lengthREquests();
                    controller.nameTEXT.text =
                        _currentTechnical.first.name ?? "";
                    controller.companyNameTEXT.text =
                        _currentTechnical.first.companyName ?? "";
                    controller.selectedCountry =
                        _currentTechnical.first.country ?? "";
                    return ListView(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      children: [
                        CustomText(
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w700,
                            color: AppColors.red,
                            fontSize: 12.sp,
                            text: S.of(context).sendNewRequests),
                        3.w.sw,
                        CustomText(
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w700,
                            color: AppColors.secondary,
                            fontSize: 9.sp,
                            text: S
                                .of(context)
                                .requestNoReq(controller.requestNo)),

                        /// name
                        CustomTextFormField(
                          enabled: false,
                          labelAlign: TextAlign.start,
                          labelColor: AppColors.dark1,
                          labelText: S.of(context).name,
                          controller: controller.nameTEXT,
                          validator: (value) => AppValidator.validateFields(
                              value, ValidationType.notEmpty, context),
                        ),

                        /// Company Name
                        CustomTextFormField(
                          enabled: false,
                          labelAlign: TextAlign.start,
                          labelColor: AppColors.dark1,
                          labelText: S.of(context).companyName,
                          controller: controller.companyNameTEXT,
                          validator: (value) => AppValidator.validateFields(
                              value, ValidationType.notEmpty, context),
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
                            side: BorderSide(
                                color: AppColors.struckColor, width: 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(text: controller.selectedCountry),
                                Icon(Icons.keyboard_arrow_down,
                                    color: AppColors.black),
                              ],
                            )),

                        /// work
                        CustomTextFormField(
                            minLines: 3,
                            maxLines: 5,
                            labelAlign: TextAlign.start,
                            textAlign: TextAlign.center,
                            labelColor: AppColors.dark1,
                            labelText: S.of(context).work,
                            validator: (value) => AppValidator.validateFields(
                                value, ValidationType.notEmpty, context),
                            controller: controller.workTEXT),
                        6.w.sh,

                        /// newRequest button
                        controller.loading
                            ? Center(
                                child: CircularProgressIndicator(
                                    color: AppColors.red))
                            : CustomElevatedButton(
                                onPressed: () => controller.newRequestOTP(),
                                color: AppColors.black,
                                child: CustomText(
                                  text: S.of(context).send,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                        2.h.sw,
                      ],
                    );
                  }),
            ),
          );
        });
  }
}
