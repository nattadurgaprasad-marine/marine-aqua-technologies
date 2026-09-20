
import 'package:flutter/material.dart';

void main() => runApp(const MarineAquaApp());

class MarineAquaApp extends StatelessWidget {
  const MarineAquaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MARINE AQUA TECHNOLOGIES',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF3FBFD),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF078FA3),
          brightness: Brightness.light,
        ),
        fontFamily: 'Arial',
      ),
      home: const ProductsPage(),
    );
  }
}

class Product {
  final String name;
  final String subtitle;
  final String weight;
  final String dosage;
  final String technology;
  final String? image;

  const Product({
    required this.name,
    required this.subtitle,
    required this.weight,
    required this.dosage,
    required this.technology,
    this.image,
  });
}

const products = [
  Product(
    name: 'MARINE-6G',
    subtitle: 'Liquid Minerals',
    weight: '5 Ltr',
    dosage: '2–3 Ltr per acre • 10 ml/kg feed',
    technology: 'Nano Ion Technology',
    image: 'assets/marine_6g.png',
  ),
  Product(
    name: 'MARINE WHITE SHIELD',
    subtitle: 'Advanced Gut Health',
    weight: '1 Ltr',
    dosage: '5–10 ml/kg feed',
    technology: 'Advanced Gut Health Formula',
  ),
  Product(
    name: 'MARINE VIBRIO SHIELD',
    subtitle: 'Vibrio Management',
    weight: '1 Ltr',
    dosage: '1 L/acre preventive • 1.5 L/acre curative',
    technology: 'Works Inside The Vibrio Cell',
  ),
  Product(
    name: 'MARINE PROTAB',
    subtitle: 'Probiotic Tablet',
    weight: '500 g',
    dosage: '250–300 g/acre',
    technology: 'M-CRT',
  ),
  Product(
    name: 'OXY TAB+',
    subtitle: 'Oxygen Support',
    weight: '1 kg / 2 kg / 10 kg',
    dosage: '500 g/acre',
    technology: 'Smart Oxygen Release Technology',
  ),
  Product(
    name: 'MARINE VOLT-X',
    subtitle: 'Advanced Growth Booster',
    weight: '—',
    dosage: '5–10 ml/kg feed preventive',
    technology: 'Feed Assimilation Support',
  ),
  Product(
    name: 'BIO SLUDGE-X',
    subtitle: 'Pond Bottom Management',
    weight: '500 g',
    dosage: '250–500 g/acre',
    technology: 'BioPond Clean Technology',
  ),
  Product(
    name: 'FREE MOULT',
    subtitle: 'Moulting & Mineral Support',
    weight: '10 kg',
    dosage: '5–10 kg/acre',
    technology: 'Chelated Mineral Support',
  ),
];

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Products', style: TextStyle(fontWeight: FontWeight.w800)),
            Text(
              'Marine Aqua Technologies product range',
              style: TextStyle(fontSize: 13, color: Color(0xFF66828B)),
            ),
          ],
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(18, 12, 18, 30),
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final p = products[index];
          return Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(22),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProductDetailPage(product: p)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0F7FA),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: const Icon(
                        Icons.inventory_2_outlined,
                        color: Color(0xFF078FA3),
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(p.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              )),
                          const SizedBox(height: 5),
                          Text(p.subtitle,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFF66828B),
                              )),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, size: 30),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(product.name,
            style: const TextStyle(fontWeight: FontWeight.w800)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 35),
        children: [
          if (product.image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                product.image!,
                height: 285,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )
          else
            Container(
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  colors: [Color(0xFFDDF8FC), Color(0xFFEFFFFB)],
                ),
              ),
              child: const Icon(
                Icons.inventory_2_outlined,
                color: Color(0xFF078FA3),
                size: 85,
              ),
            ),
          const SizedBox(height: 18),
          Text(product.name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Color(0xFF123D63),
              )),
          const SizedBox(height: 4),
          Text(product.subtitle,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF4E7887),
              )),
          const SizedBox(height: 18),
          _card(
            title: 'Product Overview',
            icon: Icons.description_outlined,
            child: Column(
              children: [
                _row('Product', product.name),
                _row('Net Weight', product.weight),
                _row('Dosage', product.dosage),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _card(
            title: 'Technology',
            icon: Icons.settings_outlined,
            child: Text(
              product.technology,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: Color(0xFF078FA3),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _card(
            title: 'Key Benefits',
            icon: Icons.verified_outlined,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Bullet('Supports pond and shrimp management'),
                _Bullet('Designed for aquaculture applications'),
                _Bullet('Use according to product dosage'),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _card(
            title: 'How to Use',
            icon: Icons.menu_book_outlined,
            child: Text(
              'Follow the product dosage and application instructions for the selected product.',
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
          const SizedBox(height: 22),
          const Center(
            child: Text(
              'MARINE AQUA TECHNOLOGIES\nSmart Aquaculture. Better Results.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF176A82),
                fontWeight: FontWeight.w700,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _card({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFD7EEF2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF078FA3)),
              const SizedBox(width: 10),
              Text(title,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF123D63),
                  )),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 105,
            child: Text(label,
                style: const TextStyle(
                  color: Color(0xFF66828B),
                  fontWeight: FontWeight.w600,
                )),
          ),
          Expanded(
            child: Text(value,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                )),
          ),
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  const _Bullet(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, size: 19, color: Color(0xFF13A66B)),
          const SizedBox(width: 9),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
