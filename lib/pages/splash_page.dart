import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/controllers/auth_controller.dart';
import 'package:tugas_mobile_firebase/route/app_route.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseController firebaseController = Get.find();

    // Use GetX observer to react to sign-in state change
    return Obx(() {
      if (firebaseController.isSignedIn.value) {
        // Navigate to the home page if the user is signed in
        Future.delayed(Duration(seconds: 2), () {
          Get.offAllNamed(AppRoot.home);
        });
      } else {
        // Navigate to the login page if not signed in
        Future.delayed(Duration(seconds: 2), () {
          Get.offAllNamed(AppRoot.login);
        });
      }
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    });
  }
}
