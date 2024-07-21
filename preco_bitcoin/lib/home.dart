import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String valor = "";
  String preco = "0";
  void recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));

    //Recupera os dados da API
    Map<String, dynamic> retorno = json.decode(response.body);
    print(retorno["BRL"]["buy"].toString());

    setState(() {
      valor = retorno["BRL"]["buy"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consumindo API"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 150, 0),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/bitcoin.png"),
                Padding(
                  padding: const EdgeInsets.only(bottom: 55),
                  child: Text(
                    "R\$ $valor",
                    style: const TextStyle(fontSize: 35),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
                    ),
                    onPressed: recuperarPreco,
                    child: const Text(
                      "Atualizar",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
