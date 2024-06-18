import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Usuarios',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor:
              Colors.blue, // Color azul para la barra de navegación
          bottom: const TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(
                  text: 'Formulario',
                  icon: Icon(Icons.add, color: Colors.white)),
              Tab(text: 'Datos', icon: Icon(Icons.list, color: Colors.white)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UsuarioFormulario(),
            UsuarioDatos(),
          ],
        ),
      ),
    );
  }
}

class UsuarioFormulario extends StatefulWidget {
  const UsuarioFormulario({Key? key}) : super(key: key);

  @override
  _UsuarioFormularioState createState() => _UsuarioFormularioState();
}

class _UsuarioFormularioState extends State<UsuarioFormulario> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idUsuarioController = TextEditingController();
  final TextEditingController _nombreCompletoController =
      TextEditingController();
  final TextEditingController _numeroUsuarioController =
      TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fechaNacimientoController =
      TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  String _genero = '';

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      await FirebaseFirestore.instance.collection('usuarios').add({
        'id_usuario': _idUsuarioController.text,
        'nombre_completo': _nombreCompletoController.text,
        'numero_usuario': _numeroUsuarioController.text,
        'telefono': _telefonoController.text,
        'email': _emailController.text,
        'fecha_nacimiento': _fechaNacimientoController.text,
        'direccion': _direccionController.text,
        'genero': _genero,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario añadido exitosamente')),
      );

      _formKey.currentState?.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: _idUsuarioController,
              decoration: const InputDecoration(
                labelText: 'ID Usuario',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el ID del usuario';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _nombreCompletoController,
              decoration: const InputDecoration(
                labelText: 'Nombre Completo',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el nombre completo';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _numeroUsuarioController,
              decoration: const InputDecoration(
                labelText: 'Número de Usuario',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el número de usuario';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _telefonoController,
              decoration: const InputDecoration(
                labelText: 'Teléfono',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el teléfono';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el email';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _fechaNacimientoController,
              decoration: const InputDecoration(
                labelText: 'Fecha de Nacimiento',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese la fecha de nacimiento';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _direccionController,
              decoration: const InputDecoration(
                labelText: 'Dirección',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese la dirección';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _genero.isEmpty ? null : _genero,
              items: ['Masculino', 'Femenino', 'Otro']
                  .map((genero) => DropdownMenuItem(
                        value: genero,
                        child: Text(genero),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _genero = value ?? '';
                });
              },
              decoration: const InputDecoration(
                labelText: 'Género',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor seleccione el género';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Añadir Usuario'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Color azul para el botón
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UsuarioDatos extends StatelessWidget {
  const UsuarioDatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('usuarios').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.requireData;

        return ListView.builder(
          itemCount: data.size,
          itemBuilder: (context, index) {
            final doc = data.docs[index];
            return ListTile(
              title: Text(
                '${doc['nombre_completo']}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'ID: ${doc['id_usuario']} - Teléfono: ${doc['telefono']}',
              ),
              trailing: Text(doc['email']),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            );
          },
        );
      },
    );
  }
}
