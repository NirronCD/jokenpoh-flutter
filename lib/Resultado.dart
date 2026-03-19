import 'package:flutter/material.dart';
import 'dart:math';

class Resultado extends StatelessWidget {
  final String userChoice;
  const Resultado({super.key, required this.userChoice});

  String getComputerChoice() {
    List<String> choices = ['Pedra', 'Papel', 'Tesoura'];
    return choices[Random().nextInt(3)];
  }

  String getResult(String user, String computer) {
    if (user == computer) return 'Empate';
    if ((user == 'Pedra' && computer == 'Tesoura') ||
        (user == 'Papel' && computer == 'Pedra') ||
        (user == 'Tesoura' && computer == 'Papel')) {
      return 'Vitória';
    }
    return 'Derrota';
  }

  String getImagePathResult(String result){
    switch (result){
      case 'Empate':
        return 'images/empate.png';
      case 'Derrota':
        return 'images/derrota.png';
      case 'Vitória':
        return 'images/vitoria.png';
    }
    return 'Impossivel k';
  }

  String getImagePath(String choice) {
    if (choice == 'Pedra') return 'images/pedra.png';
    if (choice == 'Papel') return 'images/papel.png';
    return 'images/tesoura.png';
  }
  @override
  Widget build(BuildContext context) {
    String computerChoice = getComputerChoice();
    String result = getResult(userChoice, computerChoice);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Pedra, Papel, Tesoura'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(getImagePath(computerChoice), width: 200, height: 200),
            Text(
              "Escolha do APP",
              style: TextStyle(fontSize: 30, fontWeight: .bold),),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(getImagePath(userChoice), width: 100, height: 100),
              ],
            ),
            Text(
              "Sua escolha",
              style: TextStyle(fontSize: 30, fontWeight: .bold),),
            const SizedBox(height: 50),
            Image.asset(getImagePathResult(result)),
            Text(
              result,
              style: TextStyle(fontSize: 30, fontWeight: .bold),),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
            ), child: const Text('Tentar de novo')
            ),
          ],
        ),
      ),
    );
  }
}