import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/controllers/notification_controller.dart';
import 'package:tugas_mobile_firebase/controllers/reminder_controller.dart';

class ReminderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationController());
    Get.put(ReminderController());
  }

}