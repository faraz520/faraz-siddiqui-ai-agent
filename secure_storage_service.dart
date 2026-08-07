import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/message.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _messagesKey = 'fs_agent_encrypted_messages';
  static const String _apiKey = 'fs_agent_gemini_api_key';
  static const String _settingsKey = 'fs_agent_user_settings';

  Future<void> saveApiKey(String key) async {
    await _storage.write(key: _apiKey, value: key);
  }

  Future<String?> getApiKey() async {
    return await _storage.read(key: _apiKey);
  }

  Future<void> saveMessages(List<Message> messages) async {
    final jsonList = messages.map((m) => m.toJson()).toList();
    await _storage.write(key: _messagesKey, value: jsonEncode(jsonList));
  }

  Future<List<Message>> loadMessages() async {
    try {
      final str = await _storage.read(key: _messagesKey);
      if (str == null) return [];
      final List rawList = jsonDecode(str);
      return rawList.map((item) => Message.fromJson(item)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> clearAllData() async {
    await _storage.deleteAll();
  }
}
