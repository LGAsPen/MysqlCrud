// ignore_for_file: file_names
import 'package:rxdart/rxdart.dart';
import 'package:testing_app/src/bloc/validador.dart';

class LoginBloc with Validators {
  final _user = BehaviorSubject<String>();
  final _pass = BehaviorSubject<String>();

  Stream<String> get userStream => _user.stream.transform(validateUser);
  Stream<String> get passStream => _pass.stream.transform(validatePass);

  Stream<bool> get validateDate =>
      Rx.combineLatest2(userStream, passStream, (a, b) => true);

  Function(String) get changeUser => _user.sink.add;
  Function(String) get changePass => _pass.sink.add;

  String get user => _user.value;
  String get pass => _pass.value;

  closeStream() {
    _user.close();
    _pass.close();
  }
}
