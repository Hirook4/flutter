import 'package:flutter/material.dart';

//Criando uma classe de pesquisa, cada metodo constroi determinada estrutura de uma pesquisa
class CustomSearchDelegate extends SearchDelegate<String> {
  @override //Cria açoes dentro do menu de pesquisa
  List<Widget>? buildActions(BuildContext context) {
    return [
      //Limpar campo de pesquisa
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override //Botao para trocar tela
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context,
              ""); //Aqui podemos capturar a informação quando a tela é fechada
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      close(context, query); //Capturando o que foi digitado
    });
    return Container();
  }

  @override //Sugestoes de pesquisa
  Widget buildSuggestions(BuildContext context) {
    /* print("Digitado $query"); */
    return Container();

    /* List<String> lista = List();
    if (query.isNotEmpty) {
      lista = ["Lua", "Espaço", "Marte", "Dota 2"]
          .where((texto) => texto.toLowerCase().startsWith(query.toLowerCase()))
          .toList();

      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              close(context, lista[index]);
            },
            title: Text(lista[index]),
          );
        },
      );
    } else {
      return Center(
        child: Text("Nenhum resultado para a pesquisa"),
      );
    } */
  }
}
