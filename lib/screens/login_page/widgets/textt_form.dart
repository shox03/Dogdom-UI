import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:dogdom_ui/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFormWidget extends StatefulWidget {
  late bool isVisible;
  late bool isLoginPage;

  @override
  _TextFormWidgetState createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  static const menuItems = <String>[
    '+86',
    '+90',
    '+91',
    '+99',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String _btn1SelectedVal = '+86';

  @override
  Widget build(BuildContext context) {
    var contextWatch = context.watch<AuthProvider>();
    var contextRead = context.read<AuthProvider>();
    return Form(
      key: contextWatch.formKey,
      child: TextFormField(
        controller: contextWatch.phoneController,
        validator: (v) {
          if (v!.isEmpty) {
            return "Field can't be empty";
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(255, 255, 255, 0.25),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(71.0),
            borderSide: BorderSide.none,
          ),
          hintStyle: const TextStyle(color: Colors.white),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(28)),
            child: DropdownButton<String>(
              dropdownColor: Colors.grey,
              style: const TextStyle(color: Colors.white, fontSize: 17.0),
              value: _btn1SelectedVal,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() => _btn1SelectedVal = newValue);
                }
              },
              items: this._dropDownMenuItems,
            ),
          ),
        ),
      ),
    );
  }
}
