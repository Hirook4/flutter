import 'package:flutter/material.dart';

class checkbox extends StatefulWidget {
  const checkbox({super.key});

  @override
  State<checkbox> createState() => _checkboxState();
}

class _checkboxState extends State<checkbox> {
  bool _brasileira = false;
  bool _japonesa = false;
  bool _mexicana = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de Dados"),
      ),
      body: Container(
        child: Column(
          children: [
            const Text("Comida Brasileira"),
            Checkbox(
              activeColor: Colors.green,
              //Estado inicial do checkbox
              value: _brasileira,
              onChanged: (valor) {
                setState(() {
                  _brasileira = valor!;
                });
                print("Checkbox $_brasileira");
              },
            ),
            CheckboxListTile(
              title: const Text("Comida Japonesa"),
              subtitle: const Text("Asiatica"),
              activeColor: Colors.redAccent,
              //selected: true,
              secondary: const Icon(Icons.food_bank),
              value: _japonesa,
              onChanged: (valor) {
                setState(() {
                  _japonesa = valor!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Comida Mexicana"),
              subtitle: const Text("Apimentada"),
              activeColor: Colors.orange,
              //selected: true,
              secondary: const Icon(Icons.food_bank),
              value: _mexicana,
              onChanged: (valor) {
                setState(() {
                  _mexicana = valor!;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                print(
                    "Comida Brasileira $_brasileira//Comida Japonesa $_japonesa//Comida Mexicana $_mexicana");
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
  }
}
