// ignore_for_file: avoid_init_to_null, file_names

import 'package:flutter/foundation.dart';

class ProviderRegistro with ChangeNotifier {
  String? _name = null;
  String? _mail = null;
  String? _phone = null;
  String? _user = null;
  String? _pass = null;

  String _errorName = "";
  String _errorMail = "";
  String _errorPhone = "";
  String _errorUser = "";
  String _errorPass = "";

  bool _loaderInsertar = false;

  String? get seeNombre => _name;
  String? get seeMail => _mail;
  String? get seePhone => _phone;
  String? get seeUser => _user;
  String? get seePass => _pass;

  String? get seeErrorName => _errorName;
  String? get seeErrorMail => _errorMail;
  String? get seeErrorPhone => _errorPhone;
  String? get seeErrorUser => _errorUser;
  String? get seeErrorPass => _errorPass;

  bool get seeLoaderinsertar => _loaderInsertar;

  Future<void> setNombre({@required value}) async {
    _name = value;
    notifyListeners();
  }

  Future<void> setMail({@required value}) async {
    _mail = value;
    notifyListeners();
  }

  Future<void> setPhone({@required value}) async {
    _phone = value;
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

  Future<void> setErrorName({@required value}) async {
    _errorName = value;
    notifyListeners();
  }

  Future<void> setErrorMail({@required value}) async {
    _errorMail = value;
    notifyListeners();
  }

  Future<void> setErrorPhone({@required value}) async {
    _errorPhone = value;
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

  Future<void> setLoaderinsertar({@required value}) async {
    _loaderInsertar = value;
    notifyListeners();
  }
}
