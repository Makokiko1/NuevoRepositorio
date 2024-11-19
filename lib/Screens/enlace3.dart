import 'package:flutter/material.dart';
import 'MenuLateral.dart';

class enlace3 extends StatelessWidget {
  const enlace3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de Íconos'),
      ),
      drawer: menulateral(), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Icon(
              Icons.home, 
              size: 100.0, 
              color: Colors.green,
            ),
            Icon(
              Icons.adb_sharp,
              size: 100.0,
              color: Colors.green,
            ),
            Icon(
              Icons.ac_unit_rounded,
              size: 100.0,
              color: Colors.green,
            ),
            Icon(
              Icons.access_alarm_rounded,
              size: 100.0,
              color: Colors.green,
            ),
            Icon(
              Icons.add_road,
              size: 100.0,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
