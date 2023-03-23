// ignore_for_file: file_names

import 'package:flutter/material.dart';

class VariablesLogin {
  decorationTextField(
      {required Widget iconField,
      required String errorText,
      String? hintText}) {
    return InputDecoration(
      suffixIcon: iconField,
      errorText: errorText,
      hintText: hintText,
      counterStyle: const TextStyle(color: Colors.red, fontSize: 10),
      errorMaxLines: 2,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 150, 2),
              width: 1.0,
              style: BorderStyle.solid)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 150, 2),
              width: 1.0,
              style: BorderStyle.solid)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 150, 2), width: 1.0),
          borderRadius: BorderRadius.circular(30.0)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 150, 2), width: 1.0),
          borderRadius: BorderRadius.circular(30.0)),
    );
  }
}
