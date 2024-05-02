import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:guard_master/common/utils/extension.dart';
import 'package:guard_master/common/widgets/custom_appbar.dart';
import 'package:guard_master/common/widgets/custom_text.dart';
import 'package:guard_master/generated/assets/assets.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class ActiveCodePage extends StatelessWidget {
  const ActiveCodePage({super.key, required this.activationCode});
  final String activationCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: <Widget>[
            3.h.sh,
            CustomText(
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w700,
                color: AppColors.red,
                fontSize: 12.sp,
                text: S.of(context).activationCode),
            2.h.sh,
            CustomText(
              textAlign: TextAlign.center,
              text: S.of(context).systemActivationKey,
              color: AppColors.black,
            ),
            8.h.sh,
            CustomText(
              textAlign: TextAlign.center,
              text: activationCode,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
