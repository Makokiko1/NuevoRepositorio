import 'package:flutter/material.dart';
import 'package:actividad1/Screens/menu_lateral.dart';

class Disposiciondepantallacompuesta extends StatelessWidget {
  const Disposiciondepantallacompuesta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de filas y columnas anidadas'),
      ),
      drawer: const MenuLateral(), // Usa el Drawer ya existente
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Primera fila (1 imagen)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImage('assets/images/_f9a9646a-ecac-4b6e-8617-851a0950b0a4.jpg'),
            ],
          ),
          const SizedBox(height: 20),
          // Segunda fila (2 imágenes)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImage('assets/images/_1afdc249-79e5-4422-b32f-5048a58f507c.jpg'),
              const SizedBox(width: 20),
              _buildImage('assets/images/descarga.jpg'),
            ],
          ),
          const SizedBox(height: 20),
          // Tercera fila (3 imágenes)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImage('assets/images/deporte.jpg'),
              const SizedBox(width: 20),
              _buildImage('assets/images/Colegas.jpg'),
              const SizedBox(width: 20),
              _buildImage('assets/images/Vecinos.jpg'),
            ],
          ),
        ],
      ),
    );
  }

  // Método para construir una imagen con un tamaño fijo
  Widget _buildImage(String assetPath) {
    return Column(
      children: [
        Image.asset(
          assetPath,
          width: 100,  // Ancho de la imagen
          height: 100, // Alto de la imagen
          fit: BoxFit.cover,  // Asegura que la imagen se recorte adecuadamente
        ),
        const SizedBox(height: 5),
        const Text('Imagen'),
      ],
    );
  }
}
