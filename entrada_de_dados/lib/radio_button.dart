import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String _escolha = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de Dados"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Masculino"),
            Radio(
                value: "m",
                groupValue: _escolha,
                onChanged: (escolha) {
                  setState(() {
                    _escolha = escolha!;
                  });
                  print(escolha);
                }),
            Text("Feminino"),
            Radio(
              value: "f",
              groupValue: _escolha,
              onChanged: (escolha) {
                setState(() {
                  _escolha = escolha!;
                });
                print(escolha);
              },
            ),
            RadioListTile(
              title: Text("Masculino"),
              value: "m",
              groupValue: _escolha,
              onChanged: (escolha) {
                setState(() {
                  _escolha = escolha!;
                });
                print(escolha);
              },
            ),
            RadioListTile(
              title: Text("Feminino"),
              value: "f",
              groupValue: _escolha,
              onChanged: (escolha) {
                setState(() {
                  _escolha = escolha!;
                });
                print(escolha);
              },
            ),
            ElevatedButton(
              onPressed: () {
                print(_escolha);
              },
              child: const Text(
                "Salvar",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
