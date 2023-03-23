// ignore_for_file: avoid_init_to_null, file_names

import 'package:flutter/foundation.dart';

class ProviderLogin with ChangeNotifier {
  bool _seePassword = false;
  String? _user = null;
  String? _pass = null;
  String _errorUser = "";
  String _errorPass = "";
  bool _loader = false;

  bool get seePassword => _seePassword;
  String? get seeUser => _user;
  String? get seePass => _pass;
  String get seeErrorUser => _errorUser;
  String get seeErrorPass => _errorPass;
  bool get seeLoader => _loader;

  Future<void> setSeePassword({@required value}) async {
    _seePassword = value;
    notifyListeners();
  }

  Future<void> setUser({@required value}) async {
    _user = value;
    notifyListeners();
  }

  Future<void> setPass({@required value}) async {
    _pass = value;
    notifyListeners();
  }

  Future<void> setErrorUser({@required value}) async {
    _errorUser = value;
    notifyListeners();
  }

  Future<void> setErrorPass({@required value}) async {
    _errorPass = value;
    notifyListeners();
  }

  Future<void> setLoader({@required value}) async {
    _loader = value;
    notifyListeners();
  }
}
