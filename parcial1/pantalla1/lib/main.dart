import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const kFondo = Color(0xFFF2F4F4);
const kSuperficie = Colors.white;
const kTexto = Color(0xFF1C1C1C);
const kMuted = Color(0xFF777777);
const kLima = Color(0xFFC8F54E);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neobank',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: kFondo,
      ),
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                color: kFondo,
                elevation: 0,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'Good morning, Terry',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kTexto),
                  ),
                  subtitle: const Text(
                    'Welcome to Neobank',
                    style: TextStyle(fontSize: 14, color: kMuted),
                  ),
                  trailing: const Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.notifications_none, color: kTexto),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              heroCard('Your balance', '\$3,200.00'),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your cards',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: kTexto),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, color: kTexto, size: 20),
                    label: const Text('New card', style: TextStyle(color: kTexto)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [bankCard(), const SizedBox(width: 12), bankCard()],
                ),
              ),
              const SizedBox(height: 18),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(
                              'Transactions',
                              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: kTexto),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('See all', style: TextStyle(fontSize: 13, color: kTexto)),
                          ),
                        ],
                      ),
                      detailListTile(Icons.coffee, 'Starbucks Coffee', 'October 17, 09:00 PM', '-\$44.80', extraAmount: '+\$1.65'),
                      detailListTile(Icons.shopping_bag, 'Amazon', 'October 16, 02:00 PM', '-\$120.00', extraAmount: '+\$5.00'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: kTexto,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
            BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: 'Transfer'),
            BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Settings'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

Widget heroCard(String title, String content) {
  return Card(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 14, color: kMuted)),
          Row(
            children: [
              Text(content, style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: kTexto)),
              const Spacer(),
              const Icon(Icons.visibility_off_outlined, color: kTexto),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: kTexto, foregroundColor: Colors.white),
              child: const Text('Add money', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget bankCard() {
  return Container(
    width: 255,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: kLima, borderRadius: BorderRadius.circular(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('N.', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: kTexto)),
        const Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Debit Card', style: TextStyle(fontSize: 13, color: kMuted)),
                SizedBox(height: 4),
                Text('•••• 4568', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: kTexto)),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.visibility_outlined, size: 18, color: kTexto),
                  SizedBox(width: 6),
                  Text('Details', style: TextStyle(fontSize: 13, color: kTexto)),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget detailListTile(IconData icon, String title, String subtitle, String amount, {String? extraAmount}) {
  return ListTile(
    leading: Card(child: Padding(padding: const EdgeInsets.all(8), child: Icon(icon, color: kTexto))),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: kTexto)),
    subtitle: Text(subtitle, style: const TextStyle(fontSize: 12, color: kMuted)),
    trailing: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, color: kTexto, fontSize: 13)),
        const SizedBox(height: 2),
        if (extraAmount != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(color: kLima, borderRadius: BorderRadius.circular(20)),
            child: Text(extraAmount, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black)),
          ),
      ],
    ),
  );
}