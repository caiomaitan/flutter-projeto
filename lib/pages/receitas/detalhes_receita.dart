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
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(receita.descricao, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
