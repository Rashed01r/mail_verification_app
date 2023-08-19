import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_phone/controller/signUpController.dart';
import 'package:otp_phone/extension/mediaQueryHelper.dart';

class CustomButtonTwo extends StatelessWidget {
  final Function()? onTap;
  final String? title;

  CustomButtonTwo({
    super.key,
    required this.onTap,
    required this.title,
  });

  final SignUpController _signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (_) {
        return InkWell(
          onTap: onTap,
          child: Container(
            width: context.widgetE / 3.5,
            height: context.heightE / 15,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent),
            child: _signUpController.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Text(
                    title!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
