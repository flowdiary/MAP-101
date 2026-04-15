class MessageModel {
  final int id;
  final int? senderId;
  final String? senderUsername;
  final int? receiverId;
  final String? receiverUsername;
  final int? roomId;
  final String? roomName;
  final String message;
  final String createdAt;

  MessageModel({
    required this.id,
    this.senderId,
    this.senderUsername,
    this.receiverId,
    this.receiverUsername,
    this.roomId,
    this.roomName,
    required this.message,
    required this.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      senderId: json['sender_id'],
      senderUsername: json['sender_username'],
      receiverId: json['receiver_id'],
      receiverUsername: json['receiver_username'],
      roomId: json['room_id'],
      roomName: json['room_name'],
      message: json['message'],
      createdAt: json['created_at'],
    );
  }
}
