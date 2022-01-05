import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:dogdom_ui/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class LoginButtonWidget extends StatelessWidget {
  late bool isVisible;
  late bool isLoginPage;

  @override
  Widget build(BuildContext context) {
    var contextWatch = context.watch<AuthProvider>();
    var contextRead = context.read<AuthProvider>();
    isVisible = contextWatch.isVisible;
    isLoginPage = contextWatch.isLoginPage;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(250, 102, 80, 1),
          fixedSize: Size(
            getProportionateScreenWidth(319.0),
            getProportionateScreenHeight(58.0),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(65.0))),
      onPressed: () {
        contextRead.onSignUpPressed();
        contextWatch.onSignUpPressed();
      },
      child: const Text(
        "Get Captcha",
        style: TextStyle(
            color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}
