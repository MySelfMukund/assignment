// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:assignment_task/app/modules/global_widgets/widget_testing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Text Validation Error Finder', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: WidgetTesting(),
    ));

    final buttonFinder = find.text('Validate');
    final emailErrorFinder = find.text('Email field required');
    await tester.tap(buttonFinder);
    await tester.pump(
      const Duration(milliseconds: 100),
    );
    expect(emailErrorFinder, findsOneWidget);
  });

  testWidgets('String value add & result checker', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: WidgetTesting(),
    ));

    final nameButtonFinder = find.text('Show name');
    final fullNameTextFinder = find.text('Mukund Pradhan');
    await tester.tap(nameButtonFinder);
    await tester.pump(
      const Duration(milliseconds: 100),
    );
    expect(fullNameTextFinder, findsOneWidget);
  });
}
