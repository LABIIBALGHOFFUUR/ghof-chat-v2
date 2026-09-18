import 'package:flutter/material.dart';
import '../brand.dart';

class CallsTabV2 extends StatelessWidget {
  const CallsTabV2({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: [
        ListTile(
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: kBrandGreen.withAlpha(25),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.link, color: kBrandGreen),
          ),
          title: const Text('Buat tautan panggilan', style: TextStyle(fontWeight: FontWeight.w900)),
          subtitle: Text(
            'Bagikan tautan untuk panggilan',
            style: TextStyle(color: Colors.black.withAlpha(160)),
          ),
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Tautan panggilan (placeholder)')),
          ),
        ),
        const Divider(height: 18),
        const _CallTile(name: 'Teman Dekat', info: 'Keluar • 18:10', icon: Icons.call_made, color: Colors.purple),
        const _CallTile(name: 'Asrama Cewek', info: 'Masuk • 17:32', icon: Icons.call_received, color: Colors.deepOrange),
        const _CallTile(name: 'Adit', info: 'Video • Kemarin', icon: Icons.videocam, color: Colors.blue),
      ],
    );
  }
}

class _CallTile extends StatelessWidget {
  final String name;
  final String info;
  final IconData icon;
  final Color color;

  const _CallTile({required this.name, required this.info, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(name[0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w800)),
      subtitle: Row(
        children: [
          Icon(icon, size: 16, color: kBrandGreen),
          const SizedBox(width: 6),
          Text(info, style: TextStyle(color: Colors.black.withAlpha(160))),
        ],
      ),
      trailing: IconButton(
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Panggil $name (placeholder)')),
        ),
        icon: const Icon(Icons.call, color: kBrandGreen),
      ),
    );
  }
}
