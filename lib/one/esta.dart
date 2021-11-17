import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Estita extends StatelessWidget {
  final String texto;
  const Estita(this.texto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(texto),
    );
  }
}
