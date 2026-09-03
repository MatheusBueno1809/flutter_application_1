import 'package:flutter/material.dart';
import 'tela_jogo_heroi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TelaInicial(),
      
          
    );
  }

 
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
           
            Text(
              'caverna do dragão',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Image.asset("cachorropirulito.jpg"),
            
            FloatingActionButton(
                onPressed: () {
                   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaJogoHeroi()),
                );
              },
                child: Text("enter"))
          ],
        ),
      ),
    );
  }
}

