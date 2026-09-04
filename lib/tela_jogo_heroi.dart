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
      Image.network(urlImage)
    ],)));
  }

    void choosehero(String heroTipe) {
      setState(() {
        if (heroTipe == "Warrior") {
        life = 350;
        coins = 30;
        power = 400;
        urlImage = "https://i.pinimg.com/736x/02/eb/38/02eb38fbe71a52053e65b3f6e014d7f7.jpg";
      }
        if (heroTipe == "Wizard") {
        life = 200;
        coins = 20;
        power = 600;
        urlImage = "https://i.pinimg.com/736x/4c/a3/bc/4ca3bcf5d4660100095d75cc2fb1465f.jpg";
        }
         if (heroTipe == " Archer") {
        life = 300;
        coins = 50;
        power = 300;
        urlImage = "https://i.pinimg.com/736x/ce/c7/8e/cec78e0d5663e948a573915a9ef9a437.jpg";
      }});
      
  } 
  
 }
