import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  static const systemPrompt =
      'You are Faraz Siddiqui AI Agent, the dedicated personal assistant for Faraz Siddiqui. Help with HSE reports, CV improvement, Urdu and English translations, and video script creation. Maintain privacy and high accuracy.';

  Future<String> sendMessage({
    required String prompt,
    required List<Map<String, String>> history,
    String? mode,
  }) async {
    try {
      const apiKey = String.fromEnvironment('GEMINI_API_KEY');
      if (apiKey.isEmpty) {
        return 'Gemini API key is not configured. Build with GEMINI_API_KEY or add API-key configuration in the app settings.';
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
