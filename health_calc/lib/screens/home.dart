import 'package:flutter/material.dart';
import 'package:health_calc/constants/app_constants.dart';
import 'package:health_calc/constants/text_style.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getScreenaltura(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Escolha uma das opções de cálculo",
          style: titleStyle,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.light),
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: fadedBlack,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getScreenaltura(context) / 5,
            ),
            SizedBox(
              height: getScreenaltura(context) / 10,
            ),
            GestureDetector(
              child: Container(
                child: Text(
                  "Cálculo IMC",
                  style: buttonTextStyle,
                ),
              ),
            ),
            SizedBox(
              height: getScreenaltura(context) / 15,
            ),
            GestureDetector(
              child: Container(
                child: Text(
                  "Cálculo do consumo de água",
                  style: buttonTextStyle,
                ),
              ),
            ),
            SizedBox(
              height: getScreenaltura(context) / 15,
            ),
            GestureDetector(
              child: Container(
                child: Text(
                  "Cálculo TMB",
                  style: buttonTextStyle,
                ),
              ),
            ),
            SizedBox(
              height: getScreenaltura(context) / 15,
            ),
          ],
        ),
      ),
    );
  }
}
