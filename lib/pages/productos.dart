import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const ProductoPage());
}

class ProductoPage extends StatelessWidget {
  const ProductoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaginaProductos(),
    );
  }
}

class PaginaProductos extends StatelessWidget {
  PaginaProductos({Key? key}) : super(key: key);

  final List<String> imagenes = [
    'https://raw.githubusercontent.com/manriquezR128/img_ios/main/imag_2.jpg', // URL de imagen del producto 1
    'https://raw.githubusercontent.com/manriquezR128/img_ios/main/images.jpg', // URL de imagen del producto 2
    'https://raw.githubusercontent.com/manriquezR128/img_ios/main/images.png', // URL de imagen del producto 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        centerTitle: true,
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 400.0, // Altura del carrusel
            enlargeCenterPage: true, // Amplía la página central del carrusel
            autoPlay: true, // Reproducción automática del carrusel
            aspectRatio: 16 / 9, // Proporción de aspecto de las imágenes
            autoPlayCurve: Curves.fastOutSlowIn, // Curva de animación
            enableInfiniteScroll: true, // Habilita el desplazamiento infinito
            autoPlayInterval: Duration(
                seconds: 3), // Intervalo de tiempo para cambiar de imagen
            autoPlayAnimationDuration:
                Duration(milliseconds: 800), // Duración de la animación
            viewportFraction: 0.8, // Porción visible de cada imagen
          ),
          items: imagenes.map((imagenUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Image.network(
                    imagenUrl,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
