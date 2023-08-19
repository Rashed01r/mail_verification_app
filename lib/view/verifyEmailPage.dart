import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_phone/controller/verfiyEmailController.dart';
import 'package:otp_phone/extension/mediaQueryHelper.dart';
import 'package:otp_phone/view/home.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  Timer? timer;
  VerfiyEmailController _verfiyEmailController =
      Get.put(VerfiyEmailController());

  @override
  void initState() {
    super.initState();
    
    _verfiyEmailController.isEmailVerified =
        FirebaseAuth.instance.currentUser!.emailVerified;
    if (!_verfiyEmailController.isEmailVerified!) {
      _verfiyEmailController.sendEmailVerifiction();
    }
 
    timer = Timer.periodic(
      Duration(seconds: 5),
      (timer) => _verfiyEmailController.checkEmailVerified(timer: timer),
    );
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GetBuilder<VerfiyEmailController>(
        builder: (_) {
          return _verfiyEmailController.isEmailVerified!
              ? HomePage()
              : Scaffold(
                  backgroundColor: Colors.grey[300],
                  body: SafeArea(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "A verifiction email has been sent to your email",
                          style: TextStyle(
                            fontSize: context.textScaleFactorE + 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.heightE / 19,
                      ),
                      SizedBox(
                        height: context.heightE / 15,
                        width: context.widgetE / 1.5,
                        child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () => _verfiyEmailController
                                    .canResentEmail
                                ? _verfiyEmailController.sendEmailVerifiction
                                : null,
                            label: Text("Resent Email"),
                            icon: Icon(Icons.email)),
                      ),
                      SizedBox(
                        height: context.heightE / 50,
                      ),
                      SizedBox(
                        height: context.heightE / 15,
                        width: context.widgetE / 1.5,
                        child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () => FirebaseAuth.instance.signOut(),
                            label: Text("Cancel"),
                            icon: Icon(Icons.email)),
                      ),
                    ],
                  )),
                );
        },
      );
}
