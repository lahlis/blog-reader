import 'package:blog/core/secrets/app_secrets.dart';
import 'package:blog/core/theme/theme.dart';
import 'package:blog/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
 final WidgetsBinding binding = WidgetsFlutterBinding(); 
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}


/*
é preciso chamar o WidgetsFlutterBinding(), pois ele sempre é chamado durante o runApp.
porém, como tem processos para inicializar antes disso (o supabase.initialize), é preciso
chamar oWidgetsFlutterBinding() para garantir que tudo será inicializado corretamente
*/