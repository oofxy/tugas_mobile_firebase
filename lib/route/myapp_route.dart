import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/bindings/reminder_binding.dart';
import 'package:tugas_mobile_firebase/pages/reminder_form.dart';

class MyappRoute {
  static const reminderForm = '/reminderForm';
}

class AppPages {
  static final pages = [
    GetPage(name: MyappRoute.reminderForm, page: () => ReminderForm(), binding: ReminderBinding())
  ];
}