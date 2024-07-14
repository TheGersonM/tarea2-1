import 'package:login/home_page.dart';
import 'package:login/registro.dart';
import 'package:login/inicio.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      // home: HomePage(),
      initialRoute: 'home', //esta es la ruta principal
      routes: {
        'home': (context) => const HomePage(),
        'registro': (context) =>  Registro(),
        'inicio' : (context) => const Inicio()
      },
      onGenerateRoute: (RouteSettings settings) {
        
        return MaterialPageRoute(
          builder: (context) => PageNotFound(ruta: settings.name),
        );
      },
    );
  }
}

class PageNotFound extends StatelessWidget {
  const PageNotFound({
    super.key,
    this.ruta = 'No-found',
  });

  final String? ruta;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('La ruta "$ruta" no existe')));
  }
}