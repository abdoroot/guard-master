// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:guard_master/common/helper/random_codes.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    print(getRandomValueFromList([
      'TJ516U',
      'UR834F',
      'ZJ202X',
      'HS544E',
      'AE052A',
      'FA170W',
      'OU274L',
      'AR149I',
      'UY820B',
      'HQ704W'
    ]));
  });
}
