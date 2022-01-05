// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:dogdom_ui/models/user_models/user_models.dart';

// class UserService {
//   Future<List<UserModel>> getUsers() async {
//     Response res = await Dio().get(
//       Platform.isAndroid
//           ? 'http://10.0.2.2:3000/users'
//           : 'http://localhost:3000/users',
//     );

//     return (res.data as List).map((e) => UserModel.fromJson(e)).toList();
//   }
// }
