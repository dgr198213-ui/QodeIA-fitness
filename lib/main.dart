import 'package:flutter/material.dart';

void main() => runApp(const QodeIAApp());

class QodeIAApp extends StatelessWidget {
  const QodeIAApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: Center(child: Text('QodeIA Fitness - Aura Neon Ready', 
          style: TextStyle(color: Colors.cyan, fontSize: 24))),
      ),
    );
  }
}
