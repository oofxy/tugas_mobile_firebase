import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/controllers/auth_controller.dart';
import 'package:tugas_mobile_firebase/controllers/notification_controller.dart';
import 'package:tugas_mobile_firebase/controllers/reminder_controller.dart';
import 'package:tugas_mobile_firebase/services/firestore_service.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(FirebaseController()); // Make it globally accessible
  }
}

class NoteBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(FirebaseController());
    Get.put(FirestoreService());
    Get.put(NotificationController());
    Get.put(ReminderController());
  }
}