import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_design/pages/stack_transition.dart';
import 'package:portfolio_design/pages/stack_transition_hero.dart';

import 'pages/image_fill_animation_start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.oswaldTextTheme()
      ),
      debugShowCheckedModeBanner: false,
      home: const StackTransition(),
    );
  }
}
