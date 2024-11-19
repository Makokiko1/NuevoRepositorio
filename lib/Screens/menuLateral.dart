import 'package:flutter/material.dart';

class menulateral extends StatelessWidget {
  const menulateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Empresa"),
            accountEmail: Text("micorreo@gmail.com"),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://cosmere.es/wp-content/uploads/2024/09/El-Archivo-de-las-Tormentas-Viento-y-Verdad-ilustracion-para-la-portada-USA-arte-de-Michael-Whelan.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Ink(
            color: Color.fromARGB(255, 234, 128, 22),
            child: ListTile(
              title: const Text(
                "Enlace 1",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/enlace1');
              },
            ),
          ),
          ListTile(
            title: const Text("Enlace 2"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/enlace2');
            },
          ),
          ListTile(
            title: const Text("Enlace 3"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/enlace3');
            },
          ),
          ListTile(
            title: const Text("Ejercicio 2 Instagram"),
            leading: const Icon(Icons.photo_camera),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/instagram');
            },
          ),
          ListTile(
            title: const Text("Juego de Colores"), // Nueva opción
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/randomColors'); // Navegar a la página del juego
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Volver al Inicio"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
