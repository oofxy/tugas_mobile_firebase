import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/controllers/auth_controller.dart';


class LoginPage extends StatelessWidget {
  final FirebaseController firebaseController = Get.find();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 230, right: 40),
            child: Positioned.fill(
                child: Transform.scale(
                    scale: 2.4,
                    child: Image.asset('lib/assets/images/background.png'))),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "quiqiNoteg",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Inconsolata',
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "A note where we strive    for better future.",
                    style: TextStyle(
                      fontSize: 19,
                      fontFamily: 'Inconsolata',
                      color: Colors.black45,
                      height: 1, // Adjust this value to control the line height
                    ),
                  ),

                  const SizedBox(height: 40), // Add spacing between text and button
                  OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF2F9FB),
                      side: const BorderSide(color: Color(0xFFE6F3F7)),
                      padding:
                          const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                      shape: const RoundedRectangleBorder(
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
                      const SizedBox(width: 10,),
                      const Text(
                        'Sign In with Google',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Montserrat'),
                      )
                    ]),
                  ),
                  const SizedBox(
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
