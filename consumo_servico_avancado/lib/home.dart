// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Future diz respeito a dados que ainda vamos recuperar
  //FutureBuilder carrega os dados e voce consegue definir se deu certo ou nao
  Future<Map> recuperarPreco() async {
    String url = 'https://blockchain.info/ticker';
    http.Response response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      //Snapshot sao os dados da requisicao
      future: recuperarPreco(),
      builder: (context, snapshot) {
        String resultado = "";
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            print("none");
            break;
          case ConnectionState.waiting: //Aguarda a Conexao
            print("waiting");
            resultado = "Carregando...";
            break;
          case ConnectionState.active:
            print("active");
            break;
          case ConnectionState.done: //Finaliza a Conexao
            print("done");
            if (snapshot.hasError) {
              resultado = "Erro ao Carregar os Dados";
            } else {
              double valor = snapshot.data!["BRL"]["buy"];
              resultado = "Preço do Bitcoin : ${valor.toString()}";
            }
            break;
        }
        return Center(
          child: Text(resultado),
        );
      },
    );
  }
}
