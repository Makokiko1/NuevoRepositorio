import 'package:flutter/material.dart';
import 'MenuLateral.dart';

class enlace1 extends StatelessWidget {
  const enlace1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Primera pantalla"),
      ),
      drawer: const menulateral(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/_f9a9646a-ecac-4b6e-8617-851a0950b0a4.jpg',
              width: 120,
              height: 120,
            ),
            Image.asset(
              'assets/images/_1afdc249-79e5-4422-b32f-5048a58f507c.jpg',
              width: 120,
              height: 120,
            ),
            Image.asset(
              'assets/images/_f9a9646a-ecac-4b6e-8617-851a0950b0a4.jpg',
              width: 120,
              height: 120,
            ),
          ],
        ),
      ), 
    );
  }
}
