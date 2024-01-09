import 'package:flutter/material.dart';
import 'package:navigation/tela_secundaria.dart';

void main() {
  runApp(MaterialApp(
    //Rota inicial sera o main.dart, assim nao definimos home: const TelaPrincipal(),
    initialRoute: "/",
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => const TelaPrincipal(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/secundaria': (context) => const TelaSecundaria(),
    },
  ));
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  //Esse context ja é recebido pensando em fazer futuras navegações de telas
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Principal"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: [
            const Text("Primeira Tela"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/secundaria");
              },
              child: const Text("Ir para segunda tela"),
            )
          ],
        ),
      ),
    );
  }
}
