import 'package:flutter/material.dart';
import 'package:testing_app/src/pages/login/home_login.dart';
import 'package:testing_app/src/pages/principal/home_principal.dart';
import 'package:testing_app/src/pages/registro/home_registro.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    'homeLogin': (BuildContext context) => const HomeLogin(),
    'homePrincipal': (BuildContext context) => const HomePrincipal(
          nombre: '',
        ),
    'homeRegistro': (BuildContext context) => HomeRegistro()
  };
}
