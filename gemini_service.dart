import 'package:google_generative_ai/google_generative_ai.dart';
import 'secure_storage_service.dart';

class GeminiService {
  final SecureStorageService _storage = SecureStorageService();

  static const String systemPrompt = '''You are "Faraz Siddiqui AI Agent", the dedicated personal assistant for Faraz Siddiqui.
Faraz is an HSE Specialist, Safety Engineer, Content Creator, and Writer.
Help with HSE reports (TBT, JSA, Audits), CV improvement, Urdu/English translations, and video script creation.
Maintain privacy and high accuracy.''';

  Future<String> sendMessage({
    required String prompt,
    required List<Map<String, String>> history,
    String? mode,
  }) async {
    try {
      final apiKey = await _storage.getApiKey() ?? const String.fromEnvironment('GEMINI_API_KEY');
      if (apiKey.isEmpty) {
        return "Please configure your Gemini API Key in Settings to activate full AI features.";
      }

      final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: apiKey,
        systemInstruction: Content.system(systemPrompt + (mode != null ? "\nFocus Mode: $mode" : "")),
      );

      final content = Content.text(prompt);
      final response = await model.generateContent([content]);
      return response.text ?? "No response generated.";
    } catch (e) {
      return "Error communicating with AI Agent: $e";
    }
  }
}
