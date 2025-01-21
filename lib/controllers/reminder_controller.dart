import 'notification_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


class ReminderController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final NotificationController _notifController = Get.find();

  Future<void> addReminder(DateTime dateTime, String description, String noteId) async {
    try {
      await _firestore.collection('reminders').add({
        "timestamp": Timestamp.fromDate(dateTime),
        "description": description,
        "userId": _notifController.token,
        "isSent": false,
        "noteId": noteId
      });
      Get.snackbar("Success", "Reminder added succesfully");
    } catch (e) {
      Get.snackbar("Error", "Failed to add reminder: $e");
    }
  }
}