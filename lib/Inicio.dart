import 'package:flutter/material.dart';
import 'Resultado.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  void play(BuildContext context, String userChoice) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Resultado(userChoice: userChoice),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Pedra, Papel, Tesoura'),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("images/padrao.png", width: 200, height: 200),
            Text(
              "Escolha do APP",
              style: TextStyle(fontSize: 30, fontWeight: .bold),),
            const SizedBox(height: 100),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => play(context, 'Pedra'),
                    child: Image.asset('images/pedra.png', width: 100, height: 100),
                  ),
                  GestureDetector(
                    onTap: () => play(context, 'Papel'),
                    child: Image.asset('images/papel.png', width: 100, height: 100),
                  ),
                  GestureDetector(
                    onTap: () => play(context, 'Tesoura'),
                    child: Image.asset('images/tesoura.png', width: 100, height: 100),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
