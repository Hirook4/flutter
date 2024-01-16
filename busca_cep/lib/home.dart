import 'package:flutter/material.dart';
//Para esse projeto importamos essa dependencia no pubspec.yaml
import 'package:http/http.dart' as http;
//Para transformar String em JSON
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Controla o campo de entrada de texto, permite obter o texto atual, definir o texto atual, e ouvir alterações no texto
  final TextEditingController controllerCEP = TextEditingController();

  //Comunicação Síncrona sync é como uma conversa com uma pessoa, voce fala e a pessoa te responde
  //Comunicação Assíncrona async é como conversar por whatsapp, um de cada vez e com intervalos entre respostas
  String resultado = "Resultado";
  _recuperarCEP() async {
    String cep = controllerCEP.text;
    String url = "https://viacep.com.br/ws/$cep/json/";
    http.Response response;
    //await quer dizer que vamos aguardar a execução dessa resposta
    response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    String localidade = retorno["localidade"].toString();
    String uf = retorno["uf"].toString();
    String ddd = retorno["ddd"].toString();
    setState(() {
      resultado = "Cidade: $localidade \nUF: $uf \nDDD: $ddd";
    });
    //print("cidade: $localidade \nuf :$uf \nddd: $ddd");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Busca CEP"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 55, 55, 55),
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Digite o CEP"),
                style: const TextStyle(fontSize: 20),
                controller: controllerCEP,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 45),
              child: ElevatedButton(
                onPressed: _recuperarCEP,
                child: const Text("Buscar"),
              ),
            ),
            Text(
              resultado,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
