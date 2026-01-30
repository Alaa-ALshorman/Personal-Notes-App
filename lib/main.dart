import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PersonalNotesApp());
}

class PersonalNotesApp extends StatelessWidget {
  const PersonalNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Notes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        
        colorScheme: ColorScheme.fromSeed(seedColor:  Colors.purple,), 
        appBarTheme: const AppBarTheme(
         
          backgroundColor: Colors.purple, 
          foregroundColor: Color.fromARGB(255, 251, 251, 250), 
          centerTitle: true,
        ),
        
      ),
      home: const HomeScreen(),

    );
  }
}