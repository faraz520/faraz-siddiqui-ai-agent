import 'package:flutter/material.dart';
import '../services/secure_storage_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _apiKeyController = TextEditingController();
  final SecureStorageService _storage = SecureStorageService();
  bool _encryptedMode = true;

  final Map<String, bool> _integrations = {
    'google': false,
    'gmail': false,
    'gdrive': false,
    'youtube': false,
    'yt_studio': false,
    'blogger': false,
    'facebook': false,
    'instagram': false,
    'tiktok': false,
    'chatgpt': false,
    'gemini_pro': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Automation & Integrations'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Privacy & Local Security', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF10B981))),
          const SizedBox(height: 8),
          SwitchListTile(
            value: _encryptedMode,
            onChanged: (val) => setState(() => _encryptedMode = val),
            title: const Text('AES-256 Encrypted Storage'),
            subtitle: const Text('Local KeyStore encryption for chat history & OAuth tokens'),
          ),
          const Divider(),
          const Text('Primary AI Engine Key', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF10B981))),
          const SizedBox(height: 8),
          TextField(
            controller: _apiKeyController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Gemini API Key',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.key),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Save API Key Securely'),
          ),
          const Divider(),
          const Text('Authorized Digital Operator Accounts', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF10B981))),
          const Text('The AI Agent executes automated actions ONLY after explicit user authorization.', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 12),
          _buildIntegrationTile('Google Workspace (Account/Drive)', 'google', Icons.g_mobiledata),
          _buildIntegrationTile('Gmail Integration', 'gmail', Icons.email_outlined),
          _buildIntegrationTile('YouTube Channel', 'youtube', Icons.video_camera_back),
          _buildIntegrationTile('YouTube Studio Analytics', 'yt_studio', Icons.analytics_outlined),
          _buildIntegrationTile('Blogger Website API', 'blogger', Icons.article_outlined),
          _buildIntegrationTile('Facebook Page Manager', 'facebook', Icons.facebook),
          _buildIntegrationTile('Instagram Content Studio', 'instagram', Icons.camera_alt_outlined),
          _buildIntegrationTile('TikTok Video Publisher', 'tiktok', Icons.music_note),
          _buildIntegrationTile('ChatGPT / OpenAI Integration', 'chatgpt', Icons.auto_awesome),
        ],
      ),
    );
  }

  Widget _buildIntegrationTile(String title, String key, IconData icon) {
    final isConnected = _integrations[key] ?? false;
    return ListTile(
      leading: Icon(icon, color: isConnected ? const Color(0xFF10B981) : Colors.grey),
      title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      subtitle: Text(isConnected ? 'Authorized & Active' : 'Disconnected (Requires Approval)', style: TextStyle(fontSize: 12, color: isConnected ? Colors.green : Colors.grey)),
      trailing: Switch(
        value: isConnected,
        onChanged: (val) {
          setState(() {
            _integrations[key] = val;
          });
        },
      ),
    );
  }
}
