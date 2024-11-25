import 'package:flutter/material.dart';
import 'package:actividad1/Screens/menu_lateral.dart';

// ignore: camel_case_types
class enlace2 extends StatelessWidget {
  const enlace2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda pantalla"),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/_f9a9646a-ecac-4b6e-8617-851a0950b0a4.jpg',
              width: 200,
              height: 200,
            ),
            Image.asset(
              'assets/images/_1afdc249-79e5-4422-b32f-5048a58f507c.jpg',
              width: 200,
              height: 200,
            ),
            Image.asset(
              'assets/images/_f9a9646a-ecac-4b6e-8617-851a0950b0a4.jpg',
              width: 200,
              height: 200,
            ),
          ],
        ),
      ), 
    );
  }
}
