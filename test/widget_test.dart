// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:duamoi/backend/travel_repository.dart';
import 'package:duamoi/screens/my_photos_screen.dart';
import 'package:duamoi/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Profile screen loads and navigates to My Photos', (WidgetTester tester) async {
    final repository = TravelRepository();

    await tester.pumpWidget(MaterialApp(home: ProfileScreen(repository: repository)));

    expect(find.text('Yoo Jin'), findsOneWidget);
    expect(find.text('My Photos'), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsOneWidget);

    await tester.tap(find.text('My Photos'));
    await tester.pumpAndSettle();

    expect(find.text('Add Photos'), findsOneWidget);
  });

  testWidgets('Take Photo in AddPhotosScreen adds a photo and shows confirmation', (WidgetTester tester) async {
    final repository = TravelRepository();

    await tester.pumpWidget(MaterialApp(home: MyPhotosScreen(repository: repository)));
    expect(find.text('Add Photos'), findsOneWidget);

    await tester.tap(find.text('Add Photos'));
    await tester.pumpAndSettle();

    expect(find.text('Take Photo'), findsOneWidget);
    final before = repository.photos.length;

    await tester.tap(find.text('Take Photo'));
    await tester.pumpAndSettle();

    expect(repository.photos.length, before + 1);
    expect(find.text('Photo added successfully'), findsOneWidget);
  });
}
