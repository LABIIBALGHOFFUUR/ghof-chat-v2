import 'package:flutter/material.dart';
import '../brand.dart';

class CommunitiesTabV2 extends StatelessWidget {
  const CommunitiesTabV2({super.key});

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
              color: Colors.black.withAlpha(20),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.groups, color: kBrandGreen),
          ),
          title: const Text('Komunitas Baru', style: TextStyle(fontWeight: FontWeight.w900)),
          subtitle: Text(
            'Buat komunitas untuk mengatur grup',
            style: TextStyle(color: Colors.black.withAlpha(160)),
          ),
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Buat komunitas (placeholder)')),
          ),
        ),
        const Divider(height: 18),
        const ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigo,
            child: Text('K', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
          ),
          title: Text('Komunitas Kampus', style: TextStyle(fontWeight: FontWeight.w800)),
          subtitle: Text('3 grup • 128 anggota'),
        ),
        const ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.teal,
            child: Text('G', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
          ),
          title: Text('GHOF Dev', style: TextStyle(fontWeight: FontWeight.w800)),
          subtitle: Text('2 grup • 24 anggota'),
        ),
      ],
    );
  }
}
