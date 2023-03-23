import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/src/mysqlConnect.dart';
import 'package:testing_app/src/pages/login/variblesLogin.dart';
import 'package:testing_app/src/pages/principal/home_principal.dart';
import 'package:testing_app/src/providers/loginProvider.dart';
import 'package:testing_app/src/providers/registroProvider.dart';
import 'package:testing_app/src/widgets/createHeader.dart';

class HomeLogin extends StatefulWidget {
  const HomeLogin({Key? key}) : super(key: key);

  @override
  State<HomeLogin> createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> {
  final VariablesLogin _variablesLogin = VariablesLogin();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final ProviderLogin _providerSelection = context.watch<ProviderLogin>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CustomPaint(
              painter: HeaderAppBar(),
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/png/usuarioPerfil.png',
                        width: _size.width * 0.2,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Iniciar Sesion',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            top: _size.height * 0.05,
                            left: _size.width * 0.08,
                            right: _size.width * 0.08),
                        child: TextField(
                          decoration: _variablesLogin.decorationTextField(
                              hintText: 'Usuario',
                              iconField: const Padding(
                                padding: EdgeInsetsDirectional.only(end: 12.0),
                                child: Icon(Icons.person),
                              ),
                              errorText: _providerSelection.seeErrorUser),
                          onChanged: (value) {
                            debugPrint('USUARIO== $value');
                            if (value.isEmpty) {
                              context.read<ProviderLogin>().setErrorUser(
                                  value: 'El campo usuario esta vacio');
                            } else if (value.contains(" ")) {
                              context.read<ProviderLogin>().setErrorUser(
                                  value:
                                      'El campo usuario solo acepta letras y números');
                            } else if (value.length < 5 || value.length > 15) {
                              context.read<ProviderLogin>().setErrorUser(
                                  value:
                                      'El campo usuario solo acepta entre 5 y 15 caracteres');
                            } else {
                              context
                                  .read<ProviderLogin>()
                                  .setErrorUser(value: '');
                              context
                                  .read<ProviderLogin>()
                                  .setUser(value: value);
                            }
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: _size.width * 0.08,
                            right: _size.width * 0.08,
                            top: _size.height * 0.02,
                            bottom: _size.height * 0.025),
                        width: _size.width * 0.85,
                        child: TextField(
                          decoration: _variablesLogin.decorationTextField(
                              hintText: 'Contraseña',
                              iconField: Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(end: 12.0),
                                child: IconButton(
                                  onPressed: (() {
                                    context
                                        .read<ProviderLogin>()
                                        .setSeePassword(
                                            value: (_providerSelection
                                                        .seePassword ==
                                                    false)
                                                ? true
                                                : false);
                                  }),
                                  icon: (_providerSelection.seePassword == true)
                                      ? const Icon(Icons.lock)
                                      : const Icon(Icons.lock_open),
                                ), // myIcon is a 48px-wide widget.
                              ),
                              errorText: _providerSelection.seeErrorPass),
                          obscureText: _providerSelection.seePassword,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              context.read<ProviderLogin>().setErrorPass(
                                  value: 'El campo contraseña está vacío');
                            } else if (value.length < 8 || value.length > 25) {
                              context.read<ProviderLogin>().setErrorPass(
                                  value:
                                      'El campo contraseña solo acepta entre 8 y 25 caracteres');
                            } else if (value.contains(" ")) {
                              context.read<ProviderLogin>().setErrorPass(
                                  value:
                                      'El campo contraseña solo acepta letras, números y los siguientes caracteres ¡, @, #, %, &, *, -, _.');
                            } else {
                              context
                                  .read<ProviderLogin>()
                                  .setErrorPass(value: '');
                              context
                                  .read<ProviderLogin>()
                                  .setPass(value: value);
                            }
                          },
                        ),
                      ),
                      Container(
                        height: _size.height * 0.04,
                        padding: EdgeInsets.only(
                          left: _size.width * 0.2,
                          right: _size.width * 0.2,
                        ),
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 150, 2),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () async {
                              if (_providerSelection.seeUser
                                      .toString()
                                      .isEmpty ||
                                  _providerSelection.seeUser == null &&
                                      _providerSelection.seePass
                                          .toString()
                                          .isEmpty ||
                                  _providerSelection.seePass == null) {
                                context.read<ProviderLogin>().setErrorUser(
                                    value: 'El campo usuario esta vacio');
                                context.read<ProviderLogin>().setErrorPass(
                                    value: 'El campo contraseña está vacío');
                              } else if (_providerSelection.seeUser
                                      .toString()
                                      .isEmpty ||
                                  _providerSelection.seeUser == null) {
                                context.read<ProviderLogin>().setErrorUser(
                                    value: 'El campo usuario esta vacio');
                              } else if (_providerSelection.seePass
                                      .toString()
                                      .isEmpty ||
                                  _providerSelection.seePass == null) {
                                context.read<ProviderLogin>().setErrorPass(
                                    value: 'El campo contraseña está vacío');
                              } else {
                                if (_providerSelection.seeErrorPass == "" &&
                                    _providerSelection.seeErrorUser == "") {
                                  context
                                      .read<ProviderLogin>()
                                      .setLoader(value: true);

                                  Future.delayed(
                                      const Duration(milliseconds: 1500),
                                      () async {
                                    context
                                        .read<ProviderLogin>()
                                        .setLoader(value: false);
                                    Mysql _mysql = Mysql();
                                    Results resp = await _mysql.getLogin(
                                        '${_providerSelection.seeUser}',
                                        '${_providerSelection.seePass}');
                                    if (resp.isNotEmpty) {
                                      String nombre = "";
                                      for (var item in resp) {
                                        debugPrint('NAME: ${item[1]}');
                                        nombre = item[1];
                                      }
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  HomePrincipal(
                                                    nombre: nombre,
                                                  ))));
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (_) => _crearAlert('Error',
                                              'Usuario y/o contraseña incorrectos'));
                                    }
                                  });
                                }
                              }
                            },
                            child: (_providerSelection.seeLoader == false)
                                ? const Text(
                                    'Iniciar sesión',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                : const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: _size.height * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: _size.width * 0.5,
                              child: CheckboxListTile(
                                title: const Text('Recordar'),
                                value: true,
                                onChanged: (value) {},
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              ),
                            ),
                            // InkWell(
                            //   child: const Text(
                            //     '¿Olvidaste tu contraseña?',
                            //     style: TextStyle(color: Colors.blue),
                            //   ),
                            //   onTap: () {},
                            // ),
                          ],
                        ),
                      ),
                      const Text(
                        '¿Quieres ser parte de nuestros afiliadores comerciales',
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        child: const Text(
                          'Registrate aquí',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 150, 2),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          context
                              .read<ProviderRegistro>()
                              .setNombre(value: null);
                          context.read<ProviderRegistro>().setMail(value: null);
                          context
                              .read<ProviderRegistro>()
                              .setPhone(value: null);
                          context.read<ProviderRegistro>().setUser(value: null);
                          context.read<ProviderRegistro>().setPass(value: null);

                          context
                              .read<ProviderRegistro>()
                              .setErrorName(value: '');
                          context
                              .read<ProviderRegistro>()
                              .setErrorMail(value: '');
                          context
                              .read<ProviderRegistro>()
                              .setErrorPhone(value: '');
                          context
                              .read<ProviderRegistro>()
                              .setErrorUser(value: '');
                          context
                              .read<ProviderRegistro>()
                              .setErrorPass(value: '');
                          Navigator.pushReplacementNamed(
                              context, 'homeRegistro');
                        },
                      )
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Widget _crearAlert(String title, description) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 150, 2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
              ),
              const SizedBox(height: 50),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 20),
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 150, 2),
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Aceptar',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
          Positioned(
            child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            top: -2.0,
            right: -7.0,
          )
        ],
      ),
    );
  }
}
