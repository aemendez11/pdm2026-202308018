import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.brown,
      ),
      home: const MyHomePage(title: 'Mi pedido'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final nombres = [
    'Café',
    'Sándwich',
    'Jugo',
  ];

  final precios = [
    10.00,
    25.00,
    12.00,
  ];

  final cantidades = [
    0,
    0,
    0,
  ];

  void cambiarCantidad(int producto, int cambio) {
    final nuevaCantidad = cantidades[producto] + cambio;

    if (nuevaCantidad < 0) return;

    setState(() {
      cantidades[producto] = nuevaCantidad;
    });
  }

  void vaciarPedido() {
    setState(() {
      cantidades[0] = 0;
      cantidades[1] = 0;
      cantidades[2] = 0;
    });
  }

  double calcularTotal() {
    double total = 0;

    for (int i = 0; i < nombres.length; i++) {
      total += precios[i] * cantidades[i];
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    final total = calcularTotal();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    for (int i = 0; i < nombres.length; i++)
                      ProductoPedido(
                        nombre: nombres[i],
                        precio: precios[i],
                        cantidad: cantidades[i],
                        onCambiar: (cambio) =>
                            cambiarCantidad(i, cambio),
                      ),
                  ],
                ),
              ),

              const Divider(),

              Text(
                'Total: Q${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: vaciarPedido,
                  child: const Text('Vaciar pedido'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductoPedido extends StatelessWidget {
  final String nombre;
  final double precio;
  final int cantidad;

  final void Function(int) onCambiar;

  const ProductoPedido({
    super.key,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.onCambiar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nombre,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Q${precio.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => onCambiar(-1),
                    child: const Text('-1'),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Text(
                      '$cantidad',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () => onCambiar(1),
                    child: const Text('+1'),
                  ),
                ],
              ),
            ],
          ),
        ),

        const Divider(),
      ],
    );
  }
}