import 'package:flutter/material.dart';

void main() {
  runApp(const MarineAquaApp());
}

class MarineAquaApp extends StatelessWidget {
  const MarineAquaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MARINE AQUA TECHNOLOGIES',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF007C91),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4FAFB),
      ),
      home: const LoginPage(),
    );
  }
}

// ---------------- LOGIN + DEMO OTP ----------------

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final mobileController = TextEditingController();
  final otpController = TextEditingController();
  bool otpMode = false;

  @override
  void dispose() {
    mobileController.dispose();
    otpController.dispose();
    super.dispose();
  }

  void sendOtp() {
    if (mobileController.text.trim().length != 10) {
      _message('Enter a valid 10-digit mobile number');
      return;
    }
    setState(() => otpMode = true);
    _message('Demo OTP screen opened');
  }

  void verifyOtp() {
    if (otpController.text.trim().length != 6) {
      _message('Enter a 6-digit OTP');
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeShell()),
    );
  }

  void _message(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
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
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Smart Aquaculture. Better Results.',
                  style: TextStyle(color: Color(0xFF607D85)),
                ),
                const SizedBox(height: 35),
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
                          style: const TextStyle(
                            color: Color(0xFF78909C),
                          ),
                        ),
                        const SizedBox(height: 22),
                        TextField(
                          controller: mobileController,
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
                          const SizedBox(height: 14),
                          TextField(
                            controller: otpController,
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
                        const SizedBox(height: 18),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: FilledButton(
                            onPressed: otpMode ? verifyOtp : sendOtp,
                            child: Text(
                              otpMode ? 'VERIFY OTP' : 'SEND OTP',
                            ),
                          ),
                        ),
                        if (otpMode)
                          Center(
                            child: TextButton(
                              onPressed: sendOtp,
                              child: const Text('Resend OTP'),
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

// ---------------- HOME SHELL ----------------

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int selectedIndex = 0;

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
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
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

// ---------------- HOME ----------------

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
                  colors: [
                    Color(0xFF005B70),
                    Color(0xFF00A6A6),
                  ],
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
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
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
                    StatItem(
                      icon: Icons.water,
                      value: '0',
                      label: 'Ponds',
                    ),
                    StatItem(
                      icon: Icons.science,
                      value: '0',
                      label: 'Tests',
                    ),
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

// ---------------- PRODUCTS ----------------

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  static const productNames = [
    'MARINE-6G',
    'MARINE WHITE SHIELD',
    'MARINE VIBRIO SHIELD',
    'MARINE PROTAB',
    'OXY TAB+',
    'MARINE VOLT-X',
    'BIO SLUDGE-X',
    'FREE MOULT',
  ];

  static const productSubtitles = [
    'Liquid Minerals',
    'Advanced Gut Health',
    'Vibrio Management',
    'Probiotic Tablet',
    'Oxygen Support',
    'Growth Booster',
    'Pond Bottom Management',
    'Moulting Support',
  ];

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Products',
      subtitle: 'Marine Aqua Technologies product range',
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: productNames.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
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
                productNames[index],
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
              subtitle: Text(productSubtitles[index]),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailsPage(
                      name: productNames[index],
                      subtitle: productSubtitles[index],
                    ),
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
  final String name;
  final String subtitle;

  const ProductDetailsPage({
    required this.name,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: name,
      subtitle: subtitle,
      child: Column(
        children: [
          Container(
            height: 210,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFE7F7F8),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Icon(
              Icons.inventory_2_outlined,
              size: 85,
              color: Color(0xFF007C91),
            ),
          ),
          const SizedBox(height: 16),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                'Product photo and detailed information will be added here.',
                style: TextStyle(height: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- PONDS ----------------

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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AddPondPage(),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('ADD NEW POND'),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- FORMS ----------------

class AddPondPage extends StatelessWidget {
  const AddPondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleFormPage(
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
}

class WaterTestPage extends StatelessWidget {
  const WaterTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleFormPage(
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
}

class PondDiaryPage extends StatelessWidget {
  const PondDiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleFormPage(
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
              onPressed: () {
                Navigator.pop(context);
              },
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
  Widget build(BuildContext context) {
    return const AppPage(
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
}

// ---------------- SUPPORT ----------------

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
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
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      title: 'Notifications',
      subtitle: 'Latest updates',
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Center(
            child: Text('No new notifications'),
          ),
        ),
      ),
    );
  }
}

// ---------------- PROFILE ----------------

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Profile',
      subtitle: 'Your Marine Aqua account',
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF005B70),
                  Color(0xFF00A6A6),
                ],
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white24,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  'Farmer Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const InfoTile(
            icon: Icons.notifications_none,
            title: 'Notifications',
            value: 'App notifications',
          ),
          const SizedBox(height: 10),
          const InfoTile(
            icon: Icons.help_outline,
            title: 'Help & Support',
            value: 'Get technical support',
          ),
          const SizedBox(height: 10),
          const InfoTile(
            icon: Icons.info_outline,
            title: 'About',
            value: 'MARINE AQUA TECHNOLOGIES',
          ),
        ],
      ),
    );
  }
}

// ---------------- SHARED UI ----------------

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

class BrandMark extends StatelessWidget {
  final double size;

  const BrandMark({
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF005B70),
            Color(0xFF00A6A6),
          ],
        ),
        borderRadius: BorderRadius.circular(size * 0.28),
      ),
      child: Icon(
        Icons.waves,
        color: Colors.white,
        size: size * 0.52,
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;

  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w800,
      ),
    );
  }
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
              Icon(
                icon,
                color: const Color(0xFF007C91),
                size: 28,
              ),
              const SizedBox(height: 9),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
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
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icon,
            color: const Color(0xFF008B91),
          ),
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
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFE7F7F8),
          child: Icon(
            icon,
            color: const Color(0xFF007C91),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        subtitle: Text(value),
      ),
    );
  }
}
