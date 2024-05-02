import 'package:get/get.dart';

import 'package:guard_master/features/auth/presentations/bindings/change_password_binding.dart';
import 'package:guard_master/features/auth/presentations/bindings/otp_binding.dart';
import 'package:guard_master/features/auth/presentations/bindings/forget_password_binding.dart';
import 'package:guard_master/features/auth/presentations/bindings/login_binding.dart';
import 'package:guard_master/features/auth/presentations/bindings/rest_password_binding.dart';
import 'package:guard_master/features/auth/presentations/pages/change_password_page.dart';
import 'package:guard_master/features/auth/presentations/pages/otp_page.dart';
import 'package:guard_master/features/auth/presentations/pages/forget_password_page.dart';
import 'package:guard_master/features/auth/presentations/pages/login_page.dart';
import 'package:guard_master/features/auth/presentations/pages/rest_password_page.dart';
import 'package:guard_master/features/home/presentations/bindings/home_binding.dart';
import 'package:guard_master/features/home/presentations/pages/home_page.dart';
import 'package:guard_master/features/splash/presentation/bindings/splash_binding.dart';
import 'package:guard_master/features/splash/presentation/pages/splash_view.dart';

part 'pages_string.dart';

abstract class AppPages {
  static final pages = [
    /// initial
    GetPage(
      name: PagesString.initial,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),

    /// login
    GetPage(
      name: PagesString.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),

    /// ForgetPassword
    GetPage(
      name: PagesString.forgetPassword,
      page: () => ForgetPasswordPage(),
      binding: ForgetPasswordBinding(),
    ),

    /// otp
    GetPage(
      name: PagesString.otp,
      page: () => OTPPage(),
      binding: OTPBinding(),
    ),

    /// restPassword
    GetPage(
      name: PagesString.restPassword,
      page: () => RestPasswordPage(),
      binding: RestPasswordBinding(),
    ),

    /// changePassword
    GetPage(
      name: PagesString.changePassword,
      page: () => ChangePasswordPage(),
      binding: ChangePasswordBinding(),
    ),

    /// home
    GetPage(
      name: PagesString.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
