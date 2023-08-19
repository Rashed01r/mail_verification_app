import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:otp_phone/component/customButton2.dart';
import 'package:otp_phone/component/textFieldInput.dart';
import 'package:otp_phone/component/textFieldInputPass.dart';
import 'package:otp_phone/controller/signUpController.dart';
import 'package:otp_phone/extension/mediaQueryHelper.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpController controller = Get.put(SignUpController());
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _pass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                  ),
                ),
                Spacer(),
              ],
            ),
            Container(
              width: context.widgetE / 2,
              height: context.heightE / 3,
              child: SvgPicture.asset("images/undraw_sign_up_n6im.svg"),
            ),
            Text(
              "Sign Up",
              style: TextStyle(
                fontSize: context.textScaleFactorE + 20,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: context.heightE / 20,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFieldInput(
                    controller: _email,
                    hintText: "Enter your email",
                    textInputType: TextInputType.text,
                    icon: Icon(Icons.email),
                  ),
                ),
                SizedBox(
                  height: context.heightE / 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFieldInputPass(
                    controller: _pass,
                    hintText: "Enter your password",
                    textInputType: TextInputType.text,
                    icon: Icon(Icons.password_rounded),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: context.heightE / 20,
            ),
            CustomButtonTwo(
              onTap: () {
                controller.signUpUser(email: _email.text, pass: _pass.text);
              },
              title: "Sign up",
            ),
          ],
        ),
      ),
    );
  }
}
