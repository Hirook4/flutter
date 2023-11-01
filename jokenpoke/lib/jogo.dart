import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemBot = const AssetImage("assets/vazio.png");
  var _mensagem = "Escolha seu Pokemon";

  void _selecionar(String escolha) {
    var opcoes = ["bulbasaur", "charmander", "squirtle"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    switch (escolhaApp) {
      case "bulbasaur":
        setState(() {
          _imagemBot = const AssetImage("assets/bulbasaur.png");
        });
        break;
      case "charmander":
        setState(() {
          _imagemBot = const AssetImage("assets/charmander.png");
        });
        break;
      case "squirtle":
        setState(() {
          _imagemBot = const AssetImage("assets/squirtle.png");
        });
        break;
      default:
    }

    if ((escolha == "bulbasaur" && escolhaApp == "squirtle") ||
        (escolha == "charmander" && escolhaApp == "bulbasaur") ||
        (escolha == "squirtle" && escolhaApp == "charmander")) {
      setState(() {
        _mensagem = "Voce Ganhou!";
      });
    } else if ((escolhaApp == "bulbasaur" && escolha == "squirtle") ||
        (escolhaApp == "charmander" && escolha == "bulbasaur") ||
        (escolhaApp == "squirtle" && escolha == "charmander")) {
      setState(() {
        _mensagem = "Voce Perdeu!";
      });
    } else {
      setState(() {
        _mensagem = "Empate!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 40, 55),
      appBar: AppBar(
        title: const Text("Jokenpoke"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 55, 55, 55),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20, top: 10),
            child: Text(
              "Pokemon Adversário",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: _imagemBot,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: Text(
              _mensagem,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _selecionar("bulbasaur"),
                child: const Image(
                  image: AssetImage("assets/bulbasaur.png"),
                  height: 120,
                ),
              ),
              GestureDetector(
                onTap: () => _selecionar("charmander"),
                child: const Image(
                  image: AssetImage("assets/charmander.png"),
                  height: 120,
                ),
              ),
              GestureDetector(
                onTap: () => _selecionar("squirtle"),
                child: const Image(
                  image: AssetImage("assets/squirtle.png"),
                  height: 120,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
