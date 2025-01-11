import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/controllers/auth_controller.dart';

import '../route/app_route.dart';

class LoginPage extends StatelessWidget {
  final FirebaseController firebaseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await firebaseController.signInWithGoogle();
            if (firebaseController.isSignedIn.value) {
              Get.toNamed(AppRoot.home);
            }
          },
          child: Text('Sign In with Google'),
        ),
      ),
    );
  }
}
