import 'package:flutter/material.dart';

class campo extends StatefulWidget {
  const campo({super.key});

  @override
  State<campo> createState() => _campoState();
}

class _campoState extends State<campo> {
  //Instanciando controller da linha 33
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de Dados"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: TextField(
              //text, number, emailAdress, datetime
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.black, fontSize: 20),
              decoration: const InputDecoration(labelText: "Digite um Valor"),
              enabled: true,
              maxLength: 10,
              obscureText: true,
              onChanged: (String texto) => {print("Digitou: $texto")},
              onSubmitted: (String texto) => {print("Valor Enviado: $texto")},
              //controller tem acesso a o que foi digitado e consegue fazer varias coisas com o conteudo
              controller: _textEditingController,
            ),
          ),
          ElevatedButton(
            child: const Text("Salvar"),
            onPressed: () {
              print("Valor Enviado: " + _textEditingController.text);
            },
          )
        ],
      ),
    );
  }
}
