import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/app_constant/app_constants.dart';
import 'package:guard_master/common/helper/cach.dart';
import 'package:guard_master/common/helper/date_time.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:guard_master/common/utils/extension.dart';
import 'package:guard_master/common/widgets/custom_text.dart';
import 'package:guard_master/common/widgets/dotted_container.dart';
import 'package:guard_master/features/home/data/models/user_model.dart';
import 'package:guard_master/features/home/presentations/controllers/home_controller.dart';
import 'package:guard_master/features/other_pages/active_code_page.dart';
import 'package:guard_master/generated/assets/assets.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class ActivationTechnical extends StatelessWidget {
  ActivationTechnical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: HomeController.to.getAllTechnicians(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.red,
              ),
            );
          }

          List<UserModel> _currentTechnical = <UserModel>[];

          snapshot.data!.docs.forEach((e) async {
            final UserModel data = UserModel.fromMap(e.data());

            if (HomeController.to.accountType == KeyStorage.typeTechnical &&
                data.uid == FirebaseAuth.instance.currentUser?.uid) {
              _currentTechnical.add(data);
              CacheHelper.saveSecure(
                  key: KeyStorage.user, value: data.toJson());
            }
          });
          _currentTechnical.sort((UserModel a, UserModel b) =>
              parseStringToDateTime(b.createdAt!)
                  .compareTo(parseStringToDateTime(a.createdAt!)));

          if (_currentTechnical.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.content_paste_search_sharp,
                    size: 10.h,
                    color: AppColors.dark4,
                  ),
                  2.h.sh,
                  CustomText(
                    text: S.of(context).addNewRequest,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.dark4,
                        ),
                  ),
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              children: [
                /// title
                CustomText(
                  textAlign: TextAlign.center,
                  text: S.of(context).allActivation,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                2.w.sh,
                Expanded(
                    child: AnimationLimiter(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => 2.h.sh,
                    itemCount: _currentTechnical.length,
                    itemBuilder: (context, index) {
                      final technical = _currentTechnical[index];

                      return AnimationConfiguration.staggeredList(
                        position: index + 5,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          verticalOffset: 50,
                          child: FadeInAnimation(
                            child: DottedBorderWidget(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  /// company name
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                          color: AppColors.dark0,
                                          fontSize: 10.sp,
                                          text: technical.companyName ?? ""),
                                      CustomText(
                                        color: AppColors.dark3,
                                        fontSize: 8.sp,
                                        text: parseStringDateTimeToListString(
                                                    technical.createdAt ?? "")
                                                .$1 ??
                                            "",
                                      )
                                    ],
                                  ),

                                  /// user name
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                          color: AppColors.dark0,
                                          fontSize: 10.sp,
                                          text: technical.name ?? ""),
                                      CustomText(
                                        color: AppColors.dark3,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w700,
                                        text: parseStringDateTimeToListString(
                                                    technical.createdAt ?? "")
                                                .$2 ??
                                            "",
                                      )
                                    ],
                                  ),

                                  /// PC  Serial No
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                          color: AppColors.dark0,
                                          fontSize: 10.sp,
                                          text: S.of(context).pcSerialNo(
                                              technical.pcSerialNo ?? "")),

                                      /// active or not
                                      CustomText(
                                        color: technical.pcStatus ==
                                                AppConstants
                                                    .statusOfActivation[1]
                                            ? AppColors.red
                                            : AppColors.gray,
                                        fontWeight: FontWeight.w900,
                                        text: technical.pcStatus ?? "",
                                      )
                                    ],
                                  ),

                                  ///
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ///
                                      if (technical.adminAccepted != null)
                                        CustomText(
                                          textAlign: TextAlign.start,
                                          color: AppColors.red,
                                          fontWeight: FontWeight.w900,
                                          text: technical.adminAccepted ?? "",
                                        )
                                      else
                                        SizedBox(),

                                      /// active icon
                                      technical.pcStatus ==
                                                  AppConstants
                                                      .statusOfActivation
                                                      .first &&
                                              technical.activationCode != null
                                          ? GestureDetector(
                                              onTap: () => Get.to(() =>
                                                  ActiveCodePage(
                                                      activationCode: technical
                                                              .activationCode ??
                                                          "")),
                                              child: SvgPicture.asset(
                                                Assets
                                                    .assetsImagesSvgLockCircleIc,
                                                width: 30,
                                                height: 30,
                                              ),
                                            )
                                          : SizedBox(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
              ],
            ),
          );
        });
  }
}
