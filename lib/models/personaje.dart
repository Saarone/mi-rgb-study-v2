import 'atributo.dart';

class Personaje {
  String nombre;
  int nivel;
  int exp;
  List<Atributo> atributos;

  Personaje({
    required this.nombre,
    this.nivel = 1,
    this.exp = 0,
    required this.atributos,
  });
}