import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/pages/login.dart';
import '../models/receita.dart';
import '../widgets/receita_card.dart';
import 'receitas/detalhes_receita.dart'; // Importa a tela de detalhes
import 'package:flutter_application_1/pages/receitas/buscar_receitas.dart';

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
          'https://www.receitasnestle.com.br/images/default-source/recipes/salada-de-frango-com-creme-de-leite.jpg',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas'),
        actions: [
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
          return ReceitaCard(
            receita: receitas[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          DetalhesReceitaPage(receita: receitas[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
