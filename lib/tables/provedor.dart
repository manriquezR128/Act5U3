import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProveedorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Proveedores',
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
            ProveedorFormulario(),
            ProveedorDatos(),
          ],
        ),
      ),
    );
  }
}

class ProveedorFormulario extends StatefulWidget {
  const ProveedorFormulario({Key? key}) : super(key: key);

  @override
  _ProveedorFormularioState createState() => _ProveedorFormularioState();
}

class _ProveedorFormularioState extends State<ProveedorFormulario> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idFabricanteController = TextEditingController();
  final TextEditingController _nombreFabricanteController =
      TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _piezasVendidasController =
      TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _instrumentoFabricadoController =
      TextEditingController();
  final TextEditingController _sucursalController = TextEditingController();
  final TextEditingController _idProductoController = TextEditingController();
  final TextEditingController _idCategoriaController = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      await FirebaseFirestore.instance.collection('proveedores').add({
        'id_fabricante': _idFabricanteController.text,
        'nombre_fabricante': _nombreFabricanteController.text,
        'apellido': _apellidoController.text,
        'direccion': _direccionController.text,
        'piezas_vendidas': _piezasVendidasController.text,
        'telefono': _telefonoController.text,
        'instrumento_fabricado': _instrumentoFabricadoController.text,
        'sucursal': _sucursalController.text,
        'id_producto': _idProductoController.text,
        'id_categoria': _idCategoriaController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Proveedor añadido exitosamente')),
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
              controller: _idFabricanteController,
              decoration: const InputDecoration(
                labelText: 'ID Fabricante',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el ID del fabricante';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _nombreFabricanteController,
              decoration: const InputDecoration(
                labelText: 'Nombre Fabricante',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el nombre del fabricante';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _apellidoController,
              decoration: const InputDecoration(
                labelText: 'Apellido',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el apellido';
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
              controller: _piezasVendidasController,
              decoration: const InputDecoration(
                labelText: 'Piezas Vendidas',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese las piezas vendidas';
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
              controller: _instrumentoFabricadoController,
              decoration: const InputDecoration(
                labelText: 'Instrumento Fabricado',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el instrumento fabricado';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _sucursalController,
              decoration: const InputDecoration(
                labelText: 'Sucursal',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese la sucursal';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _idProductoController,
              decoration: const InputDecoration(
                labelText: 'ID Producto',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el ID del producto';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _idCategoriaController,
              decoration: const InputDecoration(
                labelText: 'ID Categoría',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el ID de la categoría';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Añadir Proveedor'),
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

class ProveedorDatos extends StatelessWidget {
  const ProveedorDatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('proveedores').snapshots(),
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
                '${doc['nombre_fabricante']}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'ID: ${doc['id_fabricante']} - Teléfono: ${doc['telefono']}',
              ),
              trailing: Text(doc['direccion']),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            );
          },
        );
      },
    );
  }
}
