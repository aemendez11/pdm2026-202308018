import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const kFondo = Color(0xFFFFFFFF);
const kTexto = Color(0xFF000000);
const kCeleste = Color(0xFF38B6F4);
const kNaranja = Color(0xFFFF914D);
const kVerde = Color(0xFF94B82D);
const kRojo = Color(0xFFB00000);
const kRojoCerrar = Color(0xFFFF3434);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tareas',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: kFondo,
      ),
      home: const TareasPage(),
    );
  }
}

class TareasPage extends StatelessWidget {
  const TareasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFondo,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Stack(
                alignment: .center,
                children: [
                  Align(
                    alignment: .centerLeft,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back, size: 58, color: kNaranja),
                    ),
                  ),
                  const Text(
                    'TAREAS',
                    style: TextStyle(
                      fontFamily: 'serif',
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 6,
                      color: kTexto,
                    ),
                  ),
                  Align(
                    alignment: .centerRight,
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration: const BoxDecoration(color: kRojoCerrar, shape: .circle),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.close, color: Colors.white, size: 38),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 125),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    const Text(
                      'Tareas Completas:',
                      style: TextStyle(fontSize: 27, fontStyle: FontStyle.italic, color: kTexto),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '• Farmacología',
                        style: TextStyle(fontSize: 27, fontStyle: FontStyle.italic, color: kTexto),
                      ),
                    ),
                    const SizedBox(height: 65),
                    Row(
                      crossAxisAlignment: .start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              const Text(
                                'Tareas no completas:',
                                style: TextStyle(fontSize: 27, fontStyle: FontStyle.italic, color: kTexto),
                              ),
                              const SizedBox(height: 5),
                              tareaNoCompleta('Lectura Química'),
                              tareaNoCompleta('Mapa mental'),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              const Text(
                                'Añadir Tarea:',
                                style: TextStyle(fontSize: 27, fontStyle: FontStyle.italic, color: kTexto),
                              ),
                              const SizedBox(height: 5),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.add, size: 95, color: Color(0xFF231F20)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 105,
        color: kCeleste,
        alignment: .center,
        child: const FittedBox(
          fit: .scaleDown,
          child: Text(
            '4:30:26 TE QUEDAN',
            style: TextStyle(
              fontFamily: 'serif',
              fontSize: 55,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: kTexto,
            ),
          ),
        ),
      ),
    );
  }
}

Widget tareaNoCompleta(String nombre) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, bottom: 4),
    child: Row(
      children: [
        Expanded(
          child: Text(
            '• $nombre',
            style: const TextStyle(fontSize: 27, fontStyle: FontStyle.italic, color: kTexto),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.check, size: 42, color: kVerde),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.close, size: 42, color: kRojo),
        ),
      ],
    ),
  );
}