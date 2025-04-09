import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';
import 'providers/receita_providers.dart';
import 'pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    DevicePreview(
      enabled: true,
      builder:
          (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => FavoritosProvider()),
            ],
            child: const MyApp(),
          ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'PratoPronto',
      theme: ThemeData(
        primaryColor: const Color(0xFFB388EB), // Lavanda suave
        scaffoldBackgroundColor: const Color(0xFFFCF5FF), // Fundo claro
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFB388EB),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFFFF6B6B), // Vermelho coral
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
          bodySmall: TextStyle(color: Colors.grey),
        ),
        cardColor: Colors.white,
        cardTheme: CardTheme(
          shadowColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
