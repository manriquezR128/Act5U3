import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Productos',
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
            ProductoFormulario(),
            ProductoDatos(),
          ],
        ),
      ),
    );
  }
}

class ProductoFormulario extends StatefulWidget {
  const ProductoFormulario({Key? key}) : super(key: key);

  @override
  _ProductoFormularioState createState() => _ProductoFormularioState();
}

class _ProductoFormularioState extends State<ProductoFormulario> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idProductoController = TextEditingController();
  final TextEditingController _nombreProductoController =
      TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _dimensionController = TextEditingController();
  final TextEditingController _marcaController = TextEditingController();
  final TextEditingController _numeroSerieController = TextEditingController();
  final TextEditingController _lugarCreacionController =
      TextEditingController();
  final TextEditingController _idFabricanteController = TextEditingController();
  final TextEditingController _idCategoriaController = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      await FirebaseFirestore.instance.collection('productos').add({
        'id_producto': _idProductoController.text,
        'nombre_producto': _nombreProductoController.text,
        'descripcion': _descripcionController.text,
        'precio': _precioController.text,
        'dimension': _dimensionController.text,
        'marca': _marcaController.text,
        'numero_serie': _numeroSerieController.text,
        'lugar_creacion': _lugarCreacionController.text,
        'id_fabricante': _idFabricanteController.text,
        'id_categoria': _idCategoriaController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Producto añadido exitosamente')),
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
              controller: _nombreProductoController,
              decoration: const InputDecoration(
                labelText: 'Nombre Producto',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el nombre del producto';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _descripcionController,
              decoration: const InputDecoration(
                labelText: 'Descripción',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese la descripción';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _precioController,
              decoration: const InputDecoration(
                labelText: 'Precio',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el precio';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _dimensionController,
              decoration: const InputDecoration(
                labelText: 'Dimensión',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese la dimensión';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _marcaController,
              decoration: const InputDecoration(
                labelText: 'Marca',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese la marca';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _numeroSerieController,
              decoration: const InputDecoration(
                labelText: 'Número de Serie',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el número de serie';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _lugarCreacionController,
              decoration: const InputDecoration(
                labelText: 'Lugar de Creación',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el lugar de creación';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
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
              child: const Text('Añadir Producto'),
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

class ProductoDatos extends StatelessWidget {
  const ProductoDatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('productos').snapshots(),
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
                '${doc['nombre_producto']}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'ID: ${doc['id_producto']} - Precio: \$${doc['precio']}',
              ),
              trailing: Text(doc['marca']),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            );
          },
        );
      },
    );
  }
}
