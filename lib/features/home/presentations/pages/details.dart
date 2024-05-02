import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/app_constant/app_constants.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:guard_master/common/services/launcher.dart';
import 'package:guard_master/common/utils/extension.dart';
import 'package:guard_master/common/widgets/custom_elevated_button.dart';
import 'package:guard_master/common/widgets/custom_text.dart';
import 'package:guard_master/features/home/presentations/controllers/home_controller.dart';
import 'package:guard_master/generated/assets/assets.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    4.h.sh,
                    CustomText(
                      textAlign: TextAlign.center,
                      text: S.of(context).contactUs,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: AppColors.red),
                    ),
                    4.h.sh,
                    CustomElevatedButton(
                        color: AppColors.scaffoldColor,
                        side: BorderSide(
                            color: AppColors.struckColor, width: 1.5),
                        radius: 10,
                        onPressed: () => WebSiteLaunch.openWhatsApp(
                            context, AppConstants.componyWhatsApp),
                        child: Row(
                          children: <Widget>[
                            SvgPicture.asset(Assets.assetsImagesSvgWhatsappIc),
                            Spacer(),
                            CustomText(
                              text: AppConstants.componyWhatsApp,
                            ),
                            Spacer(),
                          ],
                        )),
                    4.h.sh,
                    CustomElevatedButton(
                        color: AppColors.scaffoldColor,
                        side: BorderSide(
                            color: AppColors.struckColor, width: 1.5),
                        radius: 10,
                        onPressed: () =>
                            WebSiteLaunch.launcher(AppConstants.componyPhone),
                        child: Row(
                          children: <Widget>[
                            SvgPicture.asset(Assets.assetsImagesSvgPhoneNumIc),
                            Spacer(),
                            CustomText(
                              text: AppConstants.componyPhone,
                            ),
                            Spacer(),
                          ],
                        )),
                    4.h.sh,
                    CustomElevatedButton(
                        color: AppColors.scaffoldColor,
                        side: BorderSide(
                            color: AppColors.struckColor, width: 1.5),
                        radius: 10,
                        onPressed: () =>
                            WebSiteLaunch.launcher(AppConstants.componyEmail),
                        child: Row(
                          children: <Widget>[
                            SvgPicture.asset(Assets.assetsImagesSvgGmailIc),
                            Spacer(),
                            CustomText(
                              text: AppConstants.componyEmail,
                            ),
                            Spacer(),
                          ],
                        )),
                    4.h.sh,
                    Spacer(),
                    CustomText(
                      textAlign: TextAlign.center,
                      text: S.of(context).approvedByDubaiCivilDefense,
                    ),
                    4.h.sh,
                  ],
                ),
              ),
            ),
          );
        });
  }
}
