import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  const Questionario({
    super.key,
    required this.questao,
    required this.opcoes,
    this.aoSelecionarOpcao,
  });

  final String questao;
  final List<String> opcoes;
  final void Function(int index)? aoSelecionarOpcao;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questao(texto: questao),
        ...opcoes.asMap().entries.map((entry) {
          final texto = entry.value;
          final index = entry.key;
          return Resposta(
            texto: texto,
            onPressed: aoSelecionarOpcao != null
                ? () => aoSelecionarOpcao!(index)
                : null,
          );
        })
      ],
    );
  }
}
