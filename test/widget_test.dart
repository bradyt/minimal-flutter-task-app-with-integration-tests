// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:taskd_setup/main.dart';

void main() {
  testWidgets('Test statistics feature button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    expect(find.text('Statistics'), findsOneWidget);

    // Verify that our counter starts at 0.
    expect(find.text('null'), findsOneWidget);
    expect(find.text('status'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('null'), findsNothing);
    expect(find.text('status'), findsOneWidget);
  });
}
