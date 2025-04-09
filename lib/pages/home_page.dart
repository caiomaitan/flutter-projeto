import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/pages/login.dart';
import '../models/receita.dart';
import '../widgets/receita_card.dart';
import 'receitas/detalhes_receita.dart';
import 'receitas/buscar_receitas.dart';
import 'receitas/favoritas.dart'; // Importa a tela de favoritas
import 'package:provider/provider.dart';
import '../providers/receita_providers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          'data:image/jpeg;base64,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',
    ),
    // Adicione mais receitas aqui
  ];

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final favoritosProvider = Provider.of<FavoritosProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            tooltip: 'Favoritas',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritasPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BuscarReceitasPage(receitas: receitas),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
            tooltip: 'Sair',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: receitas.length,
        itemBuilder: (context, index) {
          final receita = receitas[index];
          final isFavorita = favoritosProvider.contem(receita);

          return ReceitaCard(
            receita: receita,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalhesReceitaPage(receita: receita),
                ),
              );
            },
            trailing: IconButton(
              icon: Icon(
                isFavorita ? Icons.favorite : Icons.favorite_border,
                color: isFavorita ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                favoritosProvider.alternarFavorito(receita);
              },
            ),
          );
        },
      ),
    );
  }
}
