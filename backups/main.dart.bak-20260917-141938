import 'package:flutter/material.dart';

const ghofGreen = Color(0xFF1B7A4B);

void main() {
  runApp(const GhofChatApp());
}

class GhofChatApp extends StatelessWidget {
  const GhofChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GHOF CHAT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: ghofGreen),
        appBarTheme: const AppBarTheme(
          backgroundColor: ghofGreen,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ghofGreen,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF8F3),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.chat_bubble_rounded, size: 110, color: ghofGreen),
              const SizedBox(height: 18),
              const Text(
                'GHOF CHAT',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              Text(
                'Aplikasi Messenger Modern',
                style: TextStyle(fontSize: 16, color: Colors.black.withAlpha(153)),
              ),
              const SizedBox(height: 42),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  child: const Text('MULAI', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneCtrl = TextEditingController();
  final pinCtrl = TextEditingController();

  @override
  void dispose() {
    phoneCtrl.dispose();
    pinCtrl.dispose();
    super.dispose();
  }

  void submit() {
    final phone = phoneCtrl.text.trim();
    final pin = pinCtrl.text.trim();

    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Nomor HP wajib diisi')));
      return;
    }
    if (pin.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('PIN harus 6 digit')));
      return;
    }

    // V1: belum verifikasi server. Nanti kita sambungkan ke backend Node.js.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Masuk')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            TextField(
              controller: phoneCtrl,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Nomor HP',
                prefixText: '+62 ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: pinCtrl,
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 6,
              decoration: const InputDecoration(
                labelText: 'PIN 6 digit',
                border: OutlineInputBorder(),
                counterText: '',
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: submit,
                child: const Text('MASUK'),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Catatan: V1 belum pakai OTP, nanti login ini kita sambungkan ke server.',
              style: TextStyle(color: Colors.black.withAlpha(153), fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  static const tabs = [
    ('Chat', Icons.chat_bubble_outline),
    ('Status', Icons.timelapse),
    ('Komunitas', Icons.groups_outlined),
    ('Panggilan', Icons.call_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final title = tabs[index].$1;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          'Halaman $title (placeholder)',
          style: const TextStyle(fontSize: 16),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (v) => setState(() => index = v),
        selectedItemColor: ghofGreen,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.timelapse), label: 'Status'),
          BottomNavigationBarItem(icon: Icon(Icons.groups_outlined), label: 'Komunitas'),
          BottomNavigationBarItem(icon: Icon(Icons.call_outlined), label: 'Panggilan'),
        ],
      ),
    );
  }
}
