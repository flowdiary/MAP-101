import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';
import '../controllers/login_controller.dart';
import '../models/user_model.dart';

class MessagesPage extends StatefulWidget {
  final UserModel? user;
  final int? roomId;
  final String? roomName;

  const MessagesPage({super.key, this.user, this.roomId, this.roomName});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final chatController = Get.find<ChatController>();
  final loginController = Get.find<LoginController>();
  final messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshMessages();
  }

  void _refreshMessages() {
    chatController.fetchRoomMessages(widget.roomId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user?.username ?? widget.roomName ?? 'Chat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshMessages,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (chatController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (chatController.messages.isEmpty) {
                return const Center(child: Text('No messages yet.'));
              }
              return ListView.builder(
                reverse: true,
                padding: const EdgeInsets.all(10),
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  final msg = chatController
                      .messages[chatController.messages.length - 1 - index];
                  final isMe =
                      msg.senderId == loginController.currentUser.value?.id;

                  return Align(
                    alignment: isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.blue[400] : Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: isMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          if (!isMe && widget.roomId != null)
                            Text(
                              msg.senderUsername ?? 'Unknown',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          Text(
                            msg.message,
                            style: TextStyle(
                              color: isMe ? Colors.white : Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            msg.createdAt,
                            style: TextStyle(
                              fontSize: 9,
                              color: isMe ? Colors.white70 : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      if (messageController.text.isNotEmpty) {
                        if (widget.user != null) {
                          chatController.sendMessage(
                            widget.user!.id,
                            messageController.text,
                          );
                        } else if (widget.roomId != null) {
                          chatController.sendRoomMessage(
                            widget.roomId!,
                            messageController.text,
                          );
                        }
                        messageController.clear();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
