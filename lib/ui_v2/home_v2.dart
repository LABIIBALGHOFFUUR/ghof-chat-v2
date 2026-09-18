import 'package:flutter/material.dart';
import 'brand.dart';
import 'tabs/chats_tab.dart';
import 'tabs/status_tab.dart';
import 'tabs/communities_tab.dart';
import 'tabs/calls_tab.dart';
import 'screens/new_chat_screen.dart';
import 'screens/settings_screen.dart';
import '../main.dart' show LoginScreen;

class HomeV2Screen extends StatefulWidget {
  const HomeV2Screen({super.key});

  @override
  State<HomeV2Screen> createState() => _HomeV2ScreenState();
}

class _HomeV2ScreenState extends State<HomeV2Screen> {
  int _index = 0;

  void _snack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  AppBar _buildAppBar() {
    final title = switch (_index) {
      1 => 'Status',
      2 => 'Komunitas',
      3 => 'Panggilan',
      _ => 'GHOF CHAT',
    };

    return AppBar(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
      backgroundColor: kBrandGreen,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () => _snack('Search (placeholder)'),
          icon: const Icon(Icons.search),
          tooltip: 'Cari',
        ),
        if (_index == 0 || _index == 1)
          IconButton(
            onPressed: () => _snack('Kamera (placeholder)'),
            icon: const Icon(Icons.photo_camera_outlined),
            tooltip: 'Kamera',
          ),
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'settings') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            } else if (value == 'logout') {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(value: 'settings', child: Text('Setelan')),
            PopupMenuItem(value: 'logout', child: Text('Logout')),
          ],
        ),
      ],
    );
  }

  Widget? _buildFab() {
    switch (_index) {
      case 0:
        return FloatingActionButton(
          backgroundColor: kBrandGreen,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NewChatScreen()),
            );
          },
          child: const Icon(Icons.chat),
        );
      case 1:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton.small(
              backgroundColor: Colors.grey.shade200,
              foregroundColor: Colors.black87,
              onPressed: () => _snack('Tulis status (placeholder)'),
              child: const Icon(Icons.edit),
            ),
            const SizedBox(height: 12),
            FloatingActionButton(
              backgroundColor: kBrandGreen,
              foregroundColor: Colors.white,
              onPressed: () => _snack('Buat status dengan kamera (placeholder)'),
              child: const Icon(Icons.photo_camera),
            ),
          ],
        );
      case 2:
        return FloatingActionButton(
          backgroundColor: kBrandGreen,
          foregroundColor: Colors.white,
          onPressed: () => _snack('Buat komunitas (placeholder)'),
          child: const Icon(Icons.group_add),
        );
      case 3:
        return FloatingActionButton(
          backgroundColor: kBrandGreen,
          foregroundColor: Colors.white,
          onPressed: () => _snack('Panggilan baru (placeholder)'),
          child: const Icon(Icons.add_ic_call),
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: IndexedStack(
        index: _index,
        children: const [
          ChatsTabV2(),
          StatusTabV2(),
          CommunitiesTabV2(),
          CallsTabV2(),
        ],
      ),
      floatingActionButton: _buildFab(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kBrandGreen,
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
