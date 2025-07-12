import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int difficultyLevel;

  const Difficulty({required this.difficultyLevel, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Icon(Icons.star, color: obterCorIconeEstrela(0), size: 15),
          Icon(Icons.star, color: obterCorIconeEstrela(1), size: 15),
          Icon(Icons.star, color: obterCorIconeEstrela(2), size: 15),
          Icon(Icons.star, color: obterCorIconeEstrela(3), size: 15),
          Icon(Icons.star, color: obterCorIconeEstrela(4), size: 15),
        ],
      ),
    );
  }

  /// Retorna a cor que o [Icon] de uma estrela deve ter,
  /// baseado na [level] passada como par metro.
  ///
  /// Se o [widget.dificuldade] for maior do que a [level] passada, retorna [Colors.blue].
  /// Caso contrário, retorna [Colors.blue] com opacidade 100.
  ///
  Color? obterCorIconeEstrela(int level) {
    return difficultyLevel > level ? Colors.blue : Colors.blue[100];
  }
}
