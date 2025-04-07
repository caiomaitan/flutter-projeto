//exemplo de list view
import 'package:flutter/material.dart';
import '../models/receita.dart';
import '../widgets/receita_card.dart';

class HomePage extends StatelessWidget {
  final List<Receita> receitas = [
    Receita(
      titulo: 'Macarrão Rápido',
      descricao: 'Pronto em 10 minutos, ideal para o almoço.',
      imagemUrl:
          'https://www.receitasnestle.com.br/images/default-source/recipes/macarrao-cremoso-com-legumes-receitas-nestle.jpg',
    ),
    Receita(
      titulo: 'Salada Refrescante',
      descricao: 'Leve e saudável para o verão.',
      imagemUrl:
          'https://www.receitasnestle.com.br/images/default-source/recipes/salada-de-frango-com-creme-de-leite.jpg',
    ),
    // Adicione mais receitas aqui
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Receitas')),
      body: ListView.builder(
        itemCount: receitas.length,
        itemBuilder: (context, index) {
          return ReceitaCard(receita: receitas[index]);
        },
      ),
    );
  }
}
