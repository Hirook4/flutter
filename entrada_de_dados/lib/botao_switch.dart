import 'package:flutter/material.dart';

class BotaoSwitch extends StatefulWidget {
  const BotaoSwitch({super.key});

  @override
  State<BotaoSwitch> createState() => _BotaoSwitchState();
}

class _BotaoSwitchState extends State<BotaoSwitch> {
  bool notifica = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de Dados"),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: [
            Switch(
              value: notifica,
              onChanged: (bool valor) {
                setState(() {
                  notifica = valor;
                });
              },
            ),
            const Text("Switch"),
            SwitchListTile(
              title: const Text("SwitchListTile"),
              value: notifica,
              onChanged: (bool valor) {
                setState(() {
                  notifica = valor;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                print(notifica);
              },
              child: const Text("Salvar"),
            )
          ],
        ),
      ),
    );
  }
}
