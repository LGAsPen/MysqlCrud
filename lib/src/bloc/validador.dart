import 'dart:async';

class Validators {
  final validateUser = StreamTransformer<String, String>.fromHandlers(
      handleData: (usuario, sink) {
    //Pattern pattern = r'^[a-zA-z0-9ÑñáÁéÉíÍóÓúÚ]+$';
    RegExp regExp = RegExp(r'^[a-zA-z0-9ÑñáÁéÉíÍóÓúÚ]+$');
    if (usuario != "") {
      sink.add(usuario);
      if (regExp.hasMatch(usuario)) {
        sink.add(usuario);
        if (usuario.contains(RegExp(r'[\[\]\^\-\_\\ ]'))) {
          sink.addError('2');
        } else {
          sink.add(usuario);
          if (usuario.length >= 5 && usuario.length <= 15) {
            sink.add(usuario);
          } else {
            sink.addError('3');
          }
        }
      } else {
        sink.addError('2');
      }
    } else {
      sink.addError('1');
    }
  });
  final validatePass = StreamTransformer<String, String>.fromHandlers(
      handleData: (contrasena, sink) {
    String pattern = r'^[a-zA-z0-9ÑñáÁéÉíÍóÓúÚ]+$';
    // Pattern pattern = r'^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$';
    RegExp regExp = RegExp(pattern);
    if (contrasena != "") {
      sink.add(contrasena);

      if (regExp.hasMatch(contrasena)) {
        sink.add(contrasena);
        if ((contrasena.contains(RegExp(r'[\[\]\^\-\_\\ ]')))) {
          sink.addError('2');
        } else {
          sink.add(contrasena);
          if (contrasena.length >= 6 && contrasena.length <= 10) {
            sink.add(contrasena);
          } else {
            sink.addError('3');
          }
        }
      } else {
        sink.addError('2');
      }
    } else {
      sink.addError('1');
    }
  });
}
