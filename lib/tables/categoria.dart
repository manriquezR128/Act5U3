import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Categorías',
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
            CategoriaFormulario(),
            CategoriaDatos(),
          ],
        ),
      ),
    );
  }
}

class CategoriaFormulario extends StatefulWidget {
  const CategoriaFormulario({Key? key}) : super(key: key);

  @override
  _CategoriaFormularioState createState() => _CategoriaFormularioState();
}

class _CategoriaFormularioState extends State<CategoriaFormulario> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idCategoriaController = TextEditingController();
  final TextEditingController _nombreCategoriaController =
      TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _fechaCreacionController =
      TextEditingController();
  final TextEditingController _nombreProductoController =
      TextEditingController();
  final TextEditingController _costoPromedioController =
      TextEditingController();
  final TextEditingController _ejemploImagenController =
      TextEditingController();
  final TextEditingController _nombreProveedorController =
      TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      await FirebaseFirestore.instance.collection('categorias').add({
        'id_categoria': _idCategoriaController.text,
        'nombre_categoria': _nombreCategoriaController.text,
        'descripcion': _descripcionController.text,
        'fecha_creacion': _fechaCreacionController.text,
        'nombre_producto': _nombreProductoController.text,
        'costo_promedio': _costoPromedioController.text,
        'ejemplo_imagen': _ejemploImagenController.text,
        'nombre_proveedor': _nombreProveedorController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Categoría añadida exitosamente')),
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
            const SizedBox(height: 10),
            TextFormField(
              controller: _nombreCategoriaController,
              decoration: const InputDecoration(
                labelText: 'Nombre Categoría',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el nombre de la categoría';
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
              controller: _fechaCreacionController,
              decoration: const InputDecoration(
                labelText: 'Fecha de Creación',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese la fecha de creación';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _nombreProductoController,
              decoration: const InputDecoration(
                labelText: 'Nombre del Producto',
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
              controller: _costoPromedioController,
              decoration: const InputDecoration(
                labelText: 'Costo Promedio',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el costo promedio';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _ejemploImagenController,
              decoration: const InputDecoration(
                labelText: 'Ejemplo Imagen',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el ejemplo de imagen';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _nombreProveedorController,
              decoration: const InputDecoration(
                labelText: 'Nombre del Proveedor',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el nombre del proveedor';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Añadir Categoría'),
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

class CategoriaDatos extends StatelessWidget {
  const CategoriaDatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('categorias').snapshots(),
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
                '${doc['nombre_categoria']}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'ID: ${doc['id_categoria']} - Producto: ${doc['nombre_producto']}',
              ),
              trailing: Text(doc['nombre_proveedor']),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            );
          },
        );
      },
    );
  }
}
