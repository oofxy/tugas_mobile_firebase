import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../route/app_route.dart';

class FirebaseController extends GetxController {
  var isSignedIn = false.obs;
  var user = Rxn<User>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Check if user is signed in
  @override
  void onInit() {
    super.onInit();
    checkUserSignInStatus();
  }

  void checkUserSignInStatus() {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      user.value = currentUser;
      isSignedIn.value = true;
    } else {
      isSignedIn.value = false;
    }
  }

  // Sign in with Google
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User canceled the sign-in
        return;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      user.value = userCredential.user;
      isSignedIn.value = true;

      if (isSignedIn.value) {
        Get.toNamed(AppRoot.home);
      }
    } catch (e) {
      print("Error signing in with Google: $e");
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    isSignedIn.value = false;
    user.value = null;
  }
}
