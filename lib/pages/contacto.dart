import 'package:flutter/material.dart';

void main() {
  runApp(const ContactoPage());
}

class ContactoPage extends StatelessWidget {
  const ContactoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaginaContacto(),
    );
  }
}

class PaginaContacto extends StatelessWidget {
  const PaginaContacto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacto'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Números de contacto:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              '+1234567890',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '+1987654321',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
