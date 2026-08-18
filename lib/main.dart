import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_theme.dart';
import 'chat_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };

  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint('Unhandled platform error: $error');
    debugPrintStack(stackTrace: stack);
    return true;
  };

  runZonedGuarded(() {
    runApp(
      const ProviderScope(
        child: FarazAIAgentApp(),
      ),
    );
  }, (Object error, StackTrace stack) {
    debugPrint('Unhandled startup error: $error');
    debugPrintStack(stackTrace: stack);
  });
}

class FarazAIAgentApp extends StatelessWidget {
  const FarazAIAgentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faraz Siddiqui AI Agent',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const ChatScreen(),
    );
  }
}
