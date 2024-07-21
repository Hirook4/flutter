// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:consumo_servico_avancado/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String _urlBase = "https://jsonplaceholder.typicode.com";

  //uma lista de objeto da classe post
  Future<List<Post>> _recuperarPostagem() async {
    http.Response response = await http.get(Uri.parse("$_urlBase/posts"));
    var dadosJson = json.decode(response.body);

    //criando lista e preenchendo
    List<Post> postagens = List.empty();
    for (var post in dadosJson) {
      print(post["title"]);
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }
    return postagens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consumo Serviço"),
      ),
      body: FutureBuilder<List<Post>>(
        //Snapshot sao os dados da requisicao
        future: _recuperarPostagem(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              print("none");
              break;
            case ConnectionState.waiting: //Aguarda a Conexao
              const CircularProgressIndicator();
              break;
            case ConnectionState.active:
              print("active");
              break;
            case ConnectionState.done: //Finaliza a Conexao
              print("done");
              if (snapshot.hasError) {
                print("Erro ao carregar lista");
              } else {
                print("Lista Carregada");
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      List<Post> lista = snapshot.data!;
                      Post post = lista[index];
                      return ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.body),
                      );
                    });
              }
              break;
          }
          return const Center(
            child: Text("Teste"),
          );
        },
      ),
    );
  }
}
