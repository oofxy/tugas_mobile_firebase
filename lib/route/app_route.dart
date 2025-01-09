import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/bindings/auth_bindings.dart';
import 'package:tugas_mobile_firebase/pages/home_page.dart';
import 'package:tugas_mobile_firebase/pages/login_page.dart';
import 'package:tugas_mobile_firebase/pages/splash_page.dart';

class AppRoot {
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';
}

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoot.splash,
      page: () => SplashPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoot.login,
      page: () => LoginPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoot.home,
      page: () => HomePage(),
      binding: AuthBindings(),
    ),
  ];
}