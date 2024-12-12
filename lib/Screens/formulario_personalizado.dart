import 'package:flutter/material.dart';
import 'menu_lateral.dart';

class FormularioPersonalizado extends StatefulWidget {
  const FormularioPersonalizado({super.key});

  @override
  _FormularioPersonalizadoState createState() => _FormularioPersonalizadoState();
}

class _FormularioPersonalizadoState extends State<FormularioPersonalizado> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String? _selectedOption;

  // Método para seleccionar una fecha
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario Personalizado'),
      ),
      drawer: const MenuLateral(),  // Aquí usamos el MenuLateral
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Campo de texto: Nombre
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nombre completo',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'Introduce tu nombre',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Campo de texto: Email
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'Introduce tu correo electrónico',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu correo electrónico';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Introduce un correo válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Campo de texto: Teléfono
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.phone),
                  hintText: 'Introduce tu teléfono',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu número de teléfono';
                  }
                  if (!RegExp(r'^\d{9}$').hasMatch(value)) {
                    return 'Introduce un número de 10 dígitos';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Campo de selección: Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Selecciona una opción',
                  border: const OutlineInputBorder(),
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                value: _selectedOption,
                items: ['Opción 1', 'Opción 2', 'Opción 3']
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor selecciona una opción';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Campo de selección: Fecha
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Fecha de nacimiento',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.calendar_today),
                  hintText: 'Selecciona tu fecha de nacimiento',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                readOnly: true,
                onTap: () => _selectDate(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor selecciona una fecha';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Botón de envío
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Enviando datos...')),
                    );
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
