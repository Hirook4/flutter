import 'package:flutter/material.dart';
import 'package:navigation/tela_secundaria.dart';

void main() {
  runApp(const MaterialApp(
    home: TelaPrincipal(),
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
        title: Text("Tela Principal"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(35),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaSecundaria()));
              },
              child: Text("Ir para segunda tela"),
            )
          ],
        ),
      ),
    );
  }
}
