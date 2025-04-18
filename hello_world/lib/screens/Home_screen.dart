import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool _fabExpanded = false;

  void toggleFab() {
    setState(() {
      _fabExpanded = !_fabExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "WAVLO",
            style: TextStyle(
              fontSize: 20,
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [
            Icon(Icons.search, color: Colors.deepOrange),
            SizedBox(width: 10),
            Icon(Icons.more_vert, color: Colors.deepOrange),
            SizedBox(width: 10),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TabBar(
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black87,
                indicator: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(30),
                ),
                indicatorSize: TabBarIndicatorSize.tab, // ياخد العرض كله
                tabs: const [
                  Tab(child: Center(child: Text("All Chats"))),
                  Tab(child: Center(child: Text("Status"))),
                  Tab(child: Center(child: Text("Call"))),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            ChatList(),
            Center(child: Text("Status")),
            Center(child: Text("Call")),
          ],
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (_fabExpanded) ...[
              FloatingActionButton(
                heroTag: 'fab1',
                mini: true,
                backgroundColor: Colors.deepOrange,
                onPressed: () {},
                child: const Icon(Icons.person_add, color: Colors.white),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                heroTag: 'fab2',
                mini: true,
                backgroundColor: Colors.deepOrange,
                onPressed: () {},
                child: const Icon(Icons.group, color: Colors.white),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                heroTag: 'fab3',
                mini: true,
                backgroundColor: Colors.deepOrange,
                onPressed: () {},
                child: const Icon(Icons.add, color: Colors.white),
              ),
              const SizedBox(height: 16),
            ],
            FloatingActionButton(
              backgroundColor: Colors.deepOrange,
              onPressed: toggleFab,
              child: Icon(
                _fabExpanded ? Icons.close : Icons.add,
                color: Colors.white,
              ),
            ),
          ],
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
        'image': 'https://randomuser.me/api/portraits/women/9.jpg',
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
