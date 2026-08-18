import 'package:flutter/material.dart';
import 'secure_storage_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _apiKeyController = TextEditingController();
  final _storage = SecureStorageService();
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Settings')),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      const Text('Gemini API Key', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      TextField(controller: _apiKeyController, obscureText: true, decoration: const InputDecoration(labelText: 'API Key', border: OutlineInputBorder())),
      const SizedBox(height: 8),
      ElevatedButton(onPressed: () async { await _storage.saveApiKey(_apiKeyController.text.trim()); if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('API key saved'))); }, child: const Text('Save API Key')),
      const Divider(),
      const Text('Integrations', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      const ListTile(title: Text('Google / Gmail / Drive'), subtitle: Text('Requires user authorization')), 
      const ListTile(title: Text('YouTube / Studio'), subtitle: Text('Requires user authorization')),
      const ListTile(title: Text('Facebook / Instagram / TikTok'), subtitle: Text('Requires user authorization')),
    ]),
  );
}
