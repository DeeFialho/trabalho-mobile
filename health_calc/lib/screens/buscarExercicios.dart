import 'package:flutter/material.dart';
import 'package:health_calc/constants/app_constants.dart';
import 'package:health_calc/constants/text_style.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class BuscarExercicios extends StatefulWidget {
  @override
  _BuscarExerciciosState createState() => new _BuscarExerciciosState();
}

class _BuscarExerciciosState extends State<BuscarExercicios> {
  TextEditingController _controller = TextEditingController();

  late StreamController _streamController;
  late Stream _stream;

  @override
  void initState() {
    super.initState();

    _streamController = StreamController();
    _stream = _streamController.stream;
  }

  static const Map<String, String> _headers = {
    "content-type": "application/json",
    "x-rapidapi-host": "exercisedb.p.rapidapi.com",
    "x-rapidapi-key": "5ea54f7129msh1328e28a31f89cbp1698a8jsnadbe655cc5a9",
  };
  _search() async {
    if (_controller.text.length == 0) {
      _streamController.add(null);
      return;
    }

    _streamController.add("waiting");
    Response response = await http.get(
        Uri.parse("https://exercisedb.p.rapidapi.com/exercises/bodyPart/" +
            _controller.text.trim()),
        headers: _headers);
    var jsonData = json.decode(response.body);
    _streamController.add(jsonData);
    print(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buscar Exercícios"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Buscar parte do corpo",
                      contentPadding: const EdgeInsets.only(left: 24.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  _search();
                },
              )
            ],
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.light),
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: _stream,
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: Text("Digite uma parte do corpo"),
              );
            }

            if (snapshot.data == "waiting") {
              return Center(
                child: CircularProgressIndicator(
                  color: accentColor,
                ),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListBody(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      child: ListTile(
                        title: Text(snapshot.data[index]["name"],
                            style: titleStyle),
                        subtitle: Text(snapshot.data[index]["target"],
                            style: detalhesStyle),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
