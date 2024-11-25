// ignore: file_names

import 'package:flutter/material.dart';
import 'package:actividad1/Screens/menu_lateral.dart';

class Pistadeaterrizaje extends StatelessWidget {
  const Pistadeaterrizaje({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle Container Example'),
      ),
      drawer: const MenuLateral(), // No es necesario pasar el context aquí
      body: Center(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromARGB(255, 2, 15, 255),
                width: 10,
              ),
            ),
            width: 280,
            height: 280,
            alignment: Alignment.center,
            child: const Text(
              'H',
              style: TextStyle(
                fontSize: 180,
                color: Color.fromARGB(255, 8, 52, 246),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
