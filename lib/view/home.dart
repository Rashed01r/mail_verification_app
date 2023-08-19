import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:otp_phone/extension/mediaQueryHelper.dart';
import 'package:otp_phone/view/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: context.widgetE / 2,
                  height: context.heightE / 3,
                  child: SvgPicture.asset(
                      "images/undraw_authentication_re_svpt.svg"),
                ),
              ),
              SizedBox(height: context.heightE / 25),
              Text(
                "Authentication completed successfully",
                style: TextStyle(
                  fontSize: context.textScaleFactorE + 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: context.heightE / 20,
              ),
              Expanded(
                flex: 0,
                child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Get.snackbar("System", "Signed out successfully");
                      Get.off(() => LoginPage());
                    },
                    child: Text("Sign Out")),
              )
            ],
          ),
        ));
  }
}
