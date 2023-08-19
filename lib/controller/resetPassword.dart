import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:otp_phone/view/login.dart';

class ResetPasswordController extends GetxController {
  bool isLoading = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future resetPassword({required String email}) async {
    isLoading = true;
    update();
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
      Get.snackbar(
          "System", "An email has been sent to reset the password, thank you");
      Get.off(() => LoginPage());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    isLoading = false;
    update();
  }
}
