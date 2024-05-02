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
import 'package:guard_master/features/home/presentations/controllers/user/request_controller.dart';
import 'package:guard_master/generated/assets/assets.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class WorkFilm extends StatelessWidget {
  WorkFilm({super.key});

  final GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestUserController>(
        initState: RequestUserController.to.onWorkFilm(),
        builder: (RequestUserController controller) => Scaffold(
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
              body: Center(
                child: Form(
                  key: _globalKey,
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    children: [
                      CustomText(
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w700,
                          color: AppColors.red,
                          fontSize: 12.sp,
                          text: S.of(context).workFilm),
                      2.h.sh,
                      CustomText(
                        textAlign: TextAlign.center,
                        text: S.of(context).whereDoYouWantToSendTheFilm,
                        color: AppColors.dark0,
                      ),
                      4.h.sh,
                      CustomTextFormField(
                        textAlign: TextAlign.start,
                        labelAlign: TextAlign.start,
                        labelText: S.of(context).email,
                        labelColor: AppColors.dark1,
                        hintText: S.of(context).hintEmail,
                        controller: controller.emailTEXT,
                        validator: (value) => AppValidator.validateFields(
                            value, ValidationType.email, context),
                      ),

                      6.w.sh,

                      /// send button
                      controller.sent
                          ? Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.red),
                            )
                          : CustomElevatedButton(
                              onPressed: () async {
                                if (_globalKey.currentState!.validate()) {
                                  await controller.sendEmail();
                                }
                              },
                              color: AppColors.black,
                              child: CustomText(
                                text: S.of(context).send,
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                      2.h.sw,
                    ],
                  ),
                ),
              ),
            ));
  }
}
