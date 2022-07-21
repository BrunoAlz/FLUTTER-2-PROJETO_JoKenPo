// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jo - Ken - Po"),
      ),
      body: Column(
        // Centraliza os elementos da coluna
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do APP",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image.asset('assets/padrao.png'),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha uma Opção abaixo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            // Alinhamento das Imagens
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/pedra.png',
                height: 100,
              ),
              Image.asset(
                'assets/papel.png',
                height: 100,
              ),
              Image.asset(
                'assets/tesoura.png',
                height: 100,
              ),
            ],
          )
        ],
      ),
    );
  }
}
