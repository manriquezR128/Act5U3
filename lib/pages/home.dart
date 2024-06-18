import 'package:flutter/material.dart';
import 'package:manriquez0376/main.dart';
import 'package:manriquez0376/tables/productos.dart';
// ignore: unused_import
import 'package:manriquez0376/tables/categoria.dart';
// ignore: unused_import
import 'package:manriquez0376/tables/provedor.dart';
// ignore: unused_import
import 'package:manriquez0376/tables/usuario.dart';
import 'package:manriquez0376/tables/ventas.dart';
import 'perfil.dart';
import 'contacto.dart';
import 'productos.dart';

class PaginaInicio extends StatelessWidget {
  final String _email;

  const PaginaInicio(this._email, {super.key});

  void _cerrarSesion(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PaginaSesion()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Abarrotes',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontSize: 22,
            ),
          ),
          backgroundColor: const Color(0xff0d00bf),
          elevation: 8,
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color(0xff1100fc),
                ),
                child: const Text(
                  'Menú',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: const Text('Inicio'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaginaInicio(_email)),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.production_quantity_limits),
                title: const Text('Productos'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductosPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: const Text('Proveedor'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProveedorPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.receipt_long),
                title: const Text('Usuario'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UsuarioPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('Ventas'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VentasPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.list_alt),
                title: const Text('Categoria'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CategoriasPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text('Cerrar sesión'),
                onTap: () {
                  _cerrarSesion(context);
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      '¡Bienvenido a los abarrotes manriquez!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff13007f),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const SizedBox(height: 20.0),
                  Text(
                    'Correo electrónico: $_email',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            ProductoPage(),
            Perfilpage(),
            ContactoPage(),
          ],
        ),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.home, color: Color(0xff666666)),
              text: 'Inicio',
            ),
            Tab(
              icon: Icon(Icons.production_quantity_limits,
                  color: Color(0xff6d6d6d)),
              text: 'Prod',
            ),
            Tab(
              icon: Icon(Icons.person, color: Color(0xff5f5f5f)),
              text: 'Perfil',
            ),
            Tab(
              icon: Icon(Icons.contact_mail, color: Color(0xff7f7f7f)),
              text: 'Cont',
            ),
          ],
          labelColor: Color(0xff878787),
          unselectedLabelColor: Color(0xff5c5c5c),
          indicatorColor: Color(0xff7a7a7a),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 8.0),
        ),
      ),
    );
  }
}
