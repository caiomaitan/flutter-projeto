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
      backgroundColor: const Color(0xFFFCF5FF), // Fundo claro
      appBar: AppBar(
        title: const Text('Recuperar Senha'),
        backgroundColor: const Color(0xFFB388EB),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.email, size: 100, color: Color(0xFFFF6B6B)),
            const SizedBox(height: 20),
            const Text(
              'Digite seu email para recuperar a senha:',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
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
                backgroundColor: const Color(0xFFB388EB),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
