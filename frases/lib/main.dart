// ignore_for_file: avoid_print

import 'package:flutter/material.dart'; //Temas do App
import 'dart:math'; //Necessario para gerar numero aleatorio

//Todo o codigo é executado daqui
void main() {
  runApp(
    /* MaterialApp - Classe para montagem de App */
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      /* Remove a faixa de Debug no topo da tela */
      title: "Frases do Dia",
      /* home - Pode receber um widget */
      /* Column - Recebe lista de Widgets chamada children */
      home: HomeStateful(),
    ),
  );
}

class HomeStateful extends StatefulWidget {
  const HomeStateful({super.key});

  @override
  State<HomeStateful> createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  var frases = [
    "Frase 1",
    "Frase 2",
    "Frase 3",
    "Frase 4",
    "Frase 5",
  ];

  var fraseGerada = "Pressione para gerar uma frase";
  void gerarFrase() {
    var random = Random().nextInt(frases.length); //Gera o numero

//Atualiza "estado" para mostrar as mudanças
    setState(() {
      fraseGerada = frases[random];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Frases do Dia"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          /* width: double.infinity, */
          /* decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.amber),
          ), */
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/logo.png"),
              Text(
                fraseGerada,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: gerarFrase,
                  child: const Text(
                    "Gerar Frase",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
