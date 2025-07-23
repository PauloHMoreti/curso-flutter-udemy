import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntasApp());

class PerguntasAppState extends State<PerguntasApp> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      "texto": "Qual sua cor favorita?",
      "respostas": [
        {"texto": "Preto", "pontuacao": 5},
        {"texto": "Branco", "pontuacao": 5},
        {"texto": "Vermelho", "pontuacao": 8},
        {"texto": "Azul", "pontuacao": 10},
      ],
    },
    {
      "texto": "Qual seu animal favorito?",
      "respostas": [
        {"texto": "Leão", "pontuacao": 5},
        {"texto": "Cobra", "pontuacao": 8},
        {"texto": "Tigre", "pontuacao": 2},
        {"texto": "Cachorro", "pontuacao": 10},
      ],
    },
    {
      "texto": "Qual seu personagem favorito?",
      "respostas": [
        {"texto": "Sonic", "pontuacao": 10},
        {"texto": "Mario", "pontuacao": 8},
        {"texto": "Donkey Kong", "pontuacao": 6},
        {"texto": "Alex Kidd", "pontuacao": 4},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void restartForm() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Perguntas")),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: responder,
              )
            : Resultado(_pontuacaoTotal, restartForm),
      ),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({super.key});

  @override
  PerguntasAppState createState() {
    return PerguntasAppState();
  }
}
