import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:dogdom_ui/screens/login_page/widgets/login_button.dart';
import 'package:dogdom_ui/screens/login_page/widgets/textt_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Login - Input.png'),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(28.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getProportionateScreenHeight(165.0)),
                SvgPicture.asset("assets/Dogdom.svg"),
                SizedBox(height: getProportionateScreenHeight(31.0)),
                TextFormWidget(),
                SizedBox(height: getProportionateScreenHeight(16.0)),
                LoginButtonWidget(),
                SizedBox(height: getProportionateScreenHeight(15.0)),
                const Text(
                  "Password to Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(height: getProportionateScreenHeight(291.0)),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    "By signing in, you agree to the User Agreemen\nand Privacy Terms.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
