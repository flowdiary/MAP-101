import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';
import '../controllers/login_controller.dart';
import 'messages_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = Get.put(ChatController());
    final loginController = Get.find<LoginController>();
    final searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => loginController.logout(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextField(
          //     controller: searchController,
          //     decoration: InputDecoration(
          //       labelText: 'Search Groups',
          //       suffixIcon: IconButton(
          //         icon: const Icon(Icons.search),
          //         onPressed: () =>
          //             chatController.searchUsers(searchController.text),
          //       ),
          //     ),
          //     onSubmitted: (val) => chatController.searchUsers(val),
          //   ),
          // ),
          Divider(),
          Expanded(
            child: Obx(() {
              if (chatController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              final rooms = [
                {'id': 1, 'name': 'General Room', 'desc': 'Public group chat'},
                {'id': 2, 'name': 'Technology', 'desc': 'Tech talk & news'},
                {'id': 3, 'name': 'Random', 'desc': 'Anything and everything'},
              ];
              return ListView.separated(
                itemCount: chatController.users.length + rooms.length,
                itemBuilder: (context, index) {
                  if (index < rooms.length) {
                    final room = rooms[index];
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.group),
                      ),
                      title: Text(room['name'] as String),
                      subtitle: Text(room['desc'] as String),
                      onTap: () {
                        chatController.joinRoom(room['id'] as int);
                        Get.to(
                          () => MessagesPage(
                            roomId: room['id'] as int,
                            roomName: room['name'] as String,
                          ),
                        );
                      },
                    );
                  }
                  final user = chatController.users[index - rooms.length];
                  return ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Text(user.username),
                    onTap: () {
                      Get.to(() => MessagesPage(user: user));
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
