import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/game_provider.dart';
import 'screens/main_layout.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (_) => GameProvider(),
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
        primaryColor: Colors.greenAccent,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Courier', fontSize: 16, color: Colors.greenAccent),
          titleLarge: TextStyle(fontFamily: 'Courier', fontSize: 24, fontWeight: FontWeight.bold),
        ),
        // Botones estilo bloque
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[900],
            foregroundColor: Colors.greenAccent,
            shape: const BeveledRectangleBorder(), // Bordes cortados estilo retro
            side: const BorderSide(color: Colors.greenAccent, width: 2),
          ),
        ),
      ),
      home: const MainLayout(),
    );
  }
}