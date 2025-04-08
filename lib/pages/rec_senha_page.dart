import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RecSenhaPage extends StatefulWidget {
  const RecSenhaPage({super.key});

  @override
  State<RecSenhaPage> createState() => _RecSenhaPageState();
}

class _RecSenhaPageState extends State<RecSenhaPage> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> _recuperarSenha() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email de recuperação enviado!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro ao enviar email: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recuperar Senha')),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Digite seu email para recuperar a senha:'),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _recuperarSenha,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
