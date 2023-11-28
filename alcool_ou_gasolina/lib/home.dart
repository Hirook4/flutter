import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();
  String _resultado = "Resultado";

  void _calcular() {
    //Pegando a informação do TextField e convertendo para numero
    double precoAlcool = double.parse(_controllerAlcool.text);
    double precoGasolina = double.parse(_controllerGasolina.text);

    // ignore: unnecessary_null_comparison
    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _resultado = "Numero Invalido";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _resultado = "Compensa Gasolina";
        });
      } else {
        setState(() {
          _resultado = "Compensa Alcool";
        });
      }
      //Esconde o teclado após fazer calculo
      FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      _limparCampos();
    }
  }

  void _limparCampos() {
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alcool ou Gasolina"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 55, 55, 55),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Image(image: AssetImage("assets/logo.png")),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Saiba qual a melhor opção de combustivel!",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Preço Alcool"),
                  style: const TextStyle(fontSize: 20),
                  controller: _controllerAlcool,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration:
                      const InputDecoration(labelText: "Preço Gasolina"),
                  style: const TextStyle(fontSize: 20),
                  controller: _controllerGasolina,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: _calcular,
                    child: const Text(
                      "Calcular",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  textAlign: TextAlign.center,
                  _resultado,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
