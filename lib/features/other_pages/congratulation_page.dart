import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:guard_master/common/routes/pages.dart';
import 'package:guard_master/common/utils/extension.dart';
import 'package:guard_master/common/widgets/custom_appbar.dart';
import 'package:guard_master/common/widgets/custom_elevated_button.dart';
import 'package:guard_master/common/widgets/custom_text.dart';
import 'package:guard_master/features/home/presentations/controllers/user/otp_controller.dart';
import 'package:guard_master/generated/assets/assets.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class CongratulationPageUSer extends StatelessWidget {
  const CongratulationPageUSer(
      {super.key, required this.fromScreen, this.requestNo});
  final String fromScreen;
  final int? requestNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        heightAppBar: fromScreen == PagesString.login ? 60 : 100,
        CustomTitle: fromScreen == PagesString.login
            ? null
            : SvgPicture.asset(
                Assets.assetsImagesSvgLogo,
                height: 90,
              ),
        side: true,
        fromScreen: fromScreen,
        onPressBack: fromScreen == PagesString.login
            ? () => Get.offAllNamed(PagesString.login)
            : () => Get.offAllNamed(
                  PagesString.home,
                ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              3.h.sh,
              fromScreen == PagesString.login
                  ? SvgPicture.asset(Assets.assetsImagesSvgLogo)
                  : CustomText(
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                      color: AppColors.secondary,
                      fontSize: 9.sp,
                      text: S.of(context).requestNoReq(requestNo ?? '')),
              4.h.sh,
              SvgPicture.asset(Assets.assetsImagesSvgCongratulations),
              4.h.sh,
              CustomText(
                textAlign: TextAlign.center,
                text: fromScreen == PagesString.login
                    ? S.of(context).congratulations
                    : S.of(context).submitted,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: AppColors.red),
              ),
              2.h.sh,
              CustomText(
                textAlign: TextAlign.center,
                text: fromScreen == PagesString.login
                    ? S.of(context).passwordChangedSuccessfully
                    : S
                        .of(context)
                        .youWillReceiveANotificationWhenYourRequestIsApproved,
                color: AppColors.dark0,
              ),
              4.h.sh,
              CustomElevatedButton(
                minimumSize: Size(100.w, 56),
                onPressed: () async => fromScreen == PagesString.login
                    ? Get.offAllNamed(fromScreen)
                    : {
                        await OTPRequestController.to.lengthREquests(),
                        Get.offAllNamed(PagesString.home),
                      },
                child: Text(
                  fromScreen == PagesString.login
                      ? S.of(context).continueToChangePassword
                      : S.of(context).back,
                ),
              ),
              Spacer(),
              CustomText(
                textAlign: TextAlign.center,
                text: S.of(context).approvedByDubaiCivilDefense,
              ),
              2.h.sh,
            ],
          ),
        ),
      ),
    );
  }
}
