import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              const Text(
                "WAVLO",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: const [
            Icon(Icons.search, color: Colors.deepOrange),
            SizedBox(width: 10),
            Icon(Icons.more_vert, color: Colors.deepOrange),
            SizedBox(width: 10),
          ],
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicator: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            tabs: [
              Tab(text: "All Chats"),
              Tab(text: "Status"),
              Tab(text: "Call"),
            ],
          ),
        ),
        body: const ChatList(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      {
        'name': 'Jerome Bell',
        'company': 'The Walt Disney Company',
        'time': '2:18 PM',
        'unread': '2',
        'image': 'https://randomuser.me/api/portraits/men/1.jpg',
      },
      {
        'name': 'Cody Fisher',
        'company': 'Starbucks',
        'time': '2:18 PM',
        'image': 'https://randomuser.me/api/portraits/women/2.jpg',
      },
      {
        'name': 'Arlene McCoy',
        'company': 'Gillette',
        'time': '2:18 PM',
        'image': 'https://randomuser.me/api/portraits/men/3.jpg',
      },
      {
        'name': 'Jenny Wilson',
        'company': 'McDonald\'s',
        'time': '2:18 PM',
        'image': 'https://randomuser.me/api/portraits/women/4.jpg',
      },
      {
        'name': 'Bessie Cooper',
        'company': 'Mitsubishi',
        'time': '2:18 PM',
        'image': 'https://randomuser.me/api/portraits/women/5.jpg',
      },
      {
        'name': 'Cameron Williamson',
        'company': 'Bank of America',
        'time': '2:18 PM',
        'image': 'https://randomuser.me/api/portraits/men/6.jpg',
      },
      {
        'name': 'Leslie Alexander',
        'company': 'IBM',
        'time': '2:18 PM',
        'image': 'https://randomuser.me/api/portraits/men/7.jpg',
      },
      {
        'name': 'Leslie Alexander',
        'company': 'Mitsubishi',
        'time': '2:18 PM',
        'image': 'https://randomuser.me/api/portraits/women/8.jpg',
      },
      {
        'name': 'Leslie Alexander',
        'company': 'See you Tomorrow',
        'time': '2:18 PM',
        'image': 'https://randomuser.me/api/portraits/men/9.jpg',
      },
    ];

    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(chat['image']!)),
          title: Text(chat['name']!),
          subtitle: Text(chat['company']!),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(chat['time']!),
              if (chat.containsKey('unread'))
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    chat['unread']!,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
