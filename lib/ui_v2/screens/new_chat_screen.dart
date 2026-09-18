import 'package:flutter/material.dart';
import '../brand.dart';
import '../../main.dart' show ChatRoomScreen;

class NewChatScreen extends StatelessWidget {
  const NewChatScreen({super.key});

  static const _contacts = <Map<String, dynamic>>[
    {'name': 'Adit', 'color': Colors.blue},
    {'name': 'Rina', 'color': Colors.pink},
    {'name': 'Fahri', 'color': Colors.orange},
    {'name': 'Dimas', 'color': Colors.green},
    {'name': 'Salsa', 'color': Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Baru', style: TextStyle(fontWeight: FontWeight.w900)),
        backgroundColor: kBrandGreen,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        itemCount: _contacts.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final c = _contacts[index];
          final name = c['name'] as String;
          final color = c['color'] as Color;
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: color,
              child: Text(name[0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
            ),
            title: Text(name, style: const TextStyle(fontWeight: FontWeight.w800)),
            subtitle: Text('Ketuk untuk mulai chat', style: TextStyle(color: Colors.black.withAlpha(160))),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChatRoomScreen(title: name)),
              );
            },
          );
        },
      ),
    );
  }
}
