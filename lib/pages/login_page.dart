import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/controllers/auth_controller.dart';
import 'package:tugas_mobile_firebase/style/colors.dart';


class LoginPage extends StatelessWidget {
  final FirebaseController firebaseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 230, right: 40),
            child: Positioned.fill(
                child: Transform.scale(
                    scale: 2.4,
                    child: Image.asset('lib/assets/images/background.png'))),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "quiqiNote.g",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Inconsolata',
                        fontWeight: FontWeight.w900
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "A note where we strive\nfor better future.",
                    style: TextStyle(
                      fontSize: 19,
                      fontFamily: 'Inconsolata',
                      fontWeight: FontWeight.w300,
                      color: Colors.black45,
                      height: 1, // Adjust this value to control the line height
                    ),
                  ),

                  SizedBox(height: 40), // Add spacing between text and button
                  OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonPrimary,
                      side: BorderSide(color: AppColors.borderButtonPrimary),
                      padding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        // Set square corners
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    onPressed: () async {
                      await firebaseController.signInWithGoogle();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                        children: [
                      Image.asset(
                        'lib/assets/images/google_logo.png',
                        width: 37.0,
                        height: 37.0,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        'Sign In with Google',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Montserrat'),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
