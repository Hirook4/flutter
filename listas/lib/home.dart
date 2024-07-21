import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List itens = [];

  void carregarItens() {
    //Listagem de itens
    for (var i = 0; i <= 10; i++) {
      Map<String, dynamic> item = Map();
      item["titulo"] = "Titulo $i";
      item["descricao"] = "Descrição $i";
      itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    carregarItens();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          //Componente para listar itens
          child: ListView.builder(
            //Define quantidade de itens na lista
            itemCount: itens.length,
            itemBuilder: (context, indice) {
              //Estrutura criada para exibir itens
              return ListTile(
                onTap: () {
                  //print("tap $indice");
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(itens[indice]["titulo"]),
                          titlePadding: const EdgeInsets.all(20),
                          titleTextStyle: const TextStyle(
                              fontSize: 20, color: Colors.black),
                          content: Text(itens[indice]["descricao"]),
                          //contentTextStyle: TextStyle(fontSize: 30),
                          //backgroundColor: Colors.grey,
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                print("sim");
                              },
                              child: const Text("Sim"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                print("nao");
                                Navigator.pop(context);
                              },
                              child: const Text("Nao"),
                            )
                          ],
                        );
                      });
                },
                onLongPress: () {
                  print("longPress $indice");
                },
                title: Text(itens[indice]["titulo"]),
                subtitle: Text(itens[indice]["descricao"]),
              );
            },
          ),
        ),
      ),
    );
  }
}
