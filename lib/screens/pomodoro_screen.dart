import 'dart:async';
import 'package:flutter/material.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});
  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  int _seg = 50 * 60;
  Timer? _timer;
  bool _corriendo = false;

  void _toggle() {
    if (_corriendo) { _timer?.cancel(); } 
    else { _timer = Timer.periodic(const Duration(seconds: 1), (t) => setState(() => _seg--)); }
    setState(() => _corriendo = !_corriendo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.greenAccent, width: 4))),
        child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("${(_seg~/60).toString().padLeft(2,'0')}:${(_seg%60).toString().padLeft(2,'0')}", 
               style: const TextStyle(fontSize: 80, fontFamily: 'Courier', color: Colors.greenAccent)),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _toggle, child: Text(_corriendo ? "PAUSA" : "INICIAR"))
        ])),
      ),
    );
  }
}