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
        scaffoldBackgroundColor: const Color(0xFFF4FAFB),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF007C91),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

// ---------------- LOGIN ----------------

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final mobile = TextEditingController();
  final otp = TextEditingController();
  bool otpMode = false;

  @override
  void dispose() {
    mobile.dispose();
    otp.dispose();
    super.dispose();
  }

  void sendOtp() {
    if (mobile.text.trim().length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid 10-digit mobile number')),
      );
      return;
    }
    setState(() => otpMode = true);
  }

  void verify() {
    if (otp.text.trim().length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a 6-digit OTP')),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeShell()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const BrandMark(size: 82),
                const SizedBox(height: 18),
                const Text(
                  'MARINE AQUA TECHNOLOGIES',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Smart Aquaculture. Better Results.',
                  style: TextStyle(color: Color(0xFF607D85)),
                ),
                const SizedBox(height: 30),
                Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          otpMode ? 'Verify OTP' : 'Welcome',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          otpMode
                              ? 'Enter the 6-digit OTP'
                              : 'Login with your mobile number',
                          style: const TextStyle(color: Color(0xFF78909C)),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: mobile,
                          enabled: !otpMode,
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          decoration: InputDecoration(
                            counterText: '',
                            labelText: 'Mobile Number',
                            prefixText: '+91  ',
                            prefixIcon: const Icon(Icons.phone_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        if (otpMode) ...[
                          const SizedBox(height: 12),
                          TextField(
                            controller: otp,
                            keyboardType: TextInputType.number,
                            maxLength: 6,
                            decoration: InputDecoration(
                              counterText: '',
                              labelText: 'OTP',
                              prefixIcon: const Icon(Icons.lock_outline),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ],
                        const SizedBox(height: 15),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: FilledButton(
                            onPressed: otpMode ? verify : sendOtp,
                            child: Text(otpMode ? 'VERIFY OTP' : 'SEND OTP'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- HOME ----------------

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int index = 0;

  final pages = const [
    HomePage(),
    ProductsPage(),
    PondsPage(),
    SupportPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: 'Products',
          ),
          NavigationDestination(
            icon: Icon(Icons.water_drop_outlined),
            selectedIcon: Icon(Icons.water_drop),
            label: 'Ponds',
          ),
          NavigationDestination(
            icon: Icon(Icons.support_agent_outlined),
            selectedIcon: Icon(Icons.support_agent),
            label: 'Support',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void open(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const BrandMark(size: 48),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MARINE AQUA TECHNOLOGIES',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Smart Aquaculture. Better Results.',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF607D85),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => open(context, const NotificationsPage()),
                  icon: const Icon(Icons.notifications_none_rounded),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF005B70), Color(0xFF00A6A6)],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SMART AQUACULTURE',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Better Pond.\nBetter Growth.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Manage ponds, products and support in one place.',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const SectionTitle('Quick Actions'),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.45,
              children: [
                ActionCard(
                  icon: Icons.add_business_outlined,
                  title: 'Add Pond',
                  subtitle: 'Create pond',
                  onTap: () => open(context, const AddPondPage()),
                ),
                ActionCard(
                  icon: Icons.science_outlined,
                  title: 'Water Test',
                  subtitle: 'Record water',
                  onTap: () => open(context, const WaterTestPage()),
                ),
                ActionCard(
                  icon: Icons.menu_book_outlined,
                  title: 'Pond Diary',
                  subtitle: 'Daily records',
                  onTap: () => open(context, const PondDiaryPage()),
                ),
                ActionCard(
                  icon: Icons.analytics_outlined,
                  title: 'Reports',
                  subtitle: 'View reports',
                  onTap: () => open(context, const ReportsPage()),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const SectionTitle('Pond Snapshot'),
            const SizedBox(height: 12),
            const Card(
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Row(
                  children: [
                    StatItem(icon: Icons.water, value: '0', label: 'Ponds'),
                    StatItem(icon: Icons.science, value: '0', label: 'Tests'),
                    StatItem(
                      icon: Icons.analytics_outlined,
                      value: '0',
                      label: 'Reports',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- PRODUCT DATA ----------------

class ProductData {
  final String name;
  final String subtitle;
  final String netWeight;
  final String dosage;
  final String composition;
  final String technology;
  final String use;

  const ProductData({
    required this.name,
    required this.subtitle,
    required this.netWeight,
    required this.dosage,
    required this.composition,
    required this.technology,
    required this.use,
  });
}

const products = <ProductData>[
  ProductData(
    name: 'MARINE-6G',
    subtitle: 'Liquid Minerals',
    netWeight: '5 Ltr',
    dosage: '2–3 Ltr per acre; in feed 10 ml/kg',
    composition:
        'Proprietary blend of bio-available macro minerals, chelated trace elements, stabilized ionic complexes, moulting support factors and mineral uptake enhancers.',
    technology: 'Nano Ion Matrix Technology',
    use: 'Supports mineral availability and moulting-related pond management.',
  ),
  ProductData(
    name: 'MARINE WHITE SHIELD',
    subtitle: 'Advanced Gut Health Formula',
    netWeight: '1 Ltr',
    dosage: 'Preventive: 5–10 ml/kg feed; Curative: 10 ml/kg feed',
    composition:
        'Multi-Strain Probiotic Complex, Gut Stabilizing Organic Acid Salts, Natural Phytogenic Extracts, Yeast Beta-Glucans, Digestive Enzyme Complex, Advanced Toxin Binder & Gut Protectant, Prebiotic Support (MOS & FOS), Mineral & Electro Stabilizers.',
    technology: 'Advanced Gut Health Formula',
    use: 'Formulated for gut-health support in shrimp culture.',
  ),
  ProductData(
    name: 'MARINE VIBRIO SHIELD',
    subtitle: 'Vibrio Management',
    netWeight: '1 Ltr',
    dosage: 'Preventive: 1 L/acre; Curative: 1.5 L/acre',
    composition:
        'Proprietary high-efficacy liquid formulation with controlled oxidative activators, marine-grade salts and advanced stabilizing agents.',
    technology: 'Works Inside The Vibrio Cell',
    use: 'Apply probiotics after 24 hours as stated on the product brochure.',
  ),
  ProductData(
    name: 'MARINE PROTAB',
    subtitle: 'Probiotic Tablet',
    netWeight: '500 g',
    dosage: '250–300 g/acre',
    composition:
        'Spore-Forming Marine Probiotic Blend, Nitrifying Bacteria Complex, Purple Non-Sulfur Bacteria, Lactic Acid Bacteria Shield, Yeast Culture Extract, enzyme system synbiotic & functional additives, MOS, beta glucan, seaweed polysaccharide extract, natural fermentable carbon source and mineral carrier base.',
    technology: 'M-CRT',
    use: 'Probiotic tablet for pond microbial support.',
  ),
  ProductData(
    name: 'OXY TAB+',
    subtitle: 'Oxygen Support',
    netWeight: '1 kg / 2 kg / 10 kg',
    dosage: '500 g/acre',
    composition:
        'Oxygen precursors, sodium perborate and sodium percarbonate with stabilizers.',
    technology: 'Smart Oxygen Release Technology',
    use: 'Oxygen support with the brochure stating an 8-hour release period.',
  ),
  ProductData(
    name: 'MARINE VOLT-X',
    subtitle: 'Advanced Growth Booster for Shrimp',
    netWeight: 'Not specified in brochure',
    dosage: 'Preventive: 5–10 ml/kg feed; Curative: 10 ml/kg feed',
    composition:
        'Energy Activator Complex, Stabilized Vitamin Blend, Essential Amino Acids, Hepatopancreas Support Extract, Electrolyte Balance System, Beta-Glucan Immune Support, Chelated Trace Minerals and Feed Assimilation Enhancer.',
    technology: 'Probiotics & Enzymes',
    use: 'Formulated for digestion, immunity and growth support.',
  ),
  ProductData(
    name: 'BIO SLUDGE-X',
    subtitle: 'Pond Bottom Management',
    netWeight: '500 g',
    dosage: '250–500 g/acre',
    composition:
        'High-density blend of beneficial Bacillus species, enzyme mix, Yucca extract, Thiobacillus spp, nitrifying bacteria, enzyme activation system and bottom activation carriers.',
    technology: 'BioPond Clean Technology',
    use: 'Designed for pond bottom and sludge management.',
  ),
  ProductData(
    name: 'FREE MOULT',
    subtitle: 'Moulting Support',
    netWeight: '10 kg',
    dosage: '5–10 kg/acre',
    composition:
        'Chelated minerals, moulting inducers, selenium, cobalt, iodine, enzymes and other listed formulation components.',
    technology: 'Moulting Support Formula',
    use: 'Formulated for moulting-related mineral support.',
  ),
];

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Products',
      subtitle: 'Marine Aqua Technologies product range',
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 0,
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFE7F7F8),
                child: Icon(
                  Icons.inventory_2_outlined,
                  color: Color(0xFF007C91),
                ),
              ),
              title: Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
              subtitle: Text(product.subtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailsPage(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final ProductData product;

  const ProductDetailsPage({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: product.name,
      subtitle: product.subtitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 235,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFE6F8FA), Color(0xFFF5FCFD)],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Center(
              child: Icon(
                Icons.inventory_2_outlined,
                size: 95,
                color: Color(0xFF007C91),
              ),
            ),
          ),
          const SizedBox(height: 16),
          InfoCard(
            title: 'Product Overview',
            child: Column(
              children: [
                DetailRow(label: 'Product', value: product.name),
                DetailRow(label: 'Net Weight', value: product.netWeight),
                DetailRow(label: 'Dosage', value: product.dosage),
              ],
            ),
          ),
          const SizedBox(height: 12),
          InfoCard(
            title: 'Technology',
            child: Text(
              product.technology,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFF007C91),
              ),
            ),
          ),
          const SizedBox(height: 12),
          InfoCard(
            title: 'Composition',
            child: Text(
              product.composition,
              style: const TextStyle(height: 1.55),
            ),
          ),
          const SizedBox(height: 12),
          InfoCard(
            title: 'Product Use',
            child: Text(
              product.use,
              style: const TextStyle(height: 1.55),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- OTHER SCREENS ----------------

class PondsPage extends StatelessWidget {
  const PondsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'My Ponds',
      subtitle: 'Manage your pond profiles',
      child: Column(
        children: [
          const Card(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Icon(
                    Icons.water_drop_outlined,
                    size: 55,
                    color: Color(0xFF007C91),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'No ponds added yet',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Add your first pond to start tracking pond activity.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddPondPage()),
              ),
              icon: const Icon(Icons.add),
              label: const Text('ADD NEW POND'),
            ),
          ),
        ],
      ),
    );
  }
}

class AddPondPage extends StatelessWidget {
  const AddPondPage({super.key});

  @override
  Widget build(BuildContext context) => const SimpleFormPage(
        title: 'Add New Pond',
        subtitle: 'Create your pond profile',
        fields: [
          'Pond Name',
          'Farmer Name',
          'Village / Location',
          'Pond Area (Acres)',
        ],
      );
}

class WaterTestPage extends StatelessWidget {
  const WaterTestPage({super.key});

  @override
  Widget build(BuildContext context) => const SimpleFormPage(
        title: 'Water Test',
        subtitle: 'Record water parameters',
        fields: [
          'Pond Name',
          'pH',
          'Salinity',
          'Temperature',
          'Dissolved Oxygen',
        ],
      );
}

class PondDiaryPage extends StatelessWidget {
  const PondDiaryPage({super.key});

  @override
  Widget build(BuildContext context) => const SimpleFormPage(
        title: 'Pond Diary',
        subtitle: 'Record daily pond activity',
        fields: [
          'Pond Name',
          'Date',
          'Feed Details',
          'Pond Observation',
          'Remarks',
        ],
      );
}

class SimpleFormPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> fields;

  const SimpleFormPage({
    required this.title,
    required this.subtitle,
    required this.fields,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: title,
      subtitle: subtitle,
      child: Column(
        children: [
          for (final field in fields)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TextField(
                decoration: InputDecoration(
                  labelText: field,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('SAVE'),
            ),
          ),
        ],
      ),
    );
  }
}

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) => const AppPage(
        title: 'Reports',
        subtitle: 'Pond activity summary',
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(28),
            child: Column(
              children: [
                Icon(
                  Icons.analytics_outlined,
                  size: 60,
                  color: Color(0xFF007C91),
                ),
                SizedBox(height: 12),
                Text(
                  'No reports yet',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Reports will appear after pond data is recorded.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
}

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) => const AppPage(
        title: 'Technical Support',
        subtitle: 'Connect with the Marine Aqua team',
        child: Column(
          children: [
            InfoTile(
              icon: Icons.call_outlined,
              title: 'Customer Care',
              value: '+91 93902 59830',
            ),
            SizedBox(height: 10),
            InfoTile(
              icon: Icons.email_outlined,
              title: 'Email',
              value: 'marineaquahr@gmail.com',
            ),
            SizedBox(height: 10),
            InfoTile(
              icon: Icons.location_on_outlined,
              title: 'Corporate Office',
              value: 'Madhapur, Hyderabad',
            ),
          ],
        ),
      );
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) => const AppPage(
        title: 'Notifications',
        subtitle: 'Latest updates',
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Center(child: Text('No new notifications')),
          ),
        ),
      );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => const AppPage(
        title: 'Profile',
        subtitle: 'Your Marine Aqua account',
        child: Column(
          children: [
            InfoTile(
              icon: Icons.notifications_none,
              title: 'Notifications',
              value: 'App notifications',
            ),
            SizedBox(height: 10),
            InfoTile(
              icon: Icons.help_outline,
              title: 'Help & Support',
              value: 'Get technical support',
            ),
            SizedBox(height: 10),
            InfoTile(
              icon: Icons.info_outline,
              title: 'About',
              value: 'MARINE AQUA TECHNOLOGIES',
            ),
          ],
        ),
      );
}

// ---------------- SHARED ----------------

class AppPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const AppPage({
    required this.title,
    required this.subtitle,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.maybePop(context),
                  icon: const Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Text(
                subtitle,
                style: const TextStyle(
                  color: Color(0xFF78909C),
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(height: 22),
            child,
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final Widget child;

  const InfoCard({
    required this.title,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 13),
            child,
          ],
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailRow({
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 105,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF78909C),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

class BrandMark extends StatelessWidget {
  final double size;

  const BrandMark({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF005B70), Color(0xFF00A6A6)],
        ),
        borderRadius: BorderRadius.circular(size * .28),
      ),
      child: Icon(
        Icons.waves,
        color: Colors.white,
        size: size * .52,
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;

  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
      );
}

class ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: const Color(0xFF007C91), size: 28),
              const SizedBox(height: 9),
              Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Color(0xFF78909C),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const StatItem({
    required this.icon,
    required this.value,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Expanded(
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFF008B91)),
            const SizedBox(height: 7),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF78909C),
              ),
            ),
          ],
        ),
      );
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoTile({
    required this.icon,
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Card(
        elevation: 0,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color(0xFFE7F7F8),
            child: Icon(icon, color: const Color(0xFF007C91)),
          ),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
          subtitle: Text(value),
        ),
      );
}
