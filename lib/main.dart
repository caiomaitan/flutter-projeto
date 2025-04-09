import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart'; // Importante
import 'providers/receita_providers.dart'; // Importante
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
      title: 'Meu App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
