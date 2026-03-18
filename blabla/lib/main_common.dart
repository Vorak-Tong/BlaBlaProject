import 'package:blabla/ui/screens/home/home_screen.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class BlaBlaApp extends StatelessWidget {
  const BlaBlaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: blaTheme,
      home: const Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
