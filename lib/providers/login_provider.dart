import 'package:dogdom_ui/models/user_models/user_models.dart';
import 'package:dogdom_ui/service/user_service/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool isVisible = true;
  bool isLoginPage = true;
  Icon eye = const Icon(Icons.remove_red_eye_outlined);

  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void changeLoginPage(bool v) {
    isLoginPage = v;
    notifyListeners();
  }

  void changeVisible(bool v) {
    isVisible = v;
    print(isVisible);
    eye = v
        ? const Icon(Icons.remove_red_eye_sharp)
        : const Icon(Icons.remove_red_eye_outlined);
  }

  void onLoginPressed() {}

  void onSignUpPressed() {
    print('sign up pressed');
    if (formKey.currentState!.validate()) {
      final AuthService authService = AuthService();

      UserModel user = UserModel(
        number: phoneController.text.trim(),
      );

      try {
        authService.signUp(user).then((value) {
          //Fluttertoast.showToast(msg: value);
          print(" auth providerda signup bosilganda:" + value);
        });
      } catch (e) {
        print(e.toString() + " auth providerda");
      }
    }
  }
}
