import 'package:flutter/material.dart';

import 'backend/travel_repository.dart';
import 'screens/profile_screen.dart'; // Import trang Profile

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: ProfileScreen(repository: TravelRepository()),
    );
  }
}