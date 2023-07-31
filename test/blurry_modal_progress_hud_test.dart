import 'package:blurry_modal_progress_hud/src/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Child widget should be rendered when inAsyncCall is false',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: BlurryModalProgressHUD(
          inAsyncCall: false,
          child: Text('Test Child Widget'),
        ),
      ),
    );

    expect(find.text('Test Child Widget'), findsOneWidget);
  });

  testWidgets('Progress indicator should be shown when inAsyncCall is true',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: BlurryModalProgressHUD(
          inAsyncCall: true,
          child: Text('Test Child Widget'),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'Progress indicator should be positioned correctly when offset is provided',
      (WidgetTester tester) async {
    const offset = Offset(100, 100);

    await tester.pumpWidget(
      const MaterialApp(
        home: BlurryModalProgressHUD(
          inAsyncCall: true,
          offset: offset,
          child: Text('Test Child Widget'),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Get the position of the progress indicator
    final progressIndicator =
        tester.getTopLeft(find.byType(CircularProgressIndicator));
    expect(progressIndicator, offset);
  });
}
