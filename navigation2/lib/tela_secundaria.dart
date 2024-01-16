import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TelaSecundaria extends StatelessWidget {
//o que sera trazido da outra tela
  String valor;
  TelaSecundaria(this.valor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Secundaria"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: [
            //usando valor passado
            Text("Valor Passado: $valor") //para acessar o valor
          ],
        ),
      ),
    );
  }
}
