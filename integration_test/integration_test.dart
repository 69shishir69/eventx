import 'package:eventx/screens/event_booking/choose_venue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Registration Test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ChooseVenueScreen(),
        ),
      );
      Finder noOfPeople = find.byKey(const ValueKey('txtNoOfPeople'));
      await tester.enterText(noOfPeople, '300');
      Finder venueDate = find.byKey(const ValueKey('txtdate'));
      await tester.enterText(venueDate, '2022-12-06');
      Finder btnNext = find.byKey(const ValueKey('btnNext'));
      await tester.dragUntilVisible(
        btnNext, // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );
      await tester.tap(btnNext);
      await tester.pumpAndSettle();
      expect(find.byType(SafeArea), findsOneWidget);
    },
  );


}
