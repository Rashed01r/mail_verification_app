import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:otp_phone/view/mainPage.dart';

class SignUpController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;

  Future signUpUser({required String email, required String pass}) async {
    isLoading = true;
    update();
    try {
      if (email.isNotEmpty || pass.isNotEmpty) {
        await auth
            .createUserWithEmailAndPassword(
          email: email.trim(),
          password: pass.trim(),
        )
            .then((value) {
          Get.off(() => MainPage());
          Get.snackbar("System", "Successfully registered");
        });
      } else {
        Get.snackbar("Error", "please enter all fields");
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
    isLoading = false;
    update();
  }
}
