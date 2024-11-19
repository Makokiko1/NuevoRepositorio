import 'package:flutter/material.dart';
import 'Screens/MenuLateral.dart';
import 'Screens/enlace1.dart';
import 'Screens/enlace2.dart';
import 'Screens/enlace3.dart';
import 'Screens/instagram.dart';
import 'Screens/entrega3.dart'; 
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo de Drawer',
      routes: {
        '/': (context) => const HomePage(),
        '/enlace1': (context) => const enlace1(),
        '/enlace2': (context) => const enlace2(),
        '/enlace3': (context) => const enlace3(),
        '/instagram': (context) => const Instagram(),
        '/randomColors': (context) => const RandomImagesPage(), // Ruta para el juego
      },
      initialRoute: '/', // Ruta inicial
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Primera Página"),
      ),
      drawer: const menulateral(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Aarón Ortiz Sánchez",
              style: GoogleFonts.zillaSlab(fontSize: 32),
            ),
            Text(
              "https://github.com/Makokiko1/projectos-de-flutter",
              style: GoogleFonts.alexBrush(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
