import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysql1/mysql1.dart';
import 'package:testing_app/src/mysqlConnect.dart';
import 'package:testing_app/src/pages/login/variblesLogin.dart';
import 'package:testing_app/src/providers/registroProvider.dart';

class HomeRegistro extends StatelessWidget {
  HomeRegistro({Key? key}) : super(key: key);
  final VariablesLogin _variablesLogin = VariablesLogin();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ProviderRegistro _providerSelection =
        context.watch<ProviderRegistro>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: size.height * 0.15, bottom: 30),
            alignment: Alignment.topCenter,
            child: const Text(
              'Registrate!',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 150, 2),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: size.height * 0.62,
            width: size.width * 0.90,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: const Color.fromARGB(255, 255, 150, 2), width: 1.0)),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                  ),
                  child: TextField(
                    decoration: _variablesLogin.decorationTextField(
                      iconField: Container(width: 1),
                      hintText: 'Nombre',
                      errorText: '${_providerSelection.seeErrorName}',
                    ),
                    onChanged: (value) {
                      String pattern = r'^[a-zA-ZñÑáÁéÉíÍóÓúÚ ]+$';
                      RegExp regExp = RegExp(pattern);
                      if (value.isEmpty) {
                        context.read<ProviderRegistro>().setErrorName(
                            value: 'El campo nombre completo está vacío');
                      } else if (!regExp.hasMatch(value)) {
                        context.read<ProviderRegistro>().setErrorName(
                            value:
                                'El campo nombre completo solo acepta letras');
                      } else if (value.length < 6 || value.length > 80) {
                        context.read<ProviderRegistro>().setErrorName(
                            value:
                                'El campo nombre completo solo acepta entre 6 y 80 caracteres');
                      } else {
                        context
                            .read<ProviderRegistro>()
                            .setErrorName(value: '');
                        context
                            .read<ProviderRegistro>()
                            .setNombre(value: value);
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    decoration: _variablesLogin.decorationTextField(
                      iconField: Container(width: 1),
                      hintText: 'Correo',
                      errorText: '${_providerSelection.seeErrorMail}',
                    ),
                    onChanged: (value) {
                      String pattern1 =
                          r'^[a-zA-Z0-9.a-zA-Z0-9.+-_]+@[a-zA-Z0-9]+\.[a-zA-Z]';
                      RegExp _regExp = RegExp(pattern1);
                      if (value.isEmpty) {
                        context
                            .read<ProviderRegistro>()
                            .setErrorMail(value: 'El campo email está vacío');
                      } else if (value.length < 10 || value.length > 65) {
                        context.read<ProviderRegistro>().setErrorMail(
                            value:
                                'El campo email solo acepta entre 10 y 65 caracteres');
                      } else if (!_regExp.hasMatch(value)) {
                        context
                            .read<ProviderRegistro>()
                            .setErrorMail(value: 'Formato incorrecto');
                      } else {
                        context
                            .read<ProviderRegistro>()
                            .setErrorMail(value: '');
                        context.read<ProviderRegistro>().setMail(value: value);
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    decoration: _variablesLogin.decorationTextField(
                      iconField: Container(width: 1),
                      hintText: 'Telefono',
                      errorText: '${_providerSelection.seeErrorPhone}',
                    ),
                    onChanged: (value) {
                      String pattern1 = r'^[0-9]+$';
                      RegExp _regExp = RegExp(pattern1);
                      if (value.isEmpty) {
                        context.read<ProviderRegistro>().setErrorPhone(
                            value: 'El campo teléfono está vacío');
                      } else if (!_regExp.hasMatch(value)) {
                        context.read<ProviderRegistro>().setErrorPhone(
                            value: 'El campo solo puede contener números');
                      } else if (value.length != 10) {
                        context.read<ProviderRegistro>().setErrorPhone(
                            value: 'El campo teléfono solo acepta 10 dígitos');
                      } else {
                        context
                            .read<ProviderRegistro>()
                            .setErrorPhone(value: '');
                        context.read<ProviderRegistro>().setPhone(value: value);
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    decoration: _variablesLogin.decorationTextField(
                      iconField: Container(width: 1),
                      hintText: 'Usuario',
                      errorText: '${_providerSelection.seeErrorUser}',
                    ),
                    onChanged: (value) {
                      String pattern = r'^[a-zA-z0-9]+$';
                      RegExp _regExp = RegExp(pattern);

                      if (value.isEmpty) {
                        context
                            .read<ProviderRegistro>()
                            .setErrorUser(value: 'El campo usuario está vacio');
                      } else if (!_regExp.hasMatch(value)) {
                        context.read<ProviderRegistro>().setErrorUser(
                            value:
                                'El campo usuario solo acepta letras y números');
                      } else if (value.length < 5 || value.length > 15) {
                        context.read<ProviderRegistro>().setErrorUser(
                            value:
                                'El campo usuario solo acepta entre 5 y 15 caracteres');
                      } else {
                        context
                            .read<ProviderRegistro>()
                            .setErrorUser(value: '');
                        context.read<ProviderRegistro>().setUser(value: value);
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    decoration: _variablesLogin.decorationTextField(
                      iconField: Container(width: 1),
                      hintText: 'Contraseña',
                      errorText: '${_providerSelection.seeErrorPass}',
                    ),
                    onChanged: (value) {
                      String pattern = r'^[a-zA-záéíóúÁÉÍÓÚ0-9¡#%&*]+$';
                      RegExp _regExp = RegExp(pattern);
                      if (value.isEmpty) {
                        context.read<ProviderRegistro>().setErrorPass(
                            value: 'El campo contraseña está vacío');
                      } else if (!_regExp.hasMatch(value)) {
                        context.read<ProviderRegistro>().setErrorPass(
                            value:
                                'El campo contraseña solo acepta letras, números y los siguientes caracteres ¡, @, #, %, &, *, -, _.');
                      } else if (value.length < 8 || value.length > 25) {
                        context.read<ProviderRegistro>().setErrorPass(
                            value:
                                'El campo contraseña solo acepta entre 8 y 25 caracteres');
                      } else {
                        context
                            .read<ProviderRegistro>()
                            .setErrorPass(value: '');
                        context.read<ProviderRegistro>().setPass(value: value);
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 150, 2),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () async {
                          if (_providerSelection.seeNombre!.isEmpty) {
                            context.read<ProviderRegistro>().setErrorName(
                                value: 'El campo nombre completo está vacío');
                          } else if (_providerSelection.seeMail!.isEmpty) {
                            context.read<ProviderRegistro>().setErrorMail(
                                value: 'El campo email está vacío');
                          } else if (_providerSelection.seePhone!.isEmpty) {
                            context.read<ProviderRegistro>().setErrorPhone(
                                value: 'El campo teléfono está vacío');
                          } else if (_providerSelection.seeUser!.isEmpty) {
                            context.read<ProviderRegistro>().setErrorUser(
                                value: 'El campo usuario está vacio');
                          } else if (_providerSelection.seePass!.isEmpty) {
                            context.read<ProviderRegistro>().setErrorPass(
                                value: 'El campo contraseña está vacío');
                          } else {
                            if (_providerSelection.seeErrorName!.isEmpty &&
                                _providerSelection.seeErrorMail!.isEmpty &&
                                _providerSelection.seeErrorPhone!.isEmpty &&
                                _providerSelection.seeErrorUser!.isEmpty &&
                                _providerSelection.seeErrorPass!.isEmpty) {
                              Mysql _mysql = Mysql();
                              Results resp = await _mysql.insertUser(
                                  '${_providerSelection.seeNombre}',
                                  '${_providerSelection.seeMail}',
                                  '${_providerSelection.seePhone}',
                                  '${_providerSelection.seeUser}',
                                  '${_providerSelection.seePass}');
                              context
                                  .read<ProviderRegistro>()
                                  .setLoaderinsertar(value: true);
                              Future.delayed(const Duration(milliseconds: 1500),
                                  () async {
                                String insert = resp.insertId.toString();
                                debugPrint(insert);
                                if (insert.isEmpty) {
                                  context
                                      .read<ProviderRegistro>()
                                      .setLoaderinsertar(value: false);
                                  showDialog(
                                      context: context,
                                      builder: (context) => _crearAlert(
                                          'Error de comunicación',
                                          'Se produjo un problema de comunicación con los servidores.Vuelva a intentarlo más tarde',
                                          context));
                                } else {
                                  context
                                      .read<ProviderRegistro>()
                                      .setLoaderinsertar(value: false);

                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) => _crearAlert(
                                          'Exitoso',
                                          'El usuario se a registrado de manera correcta, ahora ya puedes usar tus datos para iniciar sesión',
                                          context));
                                }
                              });
                            }
                          }
                        },
                        child: (_providerSelection.seeLoaderinsertar == false)
                            ? const Text(
                                'Aceptar',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(
                                  width: 1.0,
                                  color: Color.fromARGB(255, 255, 150, 2)))),
                      onPressed: () async {
                        Navigator.restorablePushNamed(context, 'homeLogin');
                      },
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 150, 2),
                            fontSize: 20),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _crearAlert(String title, description, BuildContext context) {
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
                decoration: BoxDecoration(
                    color: (title == 'Exitoso')
                        ? Colors.green
                        : const Color.fromARGB(255, 255, 150, 2),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
              ),
              const SizedBox(height: 50),
              Text(
                title,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: (title == 'Exitoso') ? Colors.green : Colors.red),
              ),
              const SizedBox(height: 20),
              Text(
                description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 20),
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: (title == 'Exitoso')
                          ? Colors.green
                          : const Color.fromARGB(255, 255, 150, 2),
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    if (title == 'Exitoso') {
                      Navigator.pushReplacementNamed(context, 'homeLogin');
                    } else {
                      Navigator.of(context).pop();
                    }
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
            child: (title == 'Exitoso')
                ? const SizedBox(
                    height: 1,
                    width: 1,
                  )
                : IconButton(
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
