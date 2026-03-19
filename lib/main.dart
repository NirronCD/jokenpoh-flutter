import 'package:flutter/material.dart';
import 'Inicio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo Jokenpoh',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.redAccent),
      ),
      home: const Inicio(),
    );
  }
}