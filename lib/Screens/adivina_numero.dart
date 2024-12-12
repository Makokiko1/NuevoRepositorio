import 'package:flutter/material.dart';
import 'dart:math';
import 'menu_lateral.dart'; // Importa el archivo del menú lateral

class AdivinaNumero extends StatelessWidget {
  const AdivinaNumero({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Elimina el MaterialApp aquí
      appBar: AppBar(
        title: const Text('Adivina el Número'),
      ),
      drawer: const MenuLateral(), // Usamos el Drawer de la clase MenuLateral
      body: const AdivinaNumeroScreen(), // Usamos AdivinaNumeroScreen aquí
    );
  }
}

class AdivinaNumeroScreen extends StatefulWidget {
  const AdivinaNumeroScreen({super.key});

  @override
  State<AdivinaNumeroScreen> createState() => _AdivinaNumeroScreenState();
}

class _AdivinaNumeroScreenState extends State<AdivinaNumeroScreen> {
  final int _numeroAleatorio = Random().nextInt(100) + 1;
  final TextEditingController _controller = TextEditingController();
  String _mensaje = 'Introduce un número del 1 al 100';

  void _verificarNumero() {
    final int? numeroIngresado = int.tryParse(_controller.text);
    if (numeroIngresado == null) {
      setState(() {
        _mensaje = 'Por favor, introduce un número válido';
      });
      return;
    }

    if (numeroIngresado < _numeroAleatorio) {
      setState(() {
        _mensaje = 'El número es mayor';
      });
    } else if (numeroIngresado > _numeroAleatorio) {
      setState(() {
        _mensaje = 'El número es menor';
      });
    } else {
      _mostrarDialogoAcierto();
    }
    _controller.clear();
  }

  void _mostrarDialogoAcierto() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¡Felicidades!'),
          content: Text('Has acertado el número $_numeroAleatorio.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _mensaje = 'Introduce un número del 1 al 100';
                });
              },
              child: const Text('Volver a intentar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _mensaje,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Número',
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.numbers),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _verificarNumero,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
            ),
            child: const Text('Verificar'),
          ),
        ],
      ),
    );
  }
}
