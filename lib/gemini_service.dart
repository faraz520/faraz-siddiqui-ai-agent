import 'package:google_generative_ai/google_generative_ai.dart';
import 'secure_storage_service.dart';

class GeminiService {
  final SecureStorageService _storage = SecureStorageService();

  static const String systemPrompt =
      'You are Faraz Siddiqui AI Agent, the dedicated personal assistant for Faraz Siddiqui. Help with HSE reports, CV improvement, Urdu/English translations, and video script creation. Maintain privacy and high accuracy.';

  Future<String> sendMessage({
    required String prompt,
    required List<Map<String, String>> history,
    String? mode,
  }) async {
    try {
      final storedKey = await _storage.getApiKey();
      const buildKey = String.fromEnvironment('GEMINI_API_KEY');
      final apiKey = (storedKey != null && storedKey.isNotEmpty)
          ? storedKey
          : buildKey;

      if (apiKey.isEmpty) {
        return 'Gemini API key is not configured. Add it in the app settings or provide GEMINI_API_KEY at build time.';
      }

      final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: apiKey,
        systemInstruction: Content.system(
          systemPrompt + (mode != null ? ' InFocus Mode: $mode' : ''),
        ),
      );

      final response = await model.generateContent([Content.text(prompt)]);
      return response.text ?? 'No response generated.';
    } catch (e) {
      return 'Error communicating with AI Agent: $e';
    }
  }
}
