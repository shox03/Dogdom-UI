import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({this.number});

  String? number;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
      };
}
