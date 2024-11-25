import 'package:flutter/material.dart';
import 'package:actividad1/main.dart';
import 'package:actividad1/Screens/contador_de_clicks.dart';
import 'package:actividad1/Screens/enlace1.dart';
import 'package:actividad1/Screens/enlace2.dart';
import 'package:actividad1/Screens/enlace3.dart';
import 'package:actividad1/Screens/instagram.dart';
import 'package:actividad1/Screens/entrega3.dart';
import 'package:actividad1/Screens/pista_de_aterrizaje.dart'; // Verifica el nombre exacto del archivo
import 'package:actividad1/Screens/disposicion_de_pantalla_compuesta.dart'; // Asegúrate de que el nombre del archivo esté bien escrito

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomePage(),
  '/enlace1': (context) => const enlace1(),
  '/enlace2': (context) => const enlace2(),
  '/enlace3': (context) => const enlace3(),
  '/instagram': (context) => const Instagram(),
  '/pistadeaterrizaje': (context) => const Pistadeaterrizaje(), // Verifica el nombre de la clase
  '/disposicionPantalla': (context) => const Disposiciondepantallacompuesta(), // Asegúrate de que la clase y el archivo coincidan
  '/contadorClics': (context) => const Contadordeclicks(),
  '/randomColors': (context) => const RandomImagesPage(),
};
