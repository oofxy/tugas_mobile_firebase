import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/bindings/bindings.dart';
import 'package:tugas_mobile_firebase/pages/home_page.dart';
import 'package:tugas_mobile_firebase/pages/note_page.dart';
import 'package:tugas_mobile_firebase/pages/profile_page.dart';
import 'package:tugas_mobile_firebase/pages/login_page.dart';
import 'package:tugas_mobile_firebase/pages/splash_page.dart';

class AppRoot {
  static const dashboard = '/dashboard';
  static const splash = '/splash';
  static const login = '/login';
  static const profile = '/profile';
  static const reminder = '/reminder';
  static const note = '/note';
  static const home = '/home';
}

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoot.splash,
      page: () => const SplashPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoot.login,
      page: () => LoginPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoot.profile,
      page: () => ProfilePage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoot.note,
      page: () => NotePage(),
      binding: NoteBindings(),
    ),
    GetPage(
        name: AppRoot.home,
        page: () => HomePage(),
        binding: NoteBindings()
    )
  ];
}
