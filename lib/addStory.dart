import 'package:conexcrudfirebase/one/database.dart';
import 'package:conexcrudfirebase/one/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddStory extends StatefulWidget {
  AddStory({Key? key}) : super(key: key);
  Database db = new Database();
  @override
  _AddStoryState createState() => _AddStoryState();
}

class _AddStoryState extends State<AddStory> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController codeController = new TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b3849),
      appBar: AppBar(
        backgroundColor: Color(0xFF2b3849),
        title: Center(
          child: Text(
            "Nueva Nota",
            style: TextStyle(color: Color(0xFFffcb2d)),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                null,
                color: Color(0xFFff5252),
              ),
              onPressed: () {
                // widget.db.delete(widget.country["id"]);
                // Navigator.pop(context, true);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 18),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Titulo',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.white, // set border color
                      width: 3.0), // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // set rounded corner radius
                ),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(splashColor: Colors.transparent),
                  child: TextFormField(
                    autofocus: false,
                    style: TextStyle(fontSize: 22.0, color: Color(0xFF2c384a)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Titulo (Sintesis)',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                    controller: nameController,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Descripcion',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.white, // set border color
                      width: 3.0), // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // set rounded corner radius
                ),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(splashColor: Colors.transparent),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1, //Normal textInputField will be displayed
                    maxLines: 15,
                    autofocus: false,
                    style: TextStyle(fontSize: 22.0, color: Color(0xFF2c384a)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Nota',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                    controller: codeController,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 16.0, left: 16.0, top: 10.0),
                child: GestureDetector(
                  child: Container(
                    child: Center(
                      child: Text(
                        'Guardar',
                        textScaleFactor: 2,
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber,
                      boxShadow: [
                        BoxShadow(color: Colors.amber, spreadRadius: 3),
                      ],
                    ),
                    height: 50,
                  ),
                  onTap: () {
                    widget.db.create(nameController.text, codeController.text);
                    Navigator.pop(context, true);
                    Fluttertoast.showToast(
                      msg: "Nota creada",
                      backgroundColor: Colors.deepOrange,
                      textColor: Colors.red,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String labelText) {
    return InputDecoration(
      focusColor: Colors.white,
      labelStyle: TextStyle(color: Colors.white),
      labelText: labelText,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      ),
    );
  }
}
