import 'package:flutter/material.dart';
import '../../../models/receita.dart';
import '../../../widgets/receita_card.dart';
import 'package:provider/provider.dart';
import '../../../providers/receita_providers.dart';

class FavoritasPage extends StatelessWidget {
  const FavoritasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritos = context.watch<FavoritosProvider>().favoritos;

    return Scaffold(
      appBar: AppBar(title: const Text('Receitas Favoritas')),
      body:
          favoritos.isEmpty
              ? const Center(child: Text('Nenhuma receita favorita ainda.'))
              : ListView.builder(
                itemCount: favoritos.length,
                itemBuilder: (context, index) {
                  final receita = favoritos[index];
                  return ReceitaCard(receita: receita);
                },
              ),
    );
  }
}
