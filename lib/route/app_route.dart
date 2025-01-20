import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/bindings/auth_bindings.dart';
import 'package:tugas_mobile_firebase/pages/home_page.dart';
import 'package:tugas_mobile_firebase/pages/note_page.dart';
import 'package:tugas_mobile_firebase/pages/profile_page.dart';
import 'package:tugas_mobile_firebase/pages/login_page.dart';
import 'package:tugas_mobile_firebase/pages/reminder_form.dart';
import 'package:tugas_mobile_firebase/pages/splash_page.dart';
import 'package:tugas_mobile_firebase/wiged/dashboard.dart';

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
      name: AppRoot.dashboard,
      page: () => const Dashboard(),
      binding: DashboardBindings(),
    ),
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
      name: AppRoot.reminder,
      page: () => ReminderForm(),
      binding: ReminderBinding(),
    ),
    GetPage(
      name: AppRoot.note,
      page: () => const NotePage(),
      binding: DashboardBindings(),
    ),
    GetPage(
        name: AppRoot.home,
        page: () => HomePage(),
        binding: AuthBindings()
    )
  ];
}
