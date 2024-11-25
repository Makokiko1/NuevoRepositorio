import 'package:actividad1/Screens/menu_lateral.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class RandomImagesPage extends StatefulWidget {
  const RandomImagesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RandomImagesPageState createState() => _RandomImagesPageState();
}

class _RandomImagesPageState extends State<RandomImagesPage> {
  int points = 0;
  late String randomImage;
  int timeLeft = 3;
  bool tapped = false;

  var images = [
    'assets/images/_f9a9646a-ecac-4b6e-8617-851a0950b0a4.jpg',
    'assets/images/_1afdc249-79e5-4422-b32f-5048a58f507c.jpg',
    'assets/images/_1b6844bb-8177-43c0-8a36-44e8ab5512ac.jpg',
    'assets/images/descarga.jpg',
    'assets/images/deporte.jpg',
    'assets/images/Colegas.jpg',
    'assets/images/Vecinos.jpg',
    'assets/images/yo.jpg',
  ];

  @override
  void initState() {
    super.initState();
    getRandomImage();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return; // Verifica si el widget sigue montado

      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        if (!tapped) {
          points--;
        }
        tapped = false;
        timeLeft = 3;
        getRandomImage();
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Juego de Imágenes"),
      ),
      drawer: const MenuLateral(),
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 20,
            child: Text(
              'Puntos: $points',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              'Tiempo restante: $timeLeft s',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          // Recuadro invisible para las imágenes
          Positioned(
            top: 120,  // Justo debajo del texto "Tiempo restante"
            left: 20,
            right: 20,
            child: Container(
              width: double.infinity,
              height: 250,  // Espacio suficiente para que la imagen no se solape
              color: Colors.transparent,  // Hacemos el contenedor invisible
              child: Stack(
                children: [
                  Positioned(
                    top: Random().nextInt(150).toDouble(),
                    left: Random().nextInt(300).toDouble(),
                    child: GestureDetector(
                      onTap: () {
                        onImageTap();
                      },
                      child: Image.asset(
                        randomImage,
                        width: 120,
                        height: 120,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image, size: 120);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getRandomImage() {
    Random random = Random();
    int randomIndex = random.nextInt(images.length);
    randomImage = images[randomIndex];
  }

  void onImageTap() {
    setState(() {
      points++;
      tapped = true;
      timeLeft = 3;
      getRandomImage();
    });

    // Mostrar el mensaje de éxito con SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('¡Muy bien +1 punto!'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
