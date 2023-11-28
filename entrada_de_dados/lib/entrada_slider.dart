import 'dart:math';

import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  const EntradaSlider({super.key});

  @override
  State<EntradaSlider> createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {
  double valor = 5;
  String label = "Valor Selecionado";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de Dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Slider(
              label: label,
              divisions: 5,
              value: valor,
              min: 0,
              max: 10,
              activeColor: Colors.red,
              inactiveColor: Colors.black,
              onChanged: (double novoValor) {
                setState(() {
                  valor = novoValor;
                  label = "Valor Selecionado " + novoValor.toString();
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                print("Valor = " + valor.toString());
              },
              child: const Text("Salvar"),
            )
          ],
        ),
      ),
    );
  }
}
