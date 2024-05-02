part of './pages.dart';

abstract class PagesString {
  PagesString._();
  static const initial = _Paths.splash;
  static const login = _Paths.login;
  static const forgetPassword = _Paths.forgetPassword;
  static const otp = _Paths.otp;
  static const restPassword = _Paths.restPassword;
  static const changePassword = _Paths.changePassword;
  static const home = _Paths.home;
  static String contentUs = _Paths.contentUs;
  static String congratulation = _Paths.congratulation;
  static String newRequest = _Paths.newRequest;

  static String activationPage = _Paths.activation;
}

abstract class _Paths {
  static const splash = '/';
  static const login = '/login';
  static const forgetPassword = '/forgetPassword';
  static const otp = '/otp';
  static const restPassword = '/restPassword';
  static const changePassword = '/changePassword';
  static const home = '/home';
  static const contentUs = '/contentUs';
  static const congratulation = '/congratulation';
  static const newRequest = '/newRequest';
  static const activation = '/activation';
}
