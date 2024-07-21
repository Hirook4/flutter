// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:youtube/custom_search_delegate.dart';
import 'package:youtube/telas/upload.dart';
import 'package:youtube/telas/shorts.dart';
import 'package:youtube/telas/homepage.dart';
import 'package:youtube/telas/subscription.dart';
import 'package:youtube/telas/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indexAtual = 0;
  String resultado = "";
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Homepage(resultado),
      const Shorts(),
      const Upload(),
      const Subscription(),
      const Profile(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/youtube.png",
          width: 125,
        ),
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.videocam),
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                String? res = await showSearch(
                    context: context, delegate: CustomSearchDelegate());
                setState(() {
                  resultado = res!;
                });
                /* print("resultado digitado $res"); */
              }),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: telas[indexAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexAtual,
        onTap: (index) {
          setState(() {
            indexAtual = index;
          });
        },
        type: BottomNavigationBarType
            .fixed, //Se não definir vai mudar para shifting a partir de 5 itens
        fixedColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Shorts",
            icon: Icon(Icons.play_arrow),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.add_circle_outline,
              size: 40,
            ),
          ),
          BottomNavigationBarItem(
            label: "Subscriptions",
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            label: "You",
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}
