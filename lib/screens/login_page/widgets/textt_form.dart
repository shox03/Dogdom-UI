import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatefulWidget {
  const TextFormWidget({Key? key}) : super(key: key);

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
    return TextFormField(
      validator: (v) {
        if (v!.isEmpty) {
          return "Field can't be empty";
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromRGBO(255, 255, 255, 0.25),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(71.0),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(28)),
          child: DropdownButton<String>(
            dropdownColor: Colors.grey,
            style: TextStyle(color: Colors.white, fontSize: 17.0),
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
    );
  }
}

// Inspired by dropdown buttons demo in offical flutter gallery:
// https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/demo/material/buttons_demo.dart
class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[],
    );
  }
}
