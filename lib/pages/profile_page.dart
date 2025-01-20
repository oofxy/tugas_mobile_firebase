import 'package:flutter/material.dart';
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
        leading: Padding(
          padding: EdgeInsets.only(left: 27),
          child: IconButton(
            onPressed: () {
              // Add your onPressed logic here
            },
            icon: Transform.rotate(
              angle: 90 * 3.14 / 180,
              child: Icon(Icons.u_turn_left, size: 31),
            ),
          ),
        ),
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
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${firebaseController.user.value?.email ?? 'User@gmail.com'}',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                    color: Color(0xff808080)),
              ),
              SizedBox(
                height: 15,
              ),
              OutlinedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(AppColors.secondaryButtonColour.value),
                  side: BorderSide(color: Color(AppColors.secondaryBorderButtonColour.value)),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                onPressed: () async {
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.restore_from_trash_outlined, color: Colors.redAccent, size: 35,),
                    SizedBox(width: 10),
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
                  backgroundColor: Color(AppColors.secondaryButtonColour.value),
                  side: BorderSide(color: Color(AppColors.secondaryBorderButtonColour.value)),
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                onPressed: () async {
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Changelog Version',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 17,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        Text(
                          'v0.0.1alpha rev.1',
                          style: TextStyle(
                            color: Colors.black,
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
