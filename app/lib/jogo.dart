// ignore_for_file:  avoid_print, unused_field, prefer_final_fields, prefer_const_constructors, unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage('assets/padrao.png');
  var _mensagem = 'Escolha uma opção abaixo.';
  var _escolhaAppText = '';

  // Função que captura a escolha do usuário
  void _opcaopSelecionada(String escolhaUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case 'pedra':
        setState(() {
          _imagemApp = AssetImage('assets/pedra.png');
        });
        break;
      case 'papel':
        setState(() {
          _imagemApp = AssetImage('assets/papel.png');
        });
        break;
      case 'tesoura':
        setState(() {
          _imagemApp = AssetImage('assets/tesoura.png');
        });
        break;
    }

    if ((escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'tesoura' && escolhaApp == 'papel') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra')) {
      setState(() {
        _mensagem = 'Parabéns você Ganhou';
        _escolhaAppText = escolhaApp;
      });
    } else if ((escolhaApp == 'pedra' && escolhaUsuario == 'tesoura') ||
        (escolhaApp == 'tesoura' && escolhaUsuario == 'papel') ||
        (escolhaApp == 'papel' && escolhaUsuario == 'pedra')) {
      setState(() {
        _mensagem = 'Você perdeu a IA ganhou!';
        _escolhaAppText = escolhaApp;
      });
    } else {
      setState(() {
        _mensagem = 'Empate!';
        _escolhaAppText = escolhaApp;
      });
    }
  }

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
              'Escolha do App: $_escolhaAppText',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: _imagemApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
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
              // Detector de Gestos / eventListener
              GestureDetector(
                // No Clique unico chama a função, passando o parâmetro
                onTap: () => _opcaopSelecionada('pedra'),
                // Elemento que recebe o Evento
                child: Image.asset(
                  'assets/pedra.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                // No Clique unico chama a função, passando o parâmetro
                onTap: () => _opcaopSelecionada('papel'),
                // Elemento que recebe o Evento
                child: Image.asset(
                  'assets/papel.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                // No Clique unico chama a função, passando o parâmetro
                onTap: () => _opcaopSelecionada('tesoura'),
                // Elemento que recebe o Evento
                child: Image.asset(
                  'assets/tesoura.png',
                  height: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
