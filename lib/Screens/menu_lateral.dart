import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Header del Drawer con imagen
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blueAccent, // Color personalizado para el encabezado
            ),
            child: Column(
              children: [
                Image.network(
                  'https://pbs.twimg.com/media/GWZilqNXIAI_6sz.jpg:large',
                  width: double.infinity, // Ajusta el tamaño de la imagen
                  height: 100, // Tamaño fijo para la imagen
                  fit: BoxFit.cover, // Ajusta la imagen al espacio
                ),
                Text(
                  'Menú Lateral',
                  style: GoogleFonts.roboto(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Color del texto
                  ),
                ),
              ],
            ),
          ),
          // Elementos del menú con borde azul oscuro y fondo azul oscuro
          _buildMenuItem(context, 'Enlace 1', '/enlace1'),
          _buildMenuItem(context, 'Enlace 2', '/enlace2'),
          _buildMenuItem(context, 'Enlace 3', '/enlace3'),
          _buildMenuItem(context, 'Instagram', '/instagram'),
          _buildMenuItem(context, 'Pista de aterrizaje', '/pistadeaterrizaje'),
          _buildMenuItem(context, 'Disposición Pantalla', '/disposicionPantalla'),
          _buildMenuItem(context, 'Contador de Clics', '/contadorClics'),
          _buildMenuItem(context, 'Imagenes randoms', '/randomColors'),
          _buildMenuItem(context, 'Volver al Inicio', '/', isLast: true),
          

        ],
      ),
    );
  }

  // Método para construir los elementos del menú con fondo azul oscuro y texto azul claro
  Widget _buildMenuItem(BuildContext context, String title, String route, {bool isLast = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 8.0), // Separación entre los elementos
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[900], // Fondo azul oscuro para el recuadro
          borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
        ),
        child: ListTile(
          title: Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 18,
              color: Colors.lightBlue[100], // Azul claro para el texto
            ),
          ),
          onTap: () {
            // Si la ruta es la principal ('/'), se regresa a la pantalla de inicio
            if (route == '/') {
              // Aquí usamos popUntil para regresar directamente a la pantalla principal
              Navigator.popUntil(context, ModalRoute.withName('/'));
            } else {
              // Navega a la página correspondiente
              Navigator.pushNamed(context, route);
            }
          },
        ),
      ),
    );
  }
}
