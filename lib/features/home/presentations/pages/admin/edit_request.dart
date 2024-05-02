import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import 'package:guard_master/features/home/presentations/controllers/admin/request_controller.dart';

import 'package:guard_master/generated/assets/assets.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class EditRequest extends StatelessWidget {
  EditRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestAdminController>(
        initState: RequestAdminController.to.onEditOpen(),
        builder: (RequestAdminController controller) {
          return Scaffold(
            appBar: CustomAppBar(
              isLogout: true,
              CustomTitle:
                  SvgPicture.asset(Assets.assetsImagesSvgLogo, height: 90),
              centerTitle: true,
              onPressBack: () => Get.back(),
              side: true,
            ),
            body: Form(
              key: controller.globalKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    CustomText(
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w700,
                        color: AppColors.red,
                        fontSize: 12.sp,
                        text: S.of(context).editRequest(controller.id ?? "")),

                    /// name
                    CustomTextFormField(
                      labelAlign: TextAlign.start,
                      labelColor: AppColors.dark1,
                      labelText: S.of(context).name,
                      controller: controller.nameTEXT,
                      enabled: false,
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
                    SizedBox(
                      width: 100.w,
                      child: CustomText(
                        textAlign: TextAlign.start,
                        text: S.of(context).country,
                        color: AppColors.dark1,
                      ),
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
                            CustomText(text: controller.selectedCountry),
                            Icon(Icons.keyboard_arrow_down,
                                color: AppColors.black),
                          ],
                        )),

                    /// order Status
                    SizedBox(
                      width: 100.w,
                      child: CustomText(
                        textAlign: TextAlign.start,
                        text: S.of(context).orderStatus,
                        color: AppColors.dark1,
                      ),
                    ),
                    1.h.sh,
                    CustomElevatedButton(
                        minimumSize: Size(100.w, 50),
                        color: AppColors.white,
                        elevation: 0,
                        side:
                            BorderSide(color: AppColors.struckColor, width: 1),
                        onPressed: () async => controller
                                .onChangeRequest(await Utils.showBottomSheet(
                              listData: AppConstants.statusOfRequest,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: controller.requestStatus ??
                                    S.of(Get.context!).chosesOrderStatus),
                            Icon(Icons.keyboard_arrow_down,
                                color: AppColors.black),
                          ],
                        )),
                    2.w.sh,

                    /// work
                    CustomTextFormField(
                      minLines: 3,
                      maxLines: 6,
                      enabled: false,
                      labelAlign: TextAlign.start,
                      textAlign: TextAlign.center,
                      labelColor: AppColors.dark1,
                      hintText: S.of(context).work,
                      controller: controller.workTEXT,
                      validator: (value) => AppValidator.validateFields(
                          value, ValidationType.notEmpty, context),
                    ),
                    6.w.sh,

                    /// newRequest button
                    controller.loading
                        ? Center(
                            child:
                                CircularProgressIndicator(color: AppColors.red))
                        : CustomElevatedButton(
                            onPressed: () => controller.editRequest(),
                            color: AppColors.black,
                            child: CustomText(
                              text: S.of(context).save,
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                    2.h.sw,
                  ],
                ),
              ),
            ),
          );
        });
  }
}
