import 'menuLateral.dart';
import 'package:flutter/material.dart';




class Instagram extends StatelessWidget {
  const Instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'robert96',
          style: TextStyle(fontSize: 30),
        ),
      ),
      drawer: const menulateral(),
      body: const ProfileScreen(),
    );
  }
}


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0; 
  bool _showPosts = true; 

  // Lista de imágenes que se mostrarán en la cuadrícula
  final List<String> images = [
    'assets/images/deporte.jpg',
    'assets/images/Colegas.jpg',
    'assets/images/Vecinos.jpg',
    'assets/images/yo.jpg',
    'assets/images/descarga.jpg',
    'assets/images/deporte.jpg',
    'assets/images/Colegas.jpg',
    'assets/images/Vecinos.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Parte superior con la imagen de perfil y la información del usuario
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Imagen de perfil circular
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'assets/images/descarga.jpg',
                    ),
                  ),
                  // Información del usuario en una sola línea
                  Row(
                    children: [
                      // Publicaciones
                      Column(
                        children: [
                          Text(
                            '8',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 4), 
                          Text(
                            'Posts',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(width: 20), 
                      // Seguidores
                      Column(
                        children: [
                          Text(
                            '517',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Followers',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      // Seguidos
                      Column(
                        children: [
                          Text(
                            '1502',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Following',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 2), 
              const Row(
                children: [
                  Text('Roberto Alonso'),
                ],
              ),
              const SizedBox(height: 4), 
              const Row(
                children: [
                  Text('Vamos no me jodas'),
                ],
              ),
              const SizedBox(height: 20),
              // Botón "Editar perfil"
              TextButton(
                onPressed: () {
                  // Acción del botón (vacío por ahora)
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(77, 81, 81, 81), 
                  foregroundColor: Colors.black, 
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                ),
                child: const Text(
                  'Editar perfil',
                  style: TextStyle(fontSize: 18), 
                ),
              ),
              const SizedBox(height: 20), 
              // Fila de imágenes circulares (Historias)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                      ),
                      SizedBox(height: 8), 
                      Text('Nueva'), 
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/deporte.jpg'),
                      ),
                      SizedBox(height: 8),
                      Text('Deporte'), 
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/Colegas.jpg'),
                      ),
                      SizedBox(height: 8),
                      Text('Sabios'), 
                                          ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/Vecinos.jpg'),
                      ),
                      SizedBox(height: 8), 
                      Text('Vecinos'), 
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/yo.jpg'),
                      ),
                      SizedBox(height: 8), 
                      Text('Yo'), 
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20), 
              // Línea gris debajo de las historias
              const Divider(
                color: Colors.grey, 
                thickness: 1.0, 
              ),
            ],
          ),
        ),
        // Fila con los iconos de cuadrícula y mención
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.grid_on,
                      size: 30,
                      color: _selectedIndex == 0 ? Colors.black : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0; 
                        _showPosts = true;
                      });
                    },
                  ),
                  // Barra negra debajo del icono seleccionado
                  if (_selectedIndex == 0)
                    Container(
                      height: 2,
                      color: Colors.black,
                    ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.alternate_email,
                      size: 30,
                      color: _selectedIndex == 1 ? Colors.black : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1; 
                        _showPosts = false; 
                      });
                    },
                  ),
                  // Barra negra debajo del icono seleccionado
                  if (_selectedIndex == 1)
                    Container(
                      height: 2,
                      color: Colors.black,
                    ),
                ],
              ),
            ),
          ],
        ),
        // Cuadrícula de imágenes (controlando la visibilidad)
        Expanded(
          child: _showPosts 
              ? GridView.builder(
                  padding: EdgeInsets.zero, 
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, 
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0, 
                    childAspectRatio: 1,
                                      ),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    );
                  },
                )
              : Container(), 
        ),
      ],
    );
  }
}
