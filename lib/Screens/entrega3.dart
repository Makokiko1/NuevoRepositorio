import 'package:actividad1/Screens/menuLateral.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class RandomImagesPage extends StatefulWidget {
  const RandomImagesPage({super.key});

  @override
  _RandomImagesPageState createState() => _RandomImagesPageState();
}

class _RandomImagesPageState extends State<RandomImagesPage> {
  int points = 0;
  late String randomImage;
  int timeLeft = 3;  // Tiempo en segundos para cada imagen.
  bool tapped = false;  // Si se ha tocado la imagen.

  // Lista de imágenes disponibles
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

  // Inicia el temporizador
  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        // Si el tiempo se acaba sin que se haya tocado la imagen, restamos un punto
        if (!tapped) {
          points--;
        }
        // Reiniciamos el contador y cambiamos la imagen
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
      drawer: const menulateral(), // Mantenemos el drawer para navegación lateral.
      body: Stack(
        children: [
          // Puntos y tiempo restante en la parte superior
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
          
          // Imagen que aparece de forma aleatoria
          Positioned(
            top: Random().nextInt(500).toDouble(),
            left: Random().nextInt(300).toDouble(),
            child: GestureDetector(
              onTap: () {
                onImageTap();
              },
              child: Image.asset(
                randomImage,
                width: 120,
                height: 120,
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
    points++; // Sumamos un punto al tocar la imagen.
    tapped = true;  // Se ha tocado la imagen, por lo que sumamos el punto.
    
    // Reiniciamos el tiempo al tocar la imagen
    timeLeft = 3;

    // Generamos una nueva imagen
    getRandomImage();
    
    setState(() {});
  }
}
