import 'package:conexcrudfirebase/homePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constantes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp().then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Notas',
        theme: ThemeData(
          primarySwatch: colorCustom,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
