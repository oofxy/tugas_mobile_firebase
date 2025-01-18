import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/controllers/auth_controller.dart';

import '../route/app_route.dart';

class ProfilePage extends StatelessWidget {
  final FirebaseController firebaseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${firebaseController.user.value?.displayName ?? 'User'}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await firebaseController.signOut();
                Get.offAllNamed(AppRoot.login);
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
