import 'package:flutter/material.dart';
import '../../models/receita.dart';

class DetalhesReceitaPage extends StatelessWidget {
  final Receita receita;

  const DetalhesReceitaPage({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receita.titulo)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(receita.imagemUrl),
            const SizedBox(height: 16),
            Text(
              receita.titulo,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              receita.descricao,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Ingredientes',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...receita.ingredientes.map(
              (ingrediente) => Text('- $ingrediente'),
            ),
            const SizedBox(height: 16),
            Text(
              'Modo de Preparo',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...receita.modoPreparo.asMap().entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text('${entry.key + 1}. ${entry.value}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
