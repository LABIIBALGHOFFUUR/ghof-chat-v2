import 'package:flutter/material.dart';
import '../brand.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setelan', style: TextStyle(fontWeight: FontWeight.w900)),
        backgroundColor: kBrandGreen,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: kBrandGreen,
              child: Text('G', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
            ),
            title: const Text('Ghof User', style: TextStyle(fontWeight: FontWeight.w900)),
            subtitle: Text('Status: Online', style: TextStyle(color: Colors.black.withAlpha(160))),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.key_outlined),
            title: Text('Akun'),
            subtitle: Text('Privasi, keamanan, ganti PIN (nanti)'),
          ),
          const ListTile(
            leading: Icon(Icons.chat_outlined),
            title: Text('Chat'),
            subtitle: Text('Tema, wallpaper, backup (nanti)'),
          ),
          const ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text('Notifikasi'),
            subtitle: Text('Nada, getar (nanti)'),
          ),
          const ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('Bantuan'),
            subtitle: Text('FAQ (nanti)'),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
