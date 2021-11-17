import 'package:conexcrudfirebase/addStory.dart';
import 'package:conexcrudfirebase/addStory.dart';
import 'package:conexcrudfirebase/one/database.dart';
import 'package:conexcrudfirebase/mostrar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:focused_menu/focused_menu.dart';
import 'constantes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

bool indice = true;

class _HomePageState extends State<HomePage> {
  Database db = new Database();
  List docs = [];
  initialise() {
    db.initiliase();
    db.read().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  void eliminar(d) {
    print("liminadndo");
    db.delete(d);
    initialise();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notas App",
          style: TextStyle(color: Color(0xFFffcb2d)),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFF2b3849),
        child: ListView.builder(
          itemCount: docs.length,
          itemBuilder: (BuildContext contenxt, int index) {
            return Card(
              color: Color(0xFF404a5c),
              margin: EdgeInsets.all(10),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  View(country: docs[index], db: db)))
                      .then((value) => {
                            if (value != null) {initialise()}
                          });
                },
                contentPadding: EdgeInsets.only(right: 30, left: 36),
                title: Text(
                  docs[index]['name'],
                  style: TextStyle(color: Color(0xFFffcb2d)),
                ),
                trailing: Theme(
                  data: Theme.of(context).copyWith(
                    cardColor: Color(0xFFffcb2d),
                  ),
                  child: new PopupMenuButton<String>(
                    child: Icon(
                      Icons.delete,
                      color: Color(0xFFff5252),
                    ),
                    onSelected: (result) {
                      print(result);
                      if (result == 'Borrar') {
                        setState(() {
                          eliminar(docs[index]['id']);
                        });
                        Fluttertoast.showToast(msg: "Nota borrada");
                      }
                    },
                    //onSelected: choiceAction,
                    itemBuilder: (BuildContext context) {
                      return Constants.choices.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Row(
                            children: [
                              GestureDetector(
                                child: Text(
                                  choice,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF2b3849),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.note_add),
                iconSize: 40,
                color: Color(0xFFffcb2d),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddStory())).then(
                    (value) => {
                      if (value != null) {initialise()}
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void choiceAction(String choice) {
  print('choice');
}

/**
    IconButton(
    icon: Icon(
    Icons.delete,
    color: Color(0xFFff5252), //ff5252
    ),
    tooltip: 'Eliminar item',
    onPressed: () {
    setState(
    () {
    eliminar(docs[index]['id']);
    },
    );
    },
    ),
 * */
