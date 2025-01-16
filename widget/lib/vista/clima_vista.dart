import 'package:flutter/material.dart';
import '../modelo/clima_modelo.dart';
import '../controlador/clima_controlador.dart';
import 'clima_widget.dart';

class ClimaVista extends StatefulWidget {
  @override
  ClimaVistaState createState() => ClimaVistaState();
}

class ClimaVistaState extends State<ClimaVista> {
  final TextEditingController ciudadC = TextEditingController();
  final ClimaControlador climaC = ClimaControlador();

  ClimaModelo? climaModelo;
  bool isLoading = false;

  void buscarClima() {
    setState(() {
      isLoading = true;
    });

    climaC.obtenerClima(ciudadC.text).then((resultado) {
      setState(() {
        climaModelo = resultado;
        isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      print('Error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta el Clima'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: ciudadC,
              decoration: InputDecoration(
                labelText: 'Introduce una ciudad',
                hintText: 'Ejemplo: Madrid',
                prefixIcon: Icon(Icons.location_city),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: buscarClima,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: isLoading
                  ? CircularProgressIndicator(
                color: Colors.white,
              )
                  : Text(
                'Buscar',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 30),
            if (climaModelo != null)
              ClimaWidget(
                ciudad: climaModelo!.ciudad,
                temperatura: double.tryParse(climaModelo!.temperatura) ?? 0.0,
                descripcion: climaModelo!.descripcion,
              ),
            if (climaModelo == null && !isLoading)
              Text(
                'Introduce una ciudad para obtener el clima',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }
}
