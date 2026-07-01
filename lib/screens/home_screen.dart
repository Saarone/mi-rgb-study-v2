import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameProvider>(context);
    final TextEditingController notaController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("INICIO", style: TextStyle(color: Colors.white, fontFamily: 'Courier')),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TARJETA DE PERFIL (Estilo RPG con sombra y bordes)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.greenAccent.withOpacity(0.5)),
                boxShadow: [BoxShadow(color: Colors.greenAccent.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 5))],
              ),
              child: Column(
                children: [
                  Text("PERFIL: ${game.nombre}", 
                       style: const TextStyle(fontSize: 22, color: Colors.greenAccent, fontFamily: 'Courier', fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  // ANIMACIÓN DE NIVEL
                  TweenAnimationBuilder<int>(
                    tween: IntTween(begin: 0, end: game.exp),
                    duration: const Duration(seconds: 1),
                    builder: (context, value, child) => Text('EXP: $value | MONEDAS: ${game.monedas}', 
                         style: const TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Courier')),
                  ),
                  const SizedBox(height: 15),
                  // BARRA DE PROGRESO
                  LinearProgressIndicator(
                    value: game.progresoNivel.clamp(0.0, 1.0),
                    backgroundColor: Colors.black,
                    valueColor: AlwaysStoppedAnimation<Color>(game.progresoNivel < 0.5 ? Colors.redAccent : Colors.greenAccent),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // CAMPO NOTAS
            TextField(
              controller: notaController,
              style: const TextStyle(color: Colors.white, fontFamily: 'Courier'),
              decoration: const InputDecoration(
                hintText: "Nueva nota...", 
                hintStyle: TextStyle(color: Colors.grey), 
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.greenAccent))
              ),
              onSubmitted: (value) { if (value.isNotEmpty) { game.agregarNota(value); notaController.clear(); } },
            ),
            
            const SizedBox(height: 10),
            
            Expanded(
              child: ListView.builder(
                itemCount: game.notas.length,
                itemBuilder: (ctx, i) => Card(
                  color: Colors.grey[900],
                  child: ListTile(
                    title: Text("> ${game.notas[i]}", style: const TextStyle(color: Colors.white, fontFamily: 'Courier')),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}