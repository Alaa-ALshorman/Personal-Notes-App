import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyNotesApp());
}

class MyNotesApp extends StatelessWidget {
  const MyNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Notes',
      debugShowCheckedModeBanner: false,
      // اذهبي لملف lib/main.dart وتأكدي من تعديل هذا الجزء:
theme: ThemeData(
  useMaterial3: true,
  // يجب استخدام CardThemeData وليس CardTheme
  cardTheme: const CardThemeData(
    elevation: 2,
    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  ),
),
      home: const HomeScreen(),
    );
  }
}