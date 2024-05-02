import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/helper/cach.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:guard_master/common/routes/pages.dart';
import 'package:guard_master/common/utils/extension.dart';
import 'package:guard_master/common/utils/utils.dart';
import 'package:guard_master/features/other_pages/contact_us_page.dart';
import 'package:guard_master/generated/assets/assets.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.heightAppBar = 100,
    this.fromScreen,
    this.CustomTitle,
    this.side = false,
    this.centerTitle = false,
    this.backgroundColor = AppColors.white,
    this.backButton = true,
    this.onPressBack,
    this.onTap,
    this.action,
    this.isLogout = false,
  });
  final String? title, fromScreen;
  final double? heightAppBar;
  final Widget? CustomTitle;
  final List<Widget>? action;
  final bool centerTitle, side, backButton, isLogout;
  final Color? backgroundColor;
  final void Function()? onPressBack, onTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: CustomTitle != null
          ? Center(
              child: Column(
              children: [
                4.h.sh,
                CustomTitle!,
              ],
            ))
          : null,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          side: side
              ? BorderSide(
                  color: AppColors.struckColor,
                  width: 1.5,
                )
              : BorderSide.none),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      title: //CustomTitle ??
          Text(
        title ?? "",
        style: Theme.of(context).textTheme.labelMedium,
      ),
      actions: action ??
          [
            isLogout
                ? IconButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut().then((value) async {
                        await FirebaseAuth.instance.signOut();
                        await CacheHelper.clearData(KeyStorage.accountType);
                        await CacheHelper.clearSecure(key: KeyStorage.user);
                        await CacheHelper.clearData(KeyStorage.badgerCounter);
                        await CacheHelper.clearData(
                            KeyStorage.badgerCounterTechnical);

                        Get.offAllNamed(PagesString.login);
                      }).catchError((e) {
                        log(e);
                        Utils.showError(S.of(context).canNotSignOut(e));
                      });
                    },
                    icon: SvgPicture.asset(
                      Assets.assetsImagesSvgLogoutIc,
                      color: AppColors.black,
                    ),
                  )
                : IconButton(
                    onPressed: onTap ?? () => Get.off(() => ContactUsPage()),
                    icon: SvgPicture.asset(
                        Assets.assetsImagesSvgMessageQuestionIc),
                  ),
          ],
      leading: backButton
          ? IconButton(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    Assets.assetsImagesSvgArrowRightReIc,
                  ),
                  SvgPicture.asset(
                    Assets.assetsImagesSvgArrowRightBlIc,
                  ),
                ],
              ),
              onPressed: onPressBack ?? () => Get.back(),
            )
          : SizedBox(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(heightAppBar ?? 56);
}
