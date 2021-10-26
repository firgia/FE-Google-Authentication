import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_authentication/app/config/routes/app_pages.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/home_user.dart';

class HomeController extends GetxController {
  final _googleSignIn = GoogleSignIn();

  final _auth = FirebaseAuth.instance;
  late Rx<HomeUser?> user = Rx(null);
  var isLoading = true.obs;

  @override
  void onInit() async {
    if (_auth.currentUser != null) {
      user.value = HomeUser(
        imageUrl: _auth.currentUser!.photoURL!,
        name: _auth.currentUser!.displayName!,
        email: _auth.currentUser!.email!,
      );

      isLoading.value = false;
    }
    super.onInit();
  }

  void logout() async {
    await _googleSignIn.disconnect();
    await _auth.signOut().then((value) => Get.offNamed(Routes.login));
  }
}
