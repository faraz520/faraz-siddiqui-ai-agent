class Message {
  final String id;
  final String text;
  final String role;
  final DateTime timestamp;

  Message({required this.id, required this.text, required this.role, required this.timestamp});

  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
    'role': role,
    'timestamp': timestamp.toIso8601String(),
  };

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json['id'] as String,
    text: json['text'] as String,
    role: json['role'] as String,
    timestamp: DateTime.parse(json['timestamp'] as String),
  );
}
