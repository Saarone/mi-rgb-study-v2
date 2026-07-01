import 'package:flutter/material.dart';
import '../models/mision.dart';

class GameProvider extends ChangeNotifier {
  String nombre = "Aarón";
  int exp = 1250;
  int monedas = 540;
  List<String> notas = ["Estudiar Neuroanatomía", "Repasar TO"];

  Map<String, List<Mision>> misionesSemanales = {
    'Lunes': List.generate(5, (i) => Mision(titulo: 'Misión ${i+1}')),
    'Martes': List.generate(5, (i) => Mision(titulo: 'Misión ${i+1}')),
    'Miércoles': List.generate(5, (i) => Mision(titulo: 'Misión ${i+1}')),
    'Jueves': List.generate(5, (i) => Mision(titulo: 'Misión ${i+1}')),
    'Viernes': List.generate(5, (i) => Mision(titulo: 'Misión ${i+1}')),
    'Sábado': List.generate(5, (i) => Mision(titulo: 'Misión ${i+1}')),
    'Domingo': List.generate(5, (i) => Mision(titulo: 'Misión ${i+1}')),
  };

  // --- Lógica para la barra de progreso ---
  double get progresoNivel => exp / 2000.0; // Cambia 2000 por el tope de EXP de tu nivel

  // --- Métodos para notas y configuraciones ---
  void agregarNota(String nuevaNota) {
    notas.add(nuevaNota);
    notifyListeners();
  }

  void cambiarNombre(String nuevoNombre) {
    nombre = nuevoNombre;
    notifyListeners();
  }

  void editarMision(String dia, int index, String nuevoTitulo) {
    misionesSemanales[dia]![index].titulo = nuevoTitulo;
    notifyListeners();
  }
}