import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/src/providers/loginProvider.dart';
import 'package:testing_app/src/providers/registroProvider.dart';
import 'package:testing_app/src/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderLogin>(create: (_) => ProviderLogin()),
        ChangeNotifierProvider<ProviderRegistro>(
            create: (_) => ProviderRegistro())
      ],
      builder: (context, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: 'homeLogin',
          routes: routes(),
        );
      },
    );
  }
}
