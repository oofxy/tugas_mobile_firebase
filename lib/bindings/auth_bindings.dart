import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/controllers/auth_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(FirebaseController()); // Make it globally accessible
  }
}
