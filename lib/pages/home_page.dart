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
import 'package:flutter_application_1/pages/receitas/sugestao_dia.dart';
import 'package:flutter_application_1/pages/sobre_page.dart';

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
          'https://www.receitasnestle.com.br/sites/default/files/styles/cropped_recipe_card_new/public/srh_recipes/2f56a7c0de24bc97e5aae83aa6621c8b.webp?itok=AyjyULZY',
      ingredientes: [
        '250g de macarrão',
        '1 colher de sopa de óleo',
        '1 dente de alho picado',
        '1/2 cebola picada',
        '1 tomate picado',
        'Sal e pimenta a gosto',
      ],
      modoPreparo: [
        'Cozinhe o macarrão conforme a embalagem.',
        'Refogue o alho e a cebola no óleo.',
        'Adicione o tomate e cozinhe por 5 minutos.',
        'Misture o macarrão cozido e tempere a gosto.',
      ],
    ),
    Receita(
      titulo: 'Salada Refrescante',
      descricao: 'Leve e saudável para o verão.',
      imagemUrl:
          'https://www.receitasnestle.com.br/sites/default/files/styles/cropped_recipe_card_new/public/srh_recipes/652397ffb615cb6fddf2d064deff9224.webp?itok=X4nveWfU',
      ingredientes: [
        '1 alface americana',
        '1 cenoura ralada',
        '1/2 pepino fatiado',
        'Tomatinhos cereja',
        'Azeite, sal e limão a gosto',
      ],
      modoPreparo: [
        'Lave bem todos os ingredientes.',
        'Misture tudo em uma tigela.',
        'Tempere com azeite, sal e limão.',
      ],
    ),
    Receita(
      titulo: 'Omelete de Forno',
      descricao: 'Simples, rápido e muito saboroso.',
      imagemUrl:
          'https://www.receitasnestle.com.br/sites/default/files/styles/cropped_recipe_card_new/public/srh_recipes/84e74d31aafc05a47d5421651f004339.webp?itok=RqSspabd',
      ingredientes: [
        '4 ovos',
        '1/2 xícara de leite',
        '1/2 cenoura ralada',
        '1/2 cebola picada',
        'Sal e pimenta a gosto',
        'Queijo ralado (opcional)',
      ],
      modoPreparo: [
        'Bata os ovos com o leite.',
        'Adicione os legumes e tempere.',
        'Coloque em uma assadeira untada e leve ao forno a 200ºC por 25 minutos.',
      ],
    ),
    Receita(
      titulo: 'Panqueca de Carne',
      descricao: 'Recheio delicioso e massa leve.',
      imagemUrl:
          'https://www.receitasnestle.com.br/sites/default/files/styles/cropped_recipe_card_new/public/srh_recipes/2df63786d5740bc49f00eb462ea827f1.webp?itok=kEz5LD5E',
      ingredientes: [
        '1 xícara de leite',
        '1 ovo',
        '1 xícara de farinha de trigo',
        '300g de carne moída',
        '1/2 cebola picada',
        'Molho de tomate a gosto',
      ],
      modoPreparo: [
        'Bata os ingredientes da massa e frite em frigideira antiaderente.',
        'Refogue a carne com cebola e temperos.',
        'Recheie as panquecas, enrole e cubra com molho.',
        'Leve ao forno por 10 minutos.',
      ],
    ),
    Receita(
      titulo: 'Strogonoff de Frango',
      descricao: 'Clássico que agrada todo mundo.',
      imagemUrl:
          'https://www.receitasnestle.com.br/sites/default/files/styles/cropped_recipe_card_new/public/srh_recipes/abdd2c3a8f46b3b086d51c0d21d623eb.webp?itok=FxXvJRnQ',
      ingredientes: [
        '500g de peito de frango em cubos',
        '1 cebola picada',
        '2 colheres de ketchup',
        '1 colher de mostarda',
        '1 caixinha de creme de leite',
        'Sal e pimenta a gosto',
      ],
      modoPreparo: [
        'Refogue o frango com cebola até dourar.',
        'Adicione ketchup, mostarda e cozinhe por 5 minutos.',
        'Acrescente o creme de leite, misture bem e desligue.',
      ],
    ),
    Receita(
      titulo: 'Bolo de Cenoura',
      descricao: 'Perfeito para o café da tarde.',
      imagemUrl:
          'https://www.receitasnestle.com.br/sites/default/files/styles/cropped_recipe_card_new/public/srh_recipes/9c1eb88a28d8f919a0db73b88e6f92a1.webp?itok=xmvU614r',
      ingredientes: [
        '3 cenouras médias',
        '3 ovos',
        '1 xícara de óleo',
        '2 xícaras de açúcar',
        '2 e 1/2 xícaras de farinha de trigo',
        '1 colher de fermento em pó',
      ],
      modoPreparo: [
        'Bata no liquidificador as cenouras, ovos e óleo.',
        'Adicione o açúcar, farinha e fermento.',
        'Asse em forno pré-aquecido a 180ºC por 40 minutos.',
      ],
    ),
    Receita(
      titulo: 'Tapioca com Queijo',
      descricao: 'Simples, rápida e deliciosa.',
      imagemUrl:
          'https://www.receitasnestle.com.br/sites/default/files/styles/cropped_recipe_card_new/public/srh_recipes/d2efda786ba66fd008b2b2349dfc6043.webp?itok=8lEneTw0',
      ingredientes: [
        '2 colheres de goma de tapioca',
        'Queijo mussarela a gosto',
        'Tomate em rodelas (opcional)',
        'Orégano a gosto',
      ],
      modoPreparo: [
        'Aqueça a frigideira e espalhe a goma.',
        'Quando firmar, adicione o queijo e o tomate.',
        'Dobre ao meio e sirva quente.',
      ],
    ),
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
            icon: const Icon(Icons.info_outline),
            tooltip: 'Sobre o app',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SobrePage()),
              );
            },
          ),

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
            icon: const Icon(Icons.lightbulb),
            tooltip: 'Sugestão do Dia',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SugestaoDiaPage(receitas: receitas),
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
