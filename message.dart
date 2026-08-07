class Message {
  final String id;
  final String text;
  final String role; // 'user' or 'assistant'
  final DateTime timestamp;
  final String? attachmentName;
  final String? attachmentType;
  final bool isVoice;

  Message({
    required this.id,
    required this.text,
    required this.role,
    required this.timestamp,
    this.attachmentName,
    this.attachmentType,
    this.isVoice = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'role': role,
        'timestamp': timestamp.toIso8601String(),
        'attachmentName': attachmentName,
        'attachmentType': attachmentType,
        'isVoice': isVoice,
      };

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json['id'],
        text: json['text'],
        role: json['role'],
        timestamp: DateTime.parse(json['timestamp']),
        attachmentName: json['attachmentName'],
        attachmentType: json['attachmentType'],
        isVoice: json['isVoice'] ?? false,
      );
}
