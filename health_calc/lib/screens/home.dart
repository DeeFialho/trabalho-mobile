import 'package:flutter/material.dart';
import 'package:health_calc/constants/app_constants.dart';
import 'package:health_calc/constants/text_style.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_calc/screens/buscarExercicios.dart';
import 'package:health_calc/screens/calorias.dart';
import 'package:health_calc/screens/tmb.dart';
import 'exercicios.dart';

import 'agua.dart';
import 'imc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Health Calc",
          style: titleStyle,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.light),
        //brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Calcular TMB'),
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Colors.teal,
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontStyle: FontStyle.italic),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tmb()),
                );
              },
            ),
            SizedBox(
              height: getScreenHeight(context) / 25,
            ),
            ElevatedButton(
              child: Text('Calcular IMC'),
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Colors.teal,
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontStyle: FontStyle.italic),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Imc()),
                );
              },
            ),
            SizedBox(
              height: getScreenHeight(context) / 25,
            ),
            ElevatedButton(
              child: Text('Consumo de Água'),
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Colors.teal,
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontStyle: FontStyle.italic),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Agua()),
                );
              },
            ),
            SizedBox(
              height: getScreenHeight(context) / 25,
            ),
            ElevatedButton(
              child: Text('Lista de Exercícios'),
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Colors.teal,
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontStyle: FontStyle.italic),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Exercicios()),
                );
              },
            ),
            SizedBox(
              height: getScreenHeight(context) / 25,
            ),
            ElevatedButton(
              child: Text('Pesquisar Calorias'),
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Colors.teal,
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontStyle: FontStyle.italic),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Nutricional()),
                );
              },
            ),
            SizedBox(
              height: getScreenHeight(context) / 25,
            ),
            ElevatedButton(
              child: Text('Pesquisar Exercícios'),
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Colors.teal,
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontStyle: FontStyle.italic),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuscarExercicios()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
