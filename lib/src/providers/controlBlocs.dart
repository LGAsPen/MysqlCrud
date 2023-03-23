// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:testing_app/src/bloc/loginBloc.dart';

class ControlBloc extends InheritedWidget {
  ControlBloc({Key? key, required Widget child})
      : super(key: key, child: child);

  final loginBloc = LoginBloc();
  @override
  bool updateShouldNotify(ControlBloc oldWidget) {
    return true;
  }

  static LoginBloc? blocLogin(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ControlBloc>()?.loginBloc;
  }
}
