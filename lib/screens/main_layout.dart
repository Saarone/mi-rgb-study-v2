import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'misiones_screen.dart';
import 'pomodoro_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _index = 0;
  final List<Widget> _screens = [
    const HomeScreen(), 
    const MisionesScreen(), 
    const Scaffold(backgroundColor: Colors.black, body: Center(child: Text("TIENDA", style: TextStyle(color: Colors.white)))), 
    const PomodoroScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed, // Esto evita problemas con 4 elementos
        backgroundColor: Colors.black, // Fondo negro para el menú
        selectedItemColor: Colors.greenAccent, // Color cuando está seleccionado
        unselectedItemColor: Colors.grey, // Color cuando no está seleccionado
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'INICIO'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'MISIONES'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'TIENDA'),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'RELOJ'),
        ],
      ),
    );
  }
}