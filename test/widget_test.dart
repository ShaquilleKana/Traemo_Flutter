import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traemo_flutter/main.dart';

void main() {
  testWidgets('TraemoApp loads after prefs', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(const TraemoApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byType(TraemoApp), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.text('MoneyChat'), findsOneWidget);
  });
}
