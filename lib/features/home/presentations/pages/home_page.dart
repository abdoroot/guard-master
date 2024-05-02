import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:guard_master/common/helper/cach.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:guard_master/common/widgets/custom_appbar.dart';
import 'package:guard_master/common/widgets/custom_text.dart';
import 'package:guard_master/features/home/presentations/controllers/home_controller.dart';
import 'package:guard_master/features/home/presentations/pages/admin/activation.dart';
import 'package:guard_master/features/home/presentations/pages/admin/request.dart';
import 'package:guard_master/features/home/presentations/pages/admin/all_admins.dart';
import 'package:guard_master/features/home/presentations/pages/details.dart';
import 'package:guard_master/features/home/presentations/pages/profile.dart';
import 'package:guard_master/features/home/presentations/pages/user/activation.dart';
import 'package:guard_master/features/home/presentations/pages/user/otp.dart';
import 'package:guard_master/features/home/presentations/pages/user/request.dart';
import 'package:guard_master/generated/assets/assets.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController controller) {
          List<Map<String, dynamic>> data = [
            {
              'index': 0,
              'page': controller.accountType == KeyStorage.typeAdmin
                  ? Request()
                  : RequestUser(),
              'icon': badges.Badge(
                badgeStyle: badges.BadgeStyle(borderSide: BorderSide()),
                child: SvgPicture.asset(Assets.assetsImagesSvgRequestIc),
                position: badges.BadgePosition.custom(top: -1.5.h, end: -1.w),
                showBadge: controller.badgerCounter(),
                badgeContent: CustomText(
                    color: AppColors.black,
                    textAlign: TextAlign.center,
                    fontSize: 7.sp,
                    text: controller.counterNotification.toString()),
              ),
              'title': S.of(Get.context!).request,
            },
            {
              'index': 1,
              'page': controller.accountType == KeyStorage.typeAdmin
                  ? Activation()
                  : ActivationTechnical(),
              'icon': SvgPicture.asset(Assets.assetsImagesSvgActivationIc),
              'title': S.of(Get.context!).activation,
            },
            {
              'index': 2,
              'page': controller.accountType == KeyStorage.typeAdmin
                  ? AllAdmins()
                  : OTP(),
              'icon': controller.accountType == KeyStorage.typeAdmin
                  ? SvgPicture.asset(Assets.assetsImagesSvgUserIc)
                  : SvgPicture.asset(
                      Assets.assetsImagesSvgAddCircleIc,
                    ),
              'title': controller.accountType == KeyStorage.typeAdmin
                  ? S.of(Get.context!).admins
                  : S.of(Get.context!).otp,
            },
            {
              'index': 3,
              'page': Profile(),
              'icon': SvgPicture.asset(Assets.assetsImagesSvgProfileIc),
              'title': S.of(Get.context!).profile,
            },
            {
              'index': 4,
              'page': Details(),
              'icon': Icon(
                Icons.home_outlined,
                color: AppColors.white,
              ),
              'title': S.of(Get.context!).home,
            }
          ];

          return WillPopScope(
            onWillPop: controller.onWillPop,
            child: Scaffold(
              appBar: CustomAppBar(
                isLogout: true,
                CustomTitle: SvgPicture.asset(
                  Assets.assetsImagesSvgLogo,
                  height: 90,
                ),
                backButton: false,
                centerTitle: true,
                side: true,
              ),
              body: PageView.builder(
                  onPageChanged: (value) => controller.onPageChange(value),
                  itemCount: data.length,
                  controller: controller.controller,
                  itemBuilder: (context, index) => data[index]['page']),
              bottomNavigationBar: Material(
                elevation: 10,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.black,
                child: Container(
                    height: 9.h,
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: data
                          .map(
                            (e) => Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: GestureDetector(
                                onTap: () => controller.onTap(e['index']),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 250),
                                      width: 20,
                                      decoration: BoxDecoration(
                                        border: e['index'] ==
                                                controller.selectedIndex
                                            ? Border(
                                                top: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white))
                                            : null,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    e['icon'],
                                    CustomText(
                                      text: e['title'],
                                      color: AppColors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    )),
              ),
            ),
          );
        });
  }
}
