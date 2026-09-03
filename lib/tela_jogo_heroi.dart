import 'package:flutter/material.dart';

class TelaJogoHeroi extends StatefulWidget {
  const TelaJogoHeroi({super.key});

  @override
  State<TelaJogoHeroi> createState() => TelaJogoHeroiState();
}

class TelaJogoHeroiState extends State<TelaJogoHeroi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Tela jogo Heroi')));
  }
}