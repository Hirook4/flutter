import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TelaSecundaria extends StatelessWidget {
  const TelaSecundaria({super.key});

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
            const Text("Segunda Tela"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              child: const Text("Ir para primeira tela"),
            )
          ],
        ),
      ),
    );
  }
}
