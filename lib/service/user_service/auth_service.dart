import 'package:dio/dio.dart';
import 'package:dogdom_ui/models/user_models/user_models.dart';

class AuthService {
  Future signUp(UserModel user) async {
    try {
      Response res = await Dio().post(
        "http://10.0.2.2:3000/users",
        data: user.toJson(),
      );

      // SharedPreferences pref = await SharedPreferences.getInstance();
      // await pref.setBool('isLogged', true);
      // await pref.setString('profile', res.data.toString());
      return 'Successful';
    } catch (err) {
      print(err);
      return 'User registratsiyasida xatolik: auth service';
    }
  }

  Future<List<UserModel>> getAllUsers() async {
    try {
      Response res = await Dio().get("http://10.0.2.2:3000/users" + '/users');
      return (res.data as List).map((e) => UserModel.fromJson(e)).toList();
    } catch (err) {
      rethrow;
    }
  }
}
