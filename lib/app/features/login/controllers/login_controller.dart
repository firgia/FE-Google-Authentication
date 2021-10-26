import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_authentication/app/config/routes/app_pages.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  final isLoading = false.obs;

  Future login() async {
    final user = await _googleSignIn.signIn();
    isLoading.value = true;

    if (user != null) {
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
    }

    if (_auth.currentUser != null) {
      Get.offNamed(Routes.home);
    } else {
      Get.snackbar("Error", "Sign In Failed");
    }

    isLoading.value = false;
  }
}
