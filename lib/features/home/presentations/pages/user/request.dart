import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/helper/date_time.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:guard_master/common/utils/extension.dart';
import 'package:guard_master/common/widgets/custom_elevated_button.dart';
import 'package:guard_master/common/widgets/custom_text.dart';
import 'package:guard_master/features/home/data/models/request_model.dart';
import 'package:guard_master/features/home/presentations/controllers/home_controller.dart';
import 'package:guard_master/features/home/presentations/controllers/user/request_controller.dart';
import 'package:guard_master/features/home/presentations/pages/widgets/all_new_request.dart';
import 'package:guard_master/features/home/presentations/pages/widgets/all_old_request.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class RequestUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestUserController>(
        init: RequestUserController(),
        builder: (controller) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Center(
                child: Column(
                  children: [
                    /// title
                    CustomText(
                      textAlign: TextAlign.center,
                      text: controller.currentTab == 0
                          ? S.of(context).allNewRequests
                          : S.of(context).allOldRequests,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),

                    /// tabs
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            color: AppColors.red,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(100),
                                bottomRight: Radius.circular(100)),
                            onPressed: () => controller.onTap(0),
                            child: Text(
                              S.of(context).newRequests,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ),
                        Expanded(
                          child: CustomElevatedButton(
                            color: AppColors.lightWhite,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                bottomLeft: Radius.circular(100)),
                            onPressed: () => controller.onTap(1),
                            child: Text(
                              S.of(context).oldRequests,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                    2.h.sh,
                    Expanded(
                      child: StreamBuilder(
                          stream: HomeController.to.getAllRequests(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.red,
                                ),
                              );
                            }
                            List<RequestModel> _requests = <RequestModel>[];
                            List<RequestModel> _currentTechnicalRequests =
                                <RequestModel>[];
                            List<RequestModel> _currentTechnicalNewRequests =
                                <RequestModel>[];
                            List<RequestModel> _currentTechnicalOldRequests =
                                <RequestModel>[];
                            snapshot.data!.docs.forEach(
                                (QueryDocumentSnapshot<Map<String, dynamic>>
                                    e) async {
                              final RequestModel request =
                                  RequestModel.fromMap(e.data());
                              _requests.add(request);
                              if (request.technical_uid ==
                                  FirebaseAuth.instance.currentUser?.uid) {
                                _currentTechnicalRequests.add(request);
                                if (request.requestStatus ==
                                    S.of(Get.context!).newRe) {
                                  _currentTechnicalNewRequests.add(request);
                                } else
                                  _currentTechnicalOldRequests.add(request);
                              }

                              _currentTechnicalNewRequests.sort((RequestModel a,
                                      RequestModel b) =>
                                  parseStringToDateTime(b.createdAt!).compareTo(
                                      parseStringToDateTime(a.createdAt!)));

                              _currentTechnicalOldRequests.sort((RequestModel a,
                                      RequestModel b) =>
                                  parseStringToDateTime(b.createdAt!).compareTo(
                                      parseStringToDateTime(a.createdAt!)));
                            });
                            HomeController.to.saveBadgerAdmin(
                                _currentTechnicalRequests.length);
                            return PageView(
                              physics: BouncingScrollPhysics(),
                              controller: controller.tabController,
                              onPageChanged: controller.onChangePage,
                              children: [
                                AllNewRequest(
                                  request: _currentTechnicalNewRequests,
                                ),
                                AllOldRequest(
                                  request: _currentTechnicalOldRequests,
                                ),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
