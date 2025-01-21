import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/controllers/auth_controller.dart';
import 'package:tugas_mobile_firebase/route/app_route.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseController firebaseController = Get.find();

    // Use GetX observer to react to sign-in state change
    return Obx(() {
      if (firebaseController.isSignedIn.value) {
        // Ensure navigation happens only once
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.offNamed(AppRoot.home);
        });
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.offNamed(AppRoot.login);
        });
      }
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    });
  }
}
