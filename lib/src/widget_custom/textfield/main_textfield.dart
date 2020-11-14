import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final bool enabled;

  const MainTextField({
    Key key,
    @required this.labelText,
    this.controller,
    this.obscureText = false,
    this.enabled = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 160,
      height: 40,
      child: Center(
        child: TextField(
          enabled: enabled,
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: new BorderSide(
                color: Color(0xff6E8EC6),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(
                color: Color(0xff6E8EC6),
              ),
            ),
            labelText: '$labelText',
            labelStyle: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
