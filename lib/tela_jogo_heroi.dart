import 'package:flutter/material.dart';

class TelaJogoHeroi extends StatefulWidget {
  const TelaJogoHeroi({super.key});

  @override
  State<TelaJogoHeroi> createState() => TelaJogoHeroiState();
}

class TelaJogoHeroiState extends State<TelaJogoHeroi> {
  String heroname1 = '';
  int power = 0;
  int life = 0;
  int coins = 0;
  String urlImage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Column(children: [
      Text("escolha seu personagem"),
      Row(children: [
        ElevatedButton(onPressed: () => choosehero("Warrior"), child: Text("Warrior")),
        ElevatedButton(onPressed: () => choosehero("Wizard"), child: Text("Wizard")),
        ElevatedButton(onPressed: () => choosehero("Archer"), child: Text("Archer")),
      ],
      ),
      Image(
        height: 500,
        image: AssetImage(urlImage)),
         ElevatedButton(
                child: Text('INICIAR AVENTURA'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TelaAmbiente(heroi: nomeHeroi, urlImagem: urlImagem, moedas: moedas, vida: vida, poder: poder),
                    ),
                  );
                },
              ),
    ],)));
  }


    void choosehero(String heroTipe) {
      setState(() {
        if (heroTipe == "Warrior") {
        life = 350;
        coins = 30;
        power = 400;
        urlImage = "warriorpng.jpg";
      }
        if (heroTipe == "Wizard") {
        life = 200;
        coins = 20;
        power = 600;
        urlImage = "wizard-image.png";
        }
         if (heroTipe == "Archer") {
        life = 300;
        coins = 50;
        power = 300;
        urlImage = "archerpng.jpg";
      }});
      
  } 
  
 }
