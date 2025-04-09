import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'cadastro.dart';
import 'home_page.dart';
import 'rec_senha_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  Future<void> _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _senhaController.text.trim(),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro ao fazer login: $e')));
    }
  }

  void _irParaCadastro() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CadastroPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF5FF), // Fundo claro
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://images-ext-1.discordapp.net/external/N1yoSgIILhedm_9DIvc5SJCI6r6qTKtcPf6UbvLPfUQ/%3Fq%3Dtbn%3AANd9GcQ0QFNbpNHXVEKjqbe-YzTSRIZcRx0JlTrhyA%26s/https/encrypted-tbn0.gstatic.com/images?format=webp',
                  height: 140,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(color: Colors.black87),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFB388EB)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: const TextStyle(color: Colors.black87),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFB388EB)),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB388EB), // Lavanda
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Entrar'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: _irParaCadastro,
                child: const Text('Criar conta'),
                style: TextButton.styleFrom(foregroundColor: Color(0xFFFF6B6B)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RecSenhaPage(),
                    ),
                  );
                },
                child: const Text('Esqueci minha senha'),
                style: TextButton.styleFrom(foregroundColor: Color(0xFFFF6B6B)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
