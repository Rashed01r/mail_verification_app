import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:otp_phone/component/customButton3.dart';
import 'package:otp_phone/component/textFieldInput.dart';
import 'package:otp_phone/controller/resetPassword.dart';
import 'package:otp_phone/extension/mediaQueryHelper.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController _emailCntroller = TextEditingController();
  ResetPasswordController _passwordController =
      Get.put(ResetPasswordController());

  @override
  void dispose() {
    super.dispose();
    _emailCntroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: context.heightE / 5,
            ),
            Text("Enter Your Email and will send a password reset link"),
            SizedBox(
              height: context.heightE / 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextFieldInput(
                controller: _emailCntroller,
                hintText: "Email",
                textInputType: TextInputType.text,
                icon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: context.heightE / 25,
            ),
            CustomButtonThree(
              title: "Reset Password",
              onTap: () {
                _passwordController.resetPassword(email: _emailCntroller.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
