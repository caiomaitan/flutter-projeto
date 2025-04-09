import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre o PratoPronto')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '🍽️ PratoPronto',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB388EB),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'O PratoPronto é um aplicativo desenvolvido com o objetivo de facilitar '
              'o dia a dia de quem busca receitas rápidas e práticas. O app permite '
              'explorar receitas, buscar pratos específicos, favoritar os favoritos e '
              'ainda receber sugestões diárias.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Desenvolvido por:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '• João Vitor\n• Caio Neves\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('Versão: 1.0.0', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
