import 'package:flutter/material.dart';

void main() {
  runApp(const Perfilpage());
}

class Perfilpage extends StatelessWidget {
  const Perfilpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil de Usuario',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaginaPerfil(),
    );
  }
}

class PaginaPerfil extends StatelessWidget {
  final String _email =
      'usuario@example.com'; // Cambiar por el correo real del usuario
  final String _imagenUrl =
      'https://via.placeholder.com/150'; // URL de la imagen de perfil

  const PaginaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(_imagenUrl),
            ),
            const SizedBox(height: 20),
            Text(
              'Correo electrónico:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              _email,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
