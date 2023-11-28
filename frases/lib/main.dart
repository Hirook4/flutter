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
    "Flutter é um framework de desenvolvimento com foco multiplataforma em dispositivos móveis",
    "Flutter permite a criação de aplicações para desktop (Linux, Windows e macOS)",
    "Flutter é um framework para desenvolver aplicativos em diferentes plataformas ao mesmo tempo com um único código.",
    "Flutter utiliza a linguagem de programação Dart",
    "Flutter e o Dart foram criados pela Google",
  ];

  var fraseGerada = "";
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
        centerTitle: true,
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/logo.png"),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                child: SizedBox(
                  height: 120,
                  child: Text(
                    fraseGerada,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 100, 0, 25),
                child: Text(
                  "Clique para gerar uma frase",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
