import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../services/api_service.dart';
import '../models/user_model.dart';
import '../models/message_model.dart';

class ChatController extends GetxController {
  var users = <UserModel>[].obs;
  final box = GetStorage();
  var messages = <MessageModel>[].obs;
  var isLoading = false.obs;

  void searchUsers(String query) async {
    try {
      isLoading.value = true;
      final response = await ApiService.searchUsers(query);
      if (response['status'] == 'success') {
        var list = response['users'] as List;
        users.value = list.map((u) => UserModel.fromJson(u)).toList();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to search users');
    } finally {
      isLoading.value = false;
    }
  }

  void fetchMessages(int receiverId) async {
    print(box.read('token'));
    try {
      isLoading.value = true;
      final response = await ApiService.getMessages(receiverId);
      if (response['status'] == 'success') {
        var list = response['messages'] as List;
        messages.value = list.map((m) => MessageModel.fromJson(m)).toList();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch messages');
    } finally {
      isLoading.value = false;
    }
  }

  void sendMessage(int receiverId, String message) async {
    try {
      final response = await ApiService.sendMessage(receiverId, message);
      if (response['status'] == 'success') {
        // Refresh messages after sending
        fetchMessages(receiverId);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to send message');
    }
  }

  // Room methods
  void fetchRoomMessages(int roomId) async {
    try {
      isLoading.value = true;
      final response = await ApiService.getRoomMessages(roomId);
      if (response['status'] == 'success') {
        var list = response['messages'] as List;
        messages.value = list.map((m) => MessageModel.fromJson(m)).toList();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch room messages');
    } finally {
      isLoading.value = false;
    }
  }

  void sendRoomMessage(int roomId, String message) async {
    try {
      final response = await ApiService.sendRoomMessage(roomId, message);
      if (response['status'] == 'success') {
        fetchRoomMessages(roomId);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to send room message');
    }
  }

  void joinRoom(int roomId) async {
    try {
      isLoading.value = true;
      final response = await ApiService.joinRoom(roomId);
      if (response['status'] == 'success') {
        Get.snackbar('Success', 'Joined room: ${response['room']['name']}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to join room');
    } finally {
      isLoading.value = false;
    }
  }
}
