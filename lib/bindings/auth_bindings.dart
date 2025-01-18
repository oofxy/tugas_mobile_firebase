import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/controllers/auth_controller.dart';
import 'package:tugas_mobile_firebase/controllers/dashboard_controller.dart';
import 'package:tugas_mobile_firebase/controllers/notification_controller.dart';
import 'package:tugas_mobile_firebase/controllers/reminder_controller.dart';

class ReminderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationController());
    Get.put(ReminderController());
  }
}

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(FirebaseController()); // Make it globally accessible
  }
}

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationController());
    Get.put(ReminderController());
    Get.put(FirebaseController()); // Make it globally accessible
    Get.put(DashboardController()); // Make it globally accessible
  }
}
