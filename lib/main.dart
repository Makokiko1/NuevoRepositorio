import 'package:actividad1/screens/menu_lateral.dart'; // Asegúrate de que el nombre del archivo y la ruta coincidan
import 'package:actividad1/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo de Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blueAccent,
        hintColor: Colors.orange,
        scaffoldBackgroundColor: const Color.fromARGB(255, 151, 198, 232),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueAccent,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.lora().fontFamily,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black87,
            fontFamily: GoogleFonts.roboto().fontFamily,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.black54,
            fontFamily: GoogleFonts.roboto().fontFamily,
          ),
          labelLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: GoogleFonts.roboto().fontFamily,
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.orange,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      routes: appRoutes,
      initialRoute: '/', // Ruta inicial a la página Home
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
      drawer: const MenuLateral(),  // Usando el Drawer aquí
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Aarón Ortiz Sánchez",
              style: GoogleFonts.zillaSlab(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            Text(
              "https://github.com/Makokiko1/NuevoRepositorio",
              style: GoogleFonts.alexBrush(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
