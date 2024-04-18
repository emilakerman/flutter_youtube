import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:youtube_home_demo/main.dart';
import 'package:youtube_home_demo/src/_src.dart';

void main() {
  testWidgets("Testing if a button's bg color changs to white when clicked.",
      (WidgetTester widgetTester) async {
    //find a widget
    final textButtonHoriz = find.byKey(const ValueKey("textButton0"));

    //execute test
    await widgetTester.pumpWidget(const MaterialApp(
        home: HorizontalCategories(
      isNotificationsScreen: false,
    )));
    await widgetTester.tap(textButtonHoriz);
    await widgetTester.pump(); //rebuilds widget

    //check output
    final TextButton buttonWidget =
        widgetTester.widget(textButtonHoriz) as TextButton;
    final Color? actualColor = buttonWidget.style?.backgroundColor?.resolve(
      {MaterialState.selected},
    );

    expect(actualColor, Colors.white);
  });
  testWidgets(
      "Testing if an alert is displayed when the cast button is pressed.",
      (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(home: MainApp()));

    await widgetTester.pumpAndSettle();

    final castButton = find.byKey(const ValueKey("castButton"));
    expect(castButton, findsOneWidget);

    await widgetTester.runAsync(() async {
      await widgetTester.tap(castButton);
    });
    await widgetTester.pump();

    expect(find.byKey(const ValueKey("alertDialogKey")), findsOneWidget);
    expect(find.byIcon(Icons.cast), findsOneWidget);
    expect(find.byType(AlertDialog), findsOneWidget);
  });
}
