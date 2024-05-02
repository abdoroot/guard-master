import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/app_constant/app_constants.dart';
import 'package:guard_master/common/helper/cach.dart';
import 'package:guard_master/common/helper/date_time.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:guard_master/common/utils/extension.dart';
import 'package:guard_master/common/utils/utils.dart';
import 'package:guard_master/common/widgets/custom_elevated_button.dart';
import 'package:guard_master/common/widgets/custom_text.dart';
import 'package:guard_master/common/widgets/dotted_container.dart';
import 'package:guard_master/features/home/data/models/request_model.dart';
import 'package:guard_master/features/home/presentations/controllers/home_controller.dart';
import 'package:guard_master/features/home/presentations/controllers/user/request_controller.dart';
import 'package:guard_master/features/home/presentations/pages/admin/edit_request.dart';
import 'package:guard_master/generated/assets/assets.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class AllNewRequest extends StatelessWidget {
  final List<RequestModel> request;

  const AllNewRequest({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    return request.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add_to_queue_rounded,
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
          )
        : Directionality(
            textDirection: TextDirection.ltr,
            child: AnimationLimiter(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) => 2.h.sh,
                itemCount: request.length,
                itemBuilder: (context, index) {
                  final req = request[index];
                  return AnimationConfiguration.staggeredList(
                    position: index + 5,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      verticalOffset: 50,
                      child: FadeInAnimation(
                        child: GestureDetector(
                          onTap: HomeController.to.accountType ==
                                  KeyStorage.typeAdmin
                              ? () {
                                  Get.to(() => EditRequest(),
                                      arguments: req.toMap());
                                }
                              : null,
                          child: Column(
                            children: [
                              DottedBorderWidget(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    /// company name
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                            color: AppColors.dark1,
                                            fontSize: 10.sp,
                                            text: req.companyName ?? ""),
                                        CustomText(
                                            color: AppColors.dark3,
                                            fontSize: 8.sp,
                                            text:
                                                parseStringDateTimeToListString(
                                                            req.createdAt ?? "")
                                                        .$1 ??
                                                    "")
                                      ],
                                    ),

                                    /// user name
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                            color: AppColors.dark1,
                                            fontSize: 10.sp,
                                            text: req.name ?? ""),
                                        CustomText(
                                          color: AppColors.dark3,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w700,
                                          text: parseStringDateTimeToListString(
                                                      req.createdAt ?? "")
                                                  .$2 ??
                                              "",
                                        ),
                                      ],
                                    ),

                                    ///
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          color: AppColors.dark2,
                                          fontSize: 8.sp,
                                          text: req.work ?? "",
                                        ),
                                      ],
                                    ),
                                    1.h.sh,
                                    if (req.adminAccepted != null)
                                      CustomText(
                                        textAlign: TextAlign.start,
                                        color: AppColors.red,
                                        fontWeight: FontWeight.w900,
                                        text: req.adminAccepted ?? "",
                                      ),
                                  ],
                                ),
                              ),

                              /// end content
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: AppColors.dark4,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        CustomText(
                                            text: req.requestStatus ?? ""),
                                        2.w.sw,
                                        SvgPicture.asset(
                                            Assets.assetsImagesSvgCheckedIc),
                                      ],
                                    ),

                                    /// youtube
                                    HomeController.to.accountType ==
                                            AppConstants.accountType.first
                                        ? req.workFilm != null
                                            ? GestureDetector(
                                                onTap: () =>
                                                    RequestUserController.to
                                                        .sherVideo(
                                                            req.workFilm ?? ""),
                                                child: SvgPicture.asset(Assets
                                                    .assetsImagesSvgYoutubeIc))
                                            : SizedBox()
                                        : SizedBox(),

                                    /// key
                                    req.otp != null
                                        ? GestureDetector(
                                            onTap: () =>
                                                Utils.customBottomSheet(
                                                  titleTextColor:
                                                      AppColors.white,
                                                  title: req.otp,
                                                  children: [
                                                    3.h.sh,
                                                    CustomElevatedButton(
                                                      onPressed: () =>
                                                          Get.back(),
                                                      color: AppColors.black,
                                                      child: CustomText(
                                                        text:
                                                            S.of(context).close,
                                                        color: AppColors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                            child: SvgPicture.asset(
                                                Assets.assetsImagesSvgKeyIc))
                                        : SizedBox(),

                                    ///request number
                                    Row(
                                      children: <Widget>[
                                        CustomText(
                                            color: AppColors.white,
                                            text: S.of(context).numRe),
                                        1.w.sw,
                                        CustomText(
                                          text: req.id.toString(),
                                          color: AppColors.red,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
  }
}
