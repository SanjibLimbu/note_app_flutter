import 'package:flutter/material.dart';
import 'package:note_app/screens/add_note.dart';

import 'package:note_app/screens/home_screen.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: 'home_screen',
      routes: {
        'home_screen': (context) => const HomeScreen(),
        'add_note':(context) => AddNote(),
  
      },
    );
  }
}
