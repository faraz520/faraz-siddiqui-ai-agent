import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// یہاں ہم نے فولڈر کے نام ہٹا دیے ہیں کیونکہ فائلیں سیدھی موجود ہیں
import 'app_theme.dart'; 
import 'chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: FarazAIAgentApp(),
    ),
  );
}

class FarazAIAgentApp extends StatelessWidget {
  const FarazAIAgentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faraz Siddiqui AI Agent',
      debugShowCheckedModeBanner: false,
      // یہ آپ کی ایپ کے تھیم کو درست کرے گا
      theme: AppTheme.lightTheme, 
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const ChatScreen(),
    );
  }
}
