import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_calc/constants/app_constants.dart';
import 'package:health_calc/constants/text_style.dart';
import 'package:health_calc/model/exercicio.dart';
//import 'package:flutter_gifimage/flutter_gifimage.dart';

class DetalhesExercicios extends StatelessWidget {
  final Exercicio exercicio;
  DetalhesExercicios(this.exercicio);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            exercicio.name,
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
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "Nome: " + exercicio.name,
                style: detalhesStyle,
              ),
            ),
            Container(
              child: Text(
                "Parte do corpo: " + exercicio.bodyPart,
                style: detalhesStyle,
              ),
            ),
            Container(
              child: Text(
                "Equipamento: " + exercicio.equipment,
                style: detalhesStyle,
              ),
            ),
            Container(
                child: Image.network(
              exercicio.gifUrl,
              width: 300,
              height: 400,
              fit: BoxFit.contain,
            ))
          ],
        )));
  }
}
