import 'package:flutter/material.dart';
import 'vista/clima_vista.dart'; // Asegúrate de que la ruta sea correcta.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Clima',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClimaVista(),
    );
  }
}
