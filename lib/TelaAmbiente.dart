import 'package:flutter/material.dart';

class TelaAmbiente extends StatefulWidget {
  final String heroi;
  final String urlImagem;
  final int moedas;
  final int vida;
  final int poder;

  const TelaAmbiente({
    super.key,
    required this.heroi,
    required this.urlImagem,
    required this.moedas,
    required this.vida,
    required this.poder,
  });

  @override
  State<TelaAmbiente> createState() => _TelaAmbienteState();
}

class _TelaAmbienteState extends State<TelaAmbiente> {
  double posicaoHorizontalHeroi = 50;
  double posicaoVerticalHeroi = 20;
  double posHorizontalPocao = 150;
  double posVerticalPocao = 200;
  late int _vida;
  bool pocaoColetada = false;

  @override
  void initState(){
    super.initState();
    _vida = widget.vida;
  }

  void andarParaDireita() {
    setState(() {
      posicaoHorizontalHeroi += 40;
    });
  }

  void andarParaEsquerda() {
    setState(() {
      if (posicaoHorizontalHeroi > 10) {
        posicaoHorizontalHeroi -= 40;
      }
    });
  }

  void andarParaCima() async {
    setState(() {});
    if (posicaoVerticalHeroi > 20) {
      setState(() {
        posicaoVerticalHeroi = posicaoVerticalHeroi + 40;
      });
      checarColisao();
      await Future.delayed(const Duration(milliseconds: 400));
      setState(() {
        posicaoVerticalHeroi = posicaoVerticalHeroi - 40;
      });
    }
  }

  void checarColisao() {
    if (pocaoColetada) return;

    bool bateX = (posicaoHorizontalHeroi - posHorizontalPocao).abs() < 60;
    bool bateY = (posicaoVerticalHeroi - posVerticalPocao).abs() < 60;

    if (bateX && bateY) {
      setState(() {
        pocaoColetada = true;
        _vida += 50;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sala 1 - Jogando de ${widget.heroi}'),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),

      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://i.pinimg.com/originals/a6/5c/b1/a65cb1db3b01a141b777a834460563b7.gif',
              fit: BoxFit.cover,
              
            ),
          ),
          Visibility(
            visible: !pocaoColetada,
            child: Positioned(
              left: posHorizontalPocao,
              bottom: posVerticalPocao,
              child: Image.network("imagen legal"),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(
              milliseconds: 300,
            ), // Tempo da animação de deslize
            curve: Curves.easeInOut,
            left: posicaoHorizontalHeroi,
            bottom: posicaoVerticalHeroi,
            child: Image.network(widget.urlImagem, height: 120),
          ),

          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.white, // Levemente transparente
                    foregroundColor: Colors.black,
                  ),
                  onPressed: andarParaEsquerda,
                  child: const Icon(Icons.arrow_back_ios_new, size: 30),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: andarParaDireita,
                  child: const Icon(Icons.arrow_forward_ios, size: 30),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: andarParaCima,
                  child: const Icon(Icons.arrow_circle_up, size: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
