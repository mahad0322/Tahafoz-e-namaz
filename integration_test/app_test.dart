import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tahafoz_e_namaz/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('launch and open settings, request reschedule', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final settingsFinder = find.byIcon(Icons.settings);
    expect(settingsFinder, findsOneWidget);
    await tester.tap(settingsFinder);
    await tester.pumpAndSettle();

    final rescheduleFinder = find.text('Reschedule now');
    expect(rescheduleFinder, findsOneWidget);
    await tester.tap(rescheduleFinder);
    await tester.pumpAndSettle();

    // Expect a snackbar or some indication that reschedule was requested
    expect(find.textContaining('Reschedule'), findsWidgets);
  });
}
