import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VentasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ventas',
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
            VentasFormulario(),
            VentasDatos(),
          ],
        ),
      ),
    );
  }
}

class VentasFormulario extends StatefulWidget {
  const VentasFormulario({Key? key}) : super(key: key);

  @override
  _VentasFormularioState createState() => _VentasFormularioState();
}

class _VentasFormularioState extends State<VentasFormulario> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idVentasController = TextEditingController();
  final TextEditingController _folioController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _nombreCompletoController =
      TextEditingController();
  final TextEditingController _paisController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();
  final TextEditingController _ciudadController = TextEditingController();
  final TextEditingController _codigoPostalController = TextEditingController();
  String _idProducto = '';
  String _idUsuario = '';

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      await FirebaseFirestore.instance.collection('ventas').add({
        'id_ventas': _idVentasController.text,
        'folio': _folioController.text,
        'direccion': _direccionController.text,
        'nombre_completo': _nombreCompletoController.text,
        'pais': _paisController.text,
        'estado': _estadoController.text,
        'ciudad': _ciudadController.text,
        'codigo_postal': _codigoPostalController.text,
        'id_producto': _idProducto,
        'id_usuario': _idUsuario,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Venta añadida exitosamente')),
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
              controller: _idVentasController,
              decoration: const InputDecoration(
                labelText: 'ID Ventas',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el ID de ventas';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _folioController,
              decoration: const InputDecoration(
                labelText: 'Folio',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el folio';
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
              controller: _paisController,
              decoration: const InputDecoration(
                labelText: 'País',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el país';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _estadoController,
              decoration: const InputDecoration(
                labelText: 'Estado',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el estado';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _ciudadController,
              decoration: const InputDecoration(
                labelText: 'Ciudad',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese la ciudad';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _codigoPostalController,
              decoration: const InputDecoration(
                labelText: 'Código Postal',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el código postal';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _idProducto.isEmpty ? null : _idProducto,
              items: [
                'Producto A',
                'Producto B',
                'Producto C'
              ] // Lista de productos disponibles
                  .map((producto) => DropdownMenuItem(
                        value: producto,
                        child: Text(producto),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _idProducto = value ?? '';
                });
              },
              decoration: const InputDecoration(
                labelText: 'ID Producto',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor seleccione el ID de producto';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _idUsuario.isEmpty ? null : _idUsuario,
              items: [
                'Usuario 1',
                'Usuario 2',
                'Usuario 3'
              ] // Lista de usuarios disponibles
                  .map((usuario) => DropdownMenuItem(
                        value: usuario,
                        child: Text(usuario),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _idUsuario = value ?? '';
                });
              },
              decoration: const InputDecoration(
                labelText: 'ID Usuario',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor seleccione el ID de usuario';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Añadir Venta'),
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

class VentasDatos extends StatelessWidget {
  const VentasDatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('ventas').snapshots(),
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
                'Folio: ${doc['folio']}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Nombre: ${doc['nombre_completo']} - País: ${doc['pais']}',
              ),
              trailing: Text('ID Venta: ${doc['id_ventas']}'),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            );
          },
        );
      },
    );
  }
}
