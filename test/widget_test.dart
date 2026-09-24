import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pert1/main.dart';

void main() {
  testWidgets('login page renders the static login form', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const Pert1App());

    expect(find.text('EMAIL'), findsOneWidget);
    expect(find.text('PASSWORD'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('LOGIN'), findsOneWidget);
    expect(find.text('Belum punya akun?'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
  });

  testWidgets('the Register link opens the register page', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(800, 1400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const Pert1App());
    await tester.tap(find.text('Register'));
    await tester.pumpAndSettle();

    expect(find.text('REGISTER'), findsOneWidget);
    expect(find.text('LOGIN'), findsNothing);
  });
}
