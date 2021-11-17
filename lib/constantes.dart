import 'package:flutter/material.dart';

const MaterialColor colorCustom = MaterialColor(0xFF2C384A, color);

const Map<int, Color> color = {
  50: Color.fromRGBO(44, 56, 74, .1),
  100: Color.fromRGBO(44, 56, 74, .2),
  200: Color.fromRGBO(44, 56, 74, .3),
  300: Color.fromRGBO(44, 56, 74, .4),
  400: Color.fromRGBO(44, 56, 74, .5),
  500: Color.fromRGBO(44, 56, 74, .6),
  600: Color.fromRGBO(44, 56, 74, .7),
  700: Color.fromRGBO(44, 56, 74, .8),
  800: Color.fromRGBO(44, 56, 74, .9),
  900: Color.fromRGBO(44, 56, 74, 1),
};

class Constants {
  static const String Borrar = 'Borrar';
  static const String Salir = 'Salir';

  static const List<String> choices = <String>[Borrar, Salir];
}

List<IconData> icons = [
// The underscore declares a variable as private in dart.
  Icons.delete,
  Icons.close,
];
