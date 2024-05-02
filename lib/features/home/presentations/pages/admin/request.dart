import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/helper/date_time.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:guard_master/common/utils/extension.dart';
import 'package:guard_master/common/widgets/custom_elevated_button.dart';
import 'package:guard_master/common/widgets/custom_text.dart';
import 'package:guard_master/features/home/data/models/request_model.dart';
import 'package:guard_master/features/home/presentations/controllers/admin/request_controller.dart';
import 'package:guard_master/features/home/presentations/controllers/home_controller.dart';
import 'package:guard_master/features/home/presentations/pages/widgets/all_new_request.dart';
import 'package:guard_master/features/home/presentations/pages/widgets/all_old_request.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class Request extends StatefulWidget {
  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestAdminController>(
        init: RequestAdminController(),
        builder: (RequestAdminController controller) {
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
                      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          stream: HomeController.to.getAllRequests(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                  snapshot) {
                            if (!snapshot.hasData)
                              return Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.red,
                                ),
                              );
                            List<RequestModel> _requests = <RequestModel>[];
                            List<RequestModel> _newRequests = <RequestModel>[];
                            List<RequestModel> _oldRequests = <RequestModel>[];

                            snapshot.data!.docs.forEach(
                                (QueryDocumentSnapshot<Map<String, dynamic>>
                                    e) async {
                              final RequestModel request =
                                  RequestModel.fromMap(e.data());
                              _requests.add(request);

                              if (request.requestStatus ==
                                  S.of(Get.context!).newRe) {
                                _newRequests.add(request);
                              } else
                                _oldRequests.add(request);

                              _oldRequests.sort((RequestModel a,
                                      RequestModel b) =>
                                  parseStringToDateTime(b.createdAt!).compareTo(
                                      parseStringToDateTime(a.createdAt!)));

                              _requests.sort((RequestModel a, RequestModel b) =>
                                  parseStringToDateTime(b.createdAt!).compareTo(
                                      parseStringToDateTime(a.createdAt!)));

                              _newRequests.sort((RequestModel a,
                                      RequestModel b) =>
                                  parseStringToDateTime(b.createdAt!).compareTo(
                                      parseStringToDateTime(a.createdAt!)));
                            });
                            HomeController.to.saveBadgerAdmin(_requests.length);

                            return PageView(
                              physics: BouncingScrollPhysics(),
                              controller: controller.tabController,
                              onPageChanged: controller.onChangePage,
                              children: [
                                AllNewRequest(
                                  request: _newRequests,
                                ),
                                AllOldRequest(
                                  request: _oldRequests,
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
