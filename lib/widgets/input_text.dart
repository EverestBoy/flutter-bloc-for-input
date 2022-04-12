/*
 * Copyright (c) 2022. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

import 'dart:async';

import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  StreamSink<String> inputSink;
  String label;
  String hint;
  IconData icon;
  bool isPassword;
  var regex;
  var errorMessage;

  InputText(
      {required StreamSink<String> this.inputSink,
      required String this.hint,
      required IconData this.icon,
      required String this.label,
      required bool this.isPassword,
      required this.regex,
      required this.errorMessage}) {}

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
      ),
      obscureText: isPassword,
      onChanged: (text) {
        inputSink.add(text);
      },
      validator: (value) {
        if (regex.hasMatch(value)) {
          return null;
        }
        return errorMessage;
      },
    );
  }
}
