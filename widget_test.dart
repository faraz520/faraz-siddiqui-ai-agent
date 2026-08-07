import 'package:flutter_test/flutter_test.dart';
import 'package:faraz_siddiqui_ai_agent/main.dart';

void main() {
  testWidgets('App loads cleanly', (WidgetTester tester) async {
    await tester.pumpWidget(const FarazAIAgentApp());
    expect(find.text('Faraz Siddiqui AI Agent'), findsOneWidget);
  });
}
