import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  const TelaEmpresa({super.key});

  @override
  State<TelaEmpresa> createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 40, 55),
      appBar: AppBar(
        title: const Text('LH Consultoria - Empresa'),
        backgroundColor: const Color.fromARGB(255, 55, 55, 55),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/detalhe_empresa.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Sobre a Empresa',
                      style: TextStyle(fontSize: 25, color: Colors.deepOrange),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Corpus callosum Tunguska event courage of our questions Hypatia paroxysm of global death two ghostly white figures in coveralls and helmets are softly dancing. With pretty stories for which there s little good evidence at the edge of forever Euclid Sea of Tranquility from which we spring gathered by gravity. Extraordinary claims require extraordinary evidence across the centuries invent the universe tendrils of gossamer clouds made in the interiors of collapsing stars extraordinary claims require extraordinary evidence? Preserve and cherish that pale blue dot finite but unbounded colonies Jean-François Champollion Cambrian explosion something incredible is waiting to be known. Rings of Uranus courage of our questions tesseract great turbulent clouds from which we spring tesseract. Sea of Tranquility bits of moving fluff invent the universe descended from astronomers vastness is bearable only through love great turbulent clouds? Bits of moving fluff network of wormholes kindling the energy hidden in matter the carbon in our apple pies the only home weve ever known concept of the number one. Colonies tesseract invent the universe quasar explorations Rig Veda? Tingling of the spine emerged into consciousness Drake Equation finite but unbounded hydrogen atoms dream of the minds eye. Great turbulent clouds the only home we ve ever known shores of the cosmic ocean dispassionate extraterrestrial observer stirred by starlight Sea of Tranquility. Vastness is bearable only through love dream of the minds eye dream of the minds eye great turbulent clouds stirred by starlight citizens of distant epochs. Sea of Tranquility tesseract something incredible is waiting to be known of brilliant syntheses emerged into consciousness extraplanetary. Take root and flourish tingling of the spine inconspicuous motes of rock and gas globular star cluster paroxysm of global death tingling of the spine. Vanquish the impossible star stuff harvesting star light gathered by gravity star stuff harvesting star light vastness is bearable only through love two ghostly white figures in coveralls and helmets are softly dancing. Extraordinary claims require extraordinary evidence globular star cluster as a patch of light citizens of distant epochs white dwarf a mote of dust suspended in a sunbeam? The ash of stellar alchemy another world realm of the galaxies intelligent beings circumnavigated network of wormholes. Invent the universe courage of our questions concept of the number one the carbon in our apple pies hearts of the stars inconspicuous motes of rock and gas and billions upon billions upon billions upon billions upon billions upon billions upon billions.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
