import 'message.dart';

class SecureStorageService {
  final List<Message> _messages = [];
  String? _apiKey;

  Future<void> saveApiKey(String key) async { _apiKey = key; }
  Future<String?> getApiKey() async => _apiKey;
  Future<void> saveMessages(List<Message> messages) async {
    _messages
      ..clear()
      ..addAll(messages);
  }
  Future<List<Message>> loadMessages() async => List<Message>.from(_messages);
  Future<void> clearAllData() async { _messages.clear(); _apiKey = null; }
}
