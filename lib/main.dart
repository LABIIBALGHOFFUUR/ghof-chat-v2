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
        scaffoldBackgroundColor: const Color(0xFFF7F9F8),
        appBarTheme: const AppBarTheme(
          backgroundColor: ghofGreen,
          foregroundColor: Colors.white,
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ghofGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: ghofGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: const Text('MASUK'),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Catatan: V1 belum pakai OTP. Nanti login ini kita sambungkan ke server.',
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

  @override
  Widget build(BuildContext context) {
    final tabTitle = switch (index) {
      0 => 'GHOF CHAT',
      1 => 'Status',
      2 => 'Komunitas',
      _ => 'Panggilan',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(tabTitle),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            tooltip: 'Cari',
          ),
          if (index == 0 || index == 1)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.photo_camera_outlined),
              tooltip: 'Kamera',
            ),
          PopupMenuButton<String>(
            onSelected: (_) {},
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'new_group', child: Text('Grup baru')),
              PopupMenuItem(value: 'settings', child: Text('Pengaturan')),
            ],
          ),
        ],
      ),
      body: switch (index) {
        0 => const ChatTab(),
        1 => const StatusTab(),
        2 => const CommunityTab(),
        _ => const CallsTab(),
      },
      floatingActionButton: switch (index) {
        0 => FloatingActionButton(
            backgroundColor: ghofGreen,
            foregroundColor: Colors.white,
            onPressed: () {},
            child: const Icon(Icons.chat),
          ),
        1 => FloatingActionButton(
            backgroundColor: ghofGreen,
            foregroundColor: Colors.white,
            onPressed: () {},
            child: const Icon(Icons.add_a_photo_outlined),
          ),
        _ => null,
      },
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

class ChatTab extends StatefulWidget {
  const ChatTab({super.key});

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  final searchCtrl = TextEditingController();

  final conversations = <ConversationPreview>[
    ConversationPreview(name: 'Asrama Cewek', lastMessage: 'memew: 📷 Foto', time: '20:56', unread: 25),
    ConversationPreview(name: 'dermayu_chill_24jm', lastMessage: '?: voice note 0:12', time: '19:56', unread: 81),
    ConversationPreview(name: 'KAUM REBAHAN', lastMessage: 'mizcayllaa: Grup ini...', time: '19:51', unread: 98),
    ConversationPreview(name: 'Baim vs Haters', lastMessage: '•', time: '19:36', unread: 33),
    ConversationPreview(name: 'Teman Dekat', lastMessage: 'Ok siap', time: '18:10', unread: 0),
  ];

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final q = searchCtrl.text.trim().toLowerCase();
    final filtered = conversations
        .where((c) => c.name.toLowerCase().contains(q) || c.lastMessage.toLowerCase().contains(q))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(20),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              controller: searchCtrl,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(
                hintText: 'Cari chat atau pesan',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: filtered.length,
            separatorBuilder: (context, index) => Divider(height: 1, color: Colors.black.withAlpha(18)),
            itemBuilder: (context, i) {
              final c = filtered[i];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ChatRoomScreen(title: c.name)),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: _avatarColor(c.name),
                        child: Text(
                          c.name.isNotEmpty ? c.name.trim().substring(0, 1).toUpperCase() : '?',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(c.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 4),
                            Text(
                              c.lastMessage,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.black.withAlpha(150)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(c.time, style: TextStyle(fontSize: 12, color: Colors.black.withAlpha(160))),
                          const SizedBox(height: 6),
                          if (c.unread > 0)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: ghofGreen,
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                '${c.unread}',
                                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class StatusTab extends StatelessWidget {
  const StatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Status (UI akan dibuat mirip story)',
        style: TextStyle(color: Colors.black.withAlpha(160)),
      ),
    );
  }
}

class CommunityTab extends StatelessWidget {
  const CommunityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Komunitas (UI menyusul)',
        style: TextStyle(color: Colors.black.withAlpha(160)),
      ),
    );
  }
}

class CallsTab extends StatelessWidget {
  const CallsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Panggilan (UI menyusul)',
        style: TextStyle(color: Colors.black.withAlpha(160)),
      ),
    );
  }
}

class ChatRoomScreen extends StatelessWidget {
  final String title;
  const ChatRoomScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Ruang chat "$title"\n(berikutnya: bubbles + kirim pesan)',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black.withAlpha(160)),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.attach_file),
                  color: Colors.black54,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F4F3),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Ketik pesan...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: ghofGreen,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ConversationPreview {
  final String name;
  final String lastMessage;
  final String time;
  final int unread;

  ConversationPreview({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unread,
  });
}

Color _avatarColor(String input) {
  final hash = input.codeUnits.fold<int>(0, (p, c) => p + c);
  final colors = [
    const Color(0xFF2E7D32),
    const Color(0xFF1565C0),
    const Color(0xFF6A1B9A),
    const Color(0xFF00897B),
    const Color(0xFFEF6C00),
  ];
  return colors[hash % colors.length];
}
