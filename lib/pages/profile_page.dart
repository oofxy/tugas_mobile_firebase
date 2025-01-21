import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/controllers/auth_controller.dart';
import 'package:tugas_mobile_firebase/style/colors.dart';

import '../route/app_route.dart';

class ProfilePage extends StatelessWidget {
  final FirebaseController firebaseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 27),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: Transform.rotate(
              angle: 90 * 3.14 / 180,
              child: Icon(Icons.u_turn_left, size: 31),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 23),
            child: IconButton(
              onPressed: () async {
                await firebaseController.signOut();
                Get.offAllNamed(AppRoot.login);
              },
              icon: Icon(
                Icons.logout,
                color: Colors.red,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: EdgeInsets.only(left: 31, right: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 58,
                backgroundImage: NetworkImage(
                  firebaseController.user.value?.photoURL ??
                      'https://www.strasys.uk/wp-content/uploads/2022/02/Depositphotos_484354208_S.jpg',
                ),
              ),
              SizedBox(height: 15),
              Text(
                '${firebaseController.user.value?.displayName ?? 'User'}',
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                '${firebaseController.user.value?.email ?? 'User@gmail.com'}',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                    color: AppColors.textSecondary
                ),
              ),
              SizedBox(
                height: 15,
              ),
              OutlinedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonSecondary,
                  side: BorderSide(color: AppColors.borderButtonSecondary),
                  padding: EdgeInsets.symmetric(vertical: 19, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                onPressed: () async {
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('lib/assets/images/icons/mdi_delete-empty-outline.svg'),
                    SizedBox(width: 6),
                    Text(
                      'Clear all existing notes',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 17,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              OutlinedButton(
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: AppColors.buttonSecondary,
                  side: BorderSide(color: AppColors.borderButtonSecondary),
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),

                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Changelog Version',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 17,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        Text(
                          'v0.0.1alpha rev.1',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 17,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
