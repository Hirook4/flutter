import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Resultado extends StatefulWidget {
  //Construtor
  String valor;

  Resultado(this.valor, {super.key});

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    var caminhoImagem = "assets/cara.png";
    if (widget.valor == "cara") {
      caminhoImagem = "assets/cara.png";
    } else {
      caminhoImagem = "assets/coroa.png";
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 96, 189, 139),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(
            image: AssetImage(caminhoImagem),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Image(
              image: AssetImage("assets/voltar.png"),
            ),
          )
        ],
      ),
    );
  }
}
