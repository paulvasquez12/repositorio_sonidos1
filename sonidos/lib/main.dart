import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const AnimalSoundsApp());
}

class AnimalSoundsApp extends StatelessWidget {
  const AnimalSoundsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:
          false, // Quita la pestaña "debug" de la esquina
      home: AnimalSoundsHomePage(),
    );
  }
}

class AnimalSoundsHomePage extends StatefulWidget {
  const AnimalSoundsHomePage({super.key});

  @override
  State<AnimalSoundsHomePage> createState() => _AnimalSoundsHomePageState();
}

class _AnimalSoundsHomePageState extends State<AnimalSoundsHomePage> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Lista con los nombres exactos de tus archivos .mp3
  final List<Map<String, dynamic>> _animals = [
    {
      'name': 'Perro',
      'bgColor': const Color(0xFFF7CCB8),
      'textColor': const Color(0xFF83381B),
      'sound': 'perro.mp3',
    },
    {
      'name': 'Gato',
      'bgColor': const Color(0xFFD3CFF8),
      'textColor': const Color(0xFF32297D),
      'sound': 'gato.mp3',
    },
    {
      'name': 'Vaca',
      'bgColor': const Color(0xFFBDDAF7),
      'textColor': const Color(0xFF1D4773),
      'sound': 'vaca.mp3',
    },
    {
      'name': 'Caballo',
      'bgColor': const Color(0xFFFCD082),
      'textColor': const Color(0xFF704E13),
      'sound': 'caballo.mp3',
    },
    {
      'name': 'Cabra', // Cambiado por tus audios reales
      'bgColor': const Color(0xFFDBDBD3),
      'textColor': const Color(0xFF3F423C),
      'sound': 'cabra.mp3',
    },
    {
      'name': 'Gallo',
      'bgColor': const Color(0xFFF9C7CB),
      'textColor': const Color(0xFF82272E),
      'sound': 'gallo.mp3',
    },
    {
      'name': 'Pato',
      'bgColor': const Color(0xFFA5E6D4),
      'textColor': const Color(0xFF185746),
      'sound': 'pato.mp3',
    },
    {
      'name': 'Cerdo',
      'bgColor': const Color(0xFFF9C1D1),
      'textColor': const Color(0xFF85213D),
      'sound': 'cerdo.mp3',
    },
    {
      'name': 'León',
      'bgColor': const Color(0xFFCBE39C),
      'textColor': const Color(0xFF435C14),
      'sound': 'leon.mp3',
    },
  ];

  @override
  void dispose() {
    _audioPlayer
        .dispose(); // Libera la memoria del reproductor al cerrar la app
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Sonidos de Animales',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(
          0xFF0F7254,
        ), // Color verde oscuro de tu diseño
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: _animals.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 columnas fijas
            crossAxisSpacing: 15, // Espacio entre columnas
            mainAxisSpacing: 40, // Espacio entre filas
            childAspectRatio: 0.9, // Proporción de tamaño vertical/horizontal
          ),
          itemBuilder: (context, index) {
            final animal = _animals[index];

            return GestureDetector(
              onTap: () async {
                try {
                  // Detiene cualquier sonido que se esté reproduciendo antes de iniciar el siguiente
                  await _audioPlayer.stop();
                  await _audioPlayer.play(AssetSource(animal['sound']));
                } catch (e) {
                  print("Error al reproducir el sonido: $e");
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: animal['bgColor'],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.volume_up_outlined,
                      size: 36,
                      color: animal['textColor'],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      animal['name'],
                      style: TextStyle(
                        color: animal['textColor'],
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
