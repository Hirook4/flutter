import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  const TelaCliente({super.key});

  @override
  State<TelaCliente> createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 40, 55),
      appBar: AppBar(
        title: const Text('LH Consultoria - Clientes'),
        backgroundColor: const Color.fromARGB(255, 55, 55, 55),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/detalhe_cliente.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Clientes',
                      style: TextStyle(fontSize: 25, color: Colors.lightGreen),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Image(
                      image: AssetImage("assets/cliente1.png"),
                    ),
                  ),
                  Text(
                    'Cliente 1',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Image(
                      image: AssetImage("assets/cliente2.png"),
                    ),
                  ),
                  Text(
                    'Cliente 2',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
