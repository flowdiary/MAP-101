import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class ApiService {
  static const String baseUrl = 'https://flowdiary.ai/api/map/';
  static final storage = GetStorage();

  static Map<String, String> get _headers => {"Authorization": "Bearer ${storage.read('token')}"};

  static Future<Map<String, dynamic>> register(
    String username,
    String phone,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse('${baseUrl}register.php'),
      body: {'username': username, 'password': password, 'phone': phone},
    );
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> login(
    String username,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse('${baseUrl}login.php'),
      body: {'username': username, 'password': password},
    );

    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> searchUsers(String query) async {
    final response = await http.get(Uri.parse('${baseUrl}users.php?q=$query'));
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> sendMessage(
    int receiverId,
    String message,
  ) async {
    final response = await http.post(
      Uri.parse('${baseUrl}send_message.php'),
      body: {'receiver_id': receiverId.toString(), 'message': message},
      headers: _headers,
    );
    print(response.body);
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> getMessages(int receiverId) async {
    final response = await http.get(
      Uri.parse('${baseUrl}get_messages.php?receiver_id=$receiverId'),
      headers: _headers,
    );
    print(response.body);
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> joinRoom(int roomId) async {
    final response = await http.post(
      Uri.parse('${baseUrl}join_room.php'),
      body: {'room_id': roomId.toString()},
      headers: _headers,
    );
    print(response.body);

    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> sendRoomMessage(
    int roomId,
    String message,
  ) async {
    final response = await http.post(
      Uri.parse('${baseUrl}send_room_message.php'),
      body: {'room_id': roomId.toString(), 'message': message},
      headers: _headers,
    );
    print(response.body);
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> getRoomMessages(int roomId) async {
    final response = await http.get(
      Uri.parse('${baseUrl}get_room_messages.php?room_id=$roomId'),
      headers: _headers,
    );
    return jsonDecode(response.body);
  }
}
