import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:otp_phone/view/home.dart';

class LoginController extends GetxController {
  bool isLoading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future loginUser({required String email, required String pass}) async {
    isLoading = true;
    update();
    try {
      if (email.isNotEmpty || pass.isNotEmpty) {
        await _auth
            .signInWithEmailAndPassword(
          email: email.trim(),
          password: pass.trim(),
        )
            .then((value) {
          Get.snackbar("Done", "Welcome");
          Get.off(() => HomePage());
        });
      } else {
        Get.snackbar("Error", "please enter all fields");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    isLoading = false;
    update();
  }
}
