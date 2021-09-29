import 'package:flutter/material.dart';
import 'package:health_calc/constants/app_constants.dart';
import 'package:health_calc/constants/text_style.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_calc/screens/detalhes_exercicios.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:health_calc/model/exercicio.dart';

class Exercicios extends StatefulWidget {
  @override
  _ExerciciosState createState() => new _ExerciciosState();
}

class _ExerciciosState extends State<Exercicios> {
  static const Map<String, String> _headers = {
    "content-type": "application/json",
    "x-rapidapi-host": "exercisedb.p.rapidapi.com",
    "x-rapidapi-key": "5ea54f7129msh1328e28a31f89cbp1698a8jsnadbe655cc5a9",
  };
  Future<List<Exercicio>> _getExercicios() async {
    var response = await http.get(
        Uri.parse("https://exercisedb.p.rapidapi.com/exercises"),
        headers: _headers);
    var jsonData = json.decode(response.body);
    print(jsonData);
    List<Exercicio> exercicios = [];
    for (var u in jsonData) {
      Exercicio exercicio =
          Exercicio(u['name'], u['bodyPart'], u['equipment'], u['gifUrl']);
      exercicios.add(exercicio);
    }

    return exercicios;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Exercícios",
          style: titleStyle,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.light),
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
      body: Container(
        child: FutureBuilder(
          future: _getExercicios(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                  child:
                      Center(child: Text("Carregando...", style: titleStyle)));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].name, style: titleStyle),
                    subtitle:
                        Text(snapshot.data[index].bodyPart, style: radioStyle),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetalhesExercicios(snapshot.data[index])));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
