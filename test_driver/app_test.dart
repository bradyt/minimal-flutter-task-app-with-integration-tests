import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  test('Check statistics method', () async {
    expect(
        await driver.getText(find.text('Statistics are:')), 'Statistics are:');

    expect(await driver.getText(find.text('null')), 'null');
  });
  test('type button', () async {
    await driver.tap(find.byTooltip('Statistics'));

    // await Future.delayed(Duration(seconds: 1));
  });
  test('check for results', () async {
    expect(await driver.getText(find.text('status: Ok')), 'status: Ok');
    // expect(find.byWidgetPredicate((widget) {
    //   if (widget is Text) {
    //     final Text textWidget = widget;
    //     if (textWidget.data != null) return textWidget.data.contains('status');
    //     return textWidget.textSpan.toPlainText().contains('status');
    //   }
    //   return false;
    // }), findsOneWidget);
    // expect(await driver.getText(find.byValueKey('null')), '1');
    // expect(await driver.getText(find.byValueKey('status')), '0');

    // await tester.tap(find.byIcon(Icons.refresh));
    // await tester.pump(Duration(seconds: 5));

    // expect(find.text('null'), findsNothing);
  });
}
