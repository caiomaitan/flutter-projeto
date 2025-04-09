import 'dart:math';
import 'package:flutter/material.dart';
import '../../../models/receita.dart';
import '../../../widgets/receita_card.dart';

class SugestaoDiaPage extends StatelessWidget {
  final List<Receita> receitas;

  const SugestaoDiaPage({super.key, required this.receitas});

  @override
  Widget build(BuildContext context) {
    if (receitas.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Sugestão do Dia')),
        body: const Center(child: Text('Nenhuma receita disponível.')),
      );
    }

    final random = Random();
    final receitaAleatoria = receitas[random.nextInt(receitas.length)];

    return Scaffold(
      appBar: AppBar(title: const Text('Sugestão do Dia')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ReceitaCard(receita: receitaAleatoria),
        ),
      ),
    );
  }
}
