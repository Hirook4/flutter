import 'package:flutter/material.dart';
import 'package:lh_consultoria/tela_cliente.dart';
import 'package:lh_consultoria/tela_contato.dart';
import 'package:lh_consultoria/tela_empresa.dart';
import 'package:lh_consultoria/tela_servico.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Abrindo telas
  void _abrirEmpresa() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const TelaEmpresa()));
  }

  void _abrirServico() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const TelaServico()));
  }

  void _abrirCliente() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const TelaCliente()));
  }

  void _abrirContato() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const TelaContato()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 40, 55),
      appBar: AppBar(
        title: const Text('LH Consultoria'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 55, 55, 55),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("assets/logo.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 100,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _abrirEmpresa,
                    child: const Image(
                      image: AssetImage("assets/menu_empresa.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: _abrirServico,
                    child: const Image(
                      image: AssetImage("assets/menu_servico.png"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _abrirCliente,
                    child: const Image(
                      image: AssetImage("assets/menu_cliente.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: _abrirContato,
                    child: const Image(
                      image: AssetImage("assets/menu_contato.png"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
