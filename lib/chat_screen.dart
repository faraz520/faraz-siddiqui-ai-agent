import 'package:flutter/material.dart';
import 'message.dart';
import 'gemini_service.dart';
import 'secure_storage_service.dart';
import 'settings_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final List<Message> _messages = [];
  final _geminiService = GeminiService();
  final _storageService = SecureStorageService();
  bool _isLoading = false;

  @override
  void initState() { super.initState(); _loadHistory(); }
  Future<void> _loadHistory() async {
    final saved = await _storageService.loadMessages();
    if (!mounted) return;
    setState(() { _messages.addAll(saved); });
    if (_messages.isEmpty) {
      setState(() { _messages.add(Message(id: DateTime.now().toString(), text: 'Assalamu Alaikum Faraz! I am your AI Agent. How can I assist you?', role: 'assistant', timestamp: DateTime.now())); });
    }
  }

  Future<void> _handleSend() async {
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    setState(() { _messages.add(Message(id: DateTime.now().millisecondsSinceEpoch.toString(), text: text, role: 'user', timestamp: DateTime.now())); _isLoading = true; _textController.clear(); });
    final reply = await _geminiService.sendMessage(prompt: text, history: const []);
    if (!mounted) return;
    setState(() { _messages.add(Message(id: DateTime.now().millisecondsSinceEpoch.toString(), text: reply, role: 'assistant', timestamp: DateTime.now())); _isLoading = false; });
    await _storageService.saveMessages(_messages);
    WidgetsBinding.instance.addPostFrameCallback((_) { if (_scrollController.hasClients) _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut); });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Faraz Siddiqui AI Agent'), actions: [IconButton(icon: const Icon(Icons.settings_outlined), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()))) ]),
    body: Column(children: [
      Expanded(child: ListView.builder(controller: _scrollController, padding: const EdgeInsets.all(16), itemCount: _messages.length, itemBuilder: (_, i) { final m = _messages[i]; final user = m.role == 'user'; return Align(alignment: user ? Alignment.centerRight : Alignment.centerLeft, child: Container(margin: const EdgeInsets.symmetric(vertical: 6), padding: const EdgeInsets.all(12), constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .8), decoration: BoxDecoration(color: user ? const Color(0xFF10B981) : const Color(0xFF1E293B), borderRadius: BorderRadius.circular(16)), child: Text(m.text)); }); }),
      if (_isLoading) const LinearProgressIndicator(),
      Padding(padding: const EdgeInsets.all(12), child: Row(children: [Expanded(child: TextField(controller: _textController, onSubmitted: (_) => _handleSend(), decoration: const InputDecoration(hintText: 'Ask Faraz AI Agent...', border: OutlineInputBorder()))), IconButton(icon: const Icon(Icons.send_rounded), onPressed: _handleSend)]))
    ]));
}
