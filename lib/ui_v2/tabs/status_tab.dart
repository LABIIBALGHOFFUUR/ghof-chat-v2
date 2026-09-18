import 'package:flutter/material.dart';
import '../brand.dart';

class StatusTabV2 extends StatelessWidget {
  const StatusTabV2({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: [
        ListTile(
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundColor: kBrandGreen,
                child: Text('G', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: kBrandGreen,
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(Icons.add, size: 12, color: Colors.white),
                ),
              ),
            ],
          ),
          title: const Text('Status saya', style: TextStyle(fontWeight: FontWeight.w800)),
          subtitle: Text('Ketuk untuk menambah status', style: TextStyle(color: Colors.black.withAlpha(160))),
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Tambah status (placeholder)')),
          ),
        ),
        const Divider(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Text(
            'Pembaruan terbaru',
            style: TextStyle(color: Colors.black.withAlpha(170), fontWeight: FontWeight.w700),
          ),
        ),
        const _StatusTile(name: 'Rina', time: 'Hari ini, 21:10', color: Colors.pink),
        const _StatusTile(name: 'Adit', time: 'Hari ini, 20:02', color: Colors.blue),
        const _StatusTile(name: 'Fahri', time: 'Kemarin, 23:40', color: Colors.orange),
      ],
    );
  }
}

class _StatusTile extends StatelessWidget {
  final String name;
  final String time;
  final Color color;

  const _StatusTile({required this.name, required this.time, required this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: color,
        child: Text(
          name[0],
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w800)),
      subtitle: Text(time, style: TextStyle(color: Colors.black.withAlpha(160))),
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lihat status $name (placeholder)')),
      ),
    );
  }
}
