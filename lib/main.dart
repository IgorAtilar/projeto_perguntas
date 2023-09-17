import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(const _PerguntaApp());

class _PerguntaApp extends StatefulWidget {
  const _PerguntaApp();

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<_PerguntaApp> {
  var _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

  final List<Map<String, dynamic>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {
          'texto': 'Preto',
          'pontuacao': 10,
        },
        {
          'texto': 'Vermelho',
          'pontuacao': 5,
        },
        {
          'texto': 'Verde',
          'pontuacao': 8,
        },
        {
          'texto': 'Branco',
          'pontuacao': 2,
        },
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {
          'texto': 'Coelho',
          'pontuacao': 5,
        },
        {
          'texto': 'Pato',
          'pontuacao': 10,
        },
        {
          'texto': 'Cobra',
          'pontuacao': 2,
        },
        {
          'texto': 'Leão',
          'pontuacao': 6,
        },
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {
          'texto': 'Maria',
          'pontuacao': 10,
        },
        {
          'texto': 'João',
          'pontuacao': 5,
        },
        {
          'texto': 'Gabriel',
          'pontuacao': 2,
        },
        {
          'texto': 'Rafael',
          'pontuacao': 7,
        },
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    final questao = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['texto'] as String
        : '';

    final List<Map<String, dynamic>> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : [];
    final opcoes =
        respostas.map<String>((resposta) => resposta['texto']).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                questao: questao,
                opcoes: opcoes,
                aoSelecionarOpcao: (index) {
                  int pontuacao = respostas[index]["pontuacao"] as int;
                  _responder(pontuacao);
                },
              )
            : Resultado(
                pontuacao: _pontuacaoTotal,
                quandoReiniciarQuestionario: _reiniciarQuestionario,
              ),
      ),
    );
  }
}
