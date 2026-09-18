import 'package:flutter/material.dart';
import '../brand.dart';
import '../../main.dart' show ChatRoomScreen;

class ChatItemV2 {
  final String name;
  final String lastMessage;
  final String time;
  final int unread;
  final Color avatarColor;

  const ChatItemV2({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unread,
    required this.avatarColor,
  });

  String get letter => name.isNotEmpty ? name.trim()[0].toUpperCase() : '?';
}

class ChatsTabV2 extends StatelessWidget {
  const ChatsTabV2({super.key});

  static const _chats = <ChatItemV2>[
    ChatItemV2(
      name: 'Asrama Cewek',
      lastMessage: 'memew: 📷 Foto',
      time: '20:56',
      unread: 25,
      avatarColor: Colors.deepOrange,
    ),
    ChatItemV2(
      name: 'dermayu_chill_24jm',
      lastMessage: '?: voice note 0:12',
      time: '19:56',
      unread: 81,
      avatarColor: Colors.green,
    ),
    ChatItemV2(
      name: 'KAUM REBAHAN',
      lastMessage: 'mizcayllaa: Grup ini...',
      time: '19:51',
      unread: 98,
      avatarColor: Colors.blue,
    ),
    ChatItemV2(
      name: 'Baim vs Haters',
      lastMessage: '•',
      time: '19:36',
      unread: 33,
      avatarColor: Colors.deepOrange,
    ),
    ChatItemV2(
      name: 'Teman Dekat',
      lastMessage: 'Ok siap',
      time: '18:10',
      unread: 0,
      avatarColor: Colors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(18),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.search),
                hintText: 'Cari chat atau pesan',
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.separated(
            itemCount: _chats.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final c = _chats[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ChatRoomScreen(title: c.name)),
                  );
                },
                leading: CircleAvatar(
                  backgroundColor: c.avatarColor,
                  child: Text(
                    c.letter,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                ),
                title: Text(c.name, style: const TextStyle(fontWeight: FontWeight.w800)),
                subtitle: Text(
                  c.lastMessage,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      c.time,
                      style: TextStyle(color: Colors.black.withAlpha(160), fontSize: 12),
                    ),
                    const SizedBox(height: 6),
                    if (c.unread > 0)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: kBrandGreen,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${c.unread}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
