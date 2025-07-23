import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() restartForm;
  const Resultado(this.pontuacao, this.restartForm, {super.key});

  String get _fraseResultado {
    if (pontuacao < 8) {
      return "Parabéns!";
    } else if (pontuacao < 12) {
      return "Muito bom!";
    } else if (pontuacao < 16) {
      return "Impressionante";
    } else {
      return "Espetacular";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(_fraseResultado, style: TextStyle(fontSize: 28))),
        TextButton(
          onPressed: restartForm,
          child: Text("Reiniciar ?", style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
