import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:otp_phone/component/customButton.dart';
import 'package:otp_phone/component/textFieldInput.dart';
import 'package:otp_phone/component/textFieldInputPass.dart';
import 'package:otp_phone/controller/loginController.dart';
import 'package:otp_phone/extension/mediaQueryHelper.dart';
import 'package:otp_phone/view/forGetPasswordPage.dart';
import 'package:otp_phone/view/signUp.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = Get.put(LoginController());
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
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
            Center(
              child: Container(
                width: context.widgetE / 2,
                height: context.heightE / 3,
                child: SvgPicture.asset(
                  "images/undraw_login_re_4vu2.svg",
                ),
              ),
            ),
            Center(
              child: Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: context.textScaleFactorE + 20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: context.heightE / 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextFieldInput(
                controller: _email,
                hintText: "Email",
                textInputType: TextInputType.text,
                icon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: context.heightE / 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextFieldInputPass(
                controller: _pass,
                hintText: "Password",
                textInputType: TextInputType.text,
                icon: Icon(Icons.password_rounded),
              ),
            ),
            Row(
              children: [
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: context.rightE + 15),
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => ForgetPasswordPage());
                    },
                    child: Text("Forget Password ?"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: context.heightE / 60,
            ),
            CustomButton(
              onTap: () {
                _loginController.loginUser(
                    email: _email.text, pass: _pass.text);
              },
              title: "Login",
            ),
            SizedBox(
              height: context.heightE / 25,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?"),
                TextButton(
                  onPressed: () {
                    Get.to(() => SignUpPage());
                  },
                  child: Text("Register now"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
