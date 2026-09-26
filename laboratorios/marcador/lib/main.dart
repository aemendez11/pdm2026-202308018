import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const kFondo = Color(0xFFF5F5F5);
const kSuperficie = Colors.white;
const kBorde = Color(0xFFDADADA);
const kTexto = Color(0xFF202020);
const kMuted = Color(0xFF777777);
const kVerde = Color(0xFFE8F5E9);
const kVerdeBorde = Color(0xFF4CAF50);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laliga',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: kFondo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kVerdeBorde,
          brightness: Brightness.light,
        ),
      ),
      home: const MarcadorPage(),
    );
  }
}

class MarcadorPage extends StatefulWidget {
  const MarcadorPage({super.key});

  @override
  State<MarcadorPage> createState() => _MarcadorPageState();
}

class _MarcadorPageState extends State<MarcadorPage> {
  int puntosMadrid = 0;
  int puntosBarcelona = 0;

  void sumarMadrid() {
    setState(() {
      puntosMadrid++;
    });
  }

  void restarMadrid() {
    if (puntosMadrid > 0) {
      setState(() {
        puntosMadrid--;
      });
    }
  }

  void sumarBarcelona() {
    setState(() {
      puntosBarcelona++;
    });
  }

  void restarBarcelona() {
    if (puntosBarcelona > 0) {
      setState(() {
        puntosBarcelona--;
      });
    }
  }

  void reiniciar() {
    setState(() {
      puntosMadrid = 0;
      puntosBarcelona = 0;
    });
  }

  String obtenerResultado() {
    if (puntosMadrid > puntosBarcelona) {
      return 'Va ganando Real Madrid';
    }

    if (puntosBarcelona > puntosMadrid) {
      return 'Va ganando Barcelona';
    }

    return 'Empate';
  }

  Color colorMadrid() {
    return puntosMadrid > puntosBarcelona ? kVerde : kSuperficie;
  }

  Color colorBarcelona() {
    return puntosBarcelona > puntosMadrid ? kVerde : kSuperficie;
  }

  Color bordeMadrid() {
    return puntosMadrid > puntosBarcelona ? kVerdeBorde : kBorde;
  }

  Color bordeBarcelona() {
    return puntosBarcelona > puntosMadrid ? kVerdeBorde : kBorde;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFondo,
      appBar: AppBar(
        title: const Text(
          'LaLiga',
          style: TextStyle(
            color: kTexto,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'EL CLÁSICO',
              style: TextStyle(
                fontSize: 14,
                color: kMuted,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: colorMadrid(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: bordeMadrid(),
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Image.network(
                            'https://1000logos.net/wp-content/uploads/2020/09/Real-Madrid-logo.png',
                            width: 80,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Real Madrid',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kTexto,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            '$puntosMadrid',
                            style: const TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              color: kTexto,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: restarMadrid,
                                child: const Text(
                                  '-1',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: sumarMadrid,
                                child: const Text(
                                  '+1',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Card(
                    color: colorBarcelona(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: bordeBarcelona(),
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Image.network(
                            'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/83.png&h=200&w=200',
                            width: 80,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Barcelona',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kTexto,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            '$puntosBarcelona',
                            style: const TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              color: kTexto,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: restarBarcelona,
                                child: const Text(
                                  '-1',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: sumarBarcelona,
                                child: const Text(
                                  '+1',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              obtenerResultado(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kTexto,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: reiniciar,
                icon: const Icon(Icons.refresh),
                label: const Text(
                  'Reiniciar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}