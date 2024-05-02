import 'package:flutter/material.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/helper/cach.dart';
import 'package:guard_master/common/helper/date_time.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:guard_master/common/utils/extension.dart';
import 'package:guard_master/common/widgets/custom_text.dart';
import 'package:guard_master/common/widgets/dotted_container.dart';
import 'package:guard_master/features/home/data/models/user_model.dart';
import 'package:guard_master/features/home/presentations/controllers/home_controller.dart';
import 'package:guard_master/features/home/presentations/pages/admin/add_edit_admin.dart';
import 'package:guard_master/features/home/presentations/controllers/admin/Admins_controller.dart';
import 'package:guard_master/generated/assets/assets.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class AllAdmins extends StatelessWidget {
  const AllAdmins({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminsController>(
        init: AdminsController(),
        builder: (AdminsController controller) {
          return Scaffold(
            body: GestureDetector(
              onDoubleTap: () => controller.getAllAdmins(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: RefreshIndicator(
                  onRefresh: () => controller.getAllAdmins(),
                  child: Column(
                    children: [
                      /// title add user
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                onPressed: () {
                                  Get.to(() => AddEditAdminPage());
                                },
                                icon: SvgPicture.asset(
                                    Assets.assetsImagesSvgUserAddIc)),
                          )),
                          Expanded(
                            flex: 2,
                            child: CustomText(
                              textAlign: TextAlign.start,
                              text: S.of(context).allAdmins,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                        ],
                      ),
                      2.w.sh,

                      /// list of users
                      Expanded(
                        child: controller.loading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.red,
                                ),
                              )
                            : controller.admins.isEmpty
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.format_list_bulleted_add),
                                        2.h.sh,
                                        CustomText(
                                          text:
                                              S.of(context).thereAreNoUsersYet,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                      ],
                                    ),
                                  )
                                : AnimationLimiter(
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          2.h.sh,
                                      itemCount: controller.admins.length,
                                      itemBuilder: (context, index) {
                                        UserModel user =
                                            controller.admins[index];
                                        return AnimationConfiguration
                                            .staggeredList(
                                          position: index + 5,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          child: SlideAnimation(
                                            verticalOffset: 50,
                                            child: FadeInAnimation(
                                              child: GestureDetector(
                                                onTap: HomeController
                                                            .to.accountType ==
                                                        KeyStorage.typeAdmin
                                                    ? () {
                                                        Get.to(
                                                            () =>
                                                                AddEditAdminPage(
                                                                    isEdit:
                                                                        true),
                                                            arguments:
                                                                user.toMap());
                                                      }
                                                    : null,
                                                child: DottedBorderWidget(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 8),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      /// company name
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          CustomText(
                                                              color: AppColors
                                                                  .dark0,
                                                              fontSize: 10.sp,
                                                              text:
                                                                  user.companyName ??
                                                                      ""),
                                                          CustomText(
                                                              color: AppColors
                                                                  .dark3,
                                                              fontSize: 8.sp,
                                                              text: parseStringDateTimeToListString(
                                                                          user.createdAt ??
                                                                              "")
                                                                      .$1 ??
                                                                  "")
                                                        ],
                                                      ),

                                                      /// user name
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          CustomText(
                                                              color: AppColors
                                                                  .dark0,
                                                              fontSize: 10.sp,
                                                              text: user.name ??
                                                                  ""),
                                                          CustomText(
                                                              color: AppColors
                                                                  .dark3,
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              text: parseStringDateTimeToListString(
                                                                          user.createdAt ??
                                                                              "")
                                                                      .$2 ??
                                                                  "")
                                                        ],
                                                      ),

                                                      /// account Type
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          CustomText(
                                                              color: AppColors
                                                                  .dark0,
                                                              fontSize: 10.sp,
                                                              text:
                                                                  user.accountType ??
                                                                      ""),

                                                          /// active or not
                                                          CustomText(
                                                            color: user.pcStatus ==
                                                                    S
                                                                        .of(context)
                                                                        .active
                                                                ? AppColors.gray
                                                                : AppColors.red,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            text: user.pcStatus ==
                                                                    S
                                                                        .of(
                                                                            context)
                                                                        .active
                                                                ? S
                                                                    .of(context)
                                                                    .actives
                                                                : S
                                                                    .of(context)
                                                                    .notActives,
                                                          )
                                                        ],
                                                      ),

                                                      ///
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          CustomText(
                                                            textAlign:
                                                                TextAlign.start,
                                                            color:
                                                                AppColors.red,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            text:
                                                                user.adminAccepted ??
                                                                    "",
                                                          ),

                                                          /// active icon
                                                          /*  index == 1
                                                                                      ? SvgPicture.asset(
                                                Assets.assetsImagesSvgLockCircleIc,
                                                width: 30,
                                                height: 30,
                                                                                        )
                                                                                      : SizedBox(), */
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
