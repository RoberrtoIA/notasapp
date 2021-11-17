import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conexcrudfirebase/one/esta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'database.dart';

class Views extends StatefulWidget {
  Views({Key? key}) : super(key: key);

  @override
  _ViewsState createState() => _ViewsState();
}

class _ViewsState extends State<Views> {
  TextEditingController txtc = new TextEditingController(text: "");

  void printfd() {
    print(txtc.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis historias"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: txtc,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.green,
                filled: true,
                hintText: "Ingrese info"),
          ),
          MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Estita(txtc.text)));
              },
              child: Text("pasrar otra")),
        ],
      ),
    );
  }
}
