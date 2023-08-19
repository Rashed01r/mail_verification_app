import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerfiyEmailController extends GetxController {
  bool? isEmailVerified = false;
  bool canResentEmail = false;


  Future sendEmailVerifiction() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      canResentEmail = false;
      update();

      await Future.delayed(Duration(seconds: 5));

      canResentEmail = true;
      update();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future checkEmailVerified({required Timer timer}) async {
    await FirebaseAuth.instance.currentUser?.reload();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (isEmailVerified!) timer.cancel();
    update();
  }
}
