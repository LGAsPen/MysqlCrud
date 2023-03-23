import 'package:flutter/material.dart';

class HomePrincipal extends StatefulWidget {
  final String nombre;
  const HomePrincipal({
    required this.nombre,
    Key? key,
  }) : super(key: key);

  @override
  State<HomePrincipal> createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 150, 2),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment(-0.99, 0.55),
            colors: <Color>[
              Color(0xffe8521e),
              Color(0xfff7ab35),
            ],
          )),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.restorablePushNamed(context, 'homeLogin');
            },
            icon: const Icon(
              Icons.logout,
              size: 35,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Desarrollado por: Luis Roman ©"),
          ));
        },
        child: const Icon(
          Icons.warning,
          color: Colors.orange,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '¡Bienvenido!',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.nombre,
            style: const TextStyle(color: Colors.white, fontSize: 19),
          ),
          SizedBox(
            height: size.height * 0.2,
            width: double.infinity,
            child: Image.asset(
              'assets/images/usuario.png',
            ),
          ),
        ],
      ),
    );
  }
}
