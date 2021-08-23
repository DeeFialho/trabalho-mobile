import 'package:flutter/material.dart';
import 'package:health_calc/constants/app_constants.dart';
import 'package:health_calc/constants/text_style.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_calc/screens/tmb.dart';

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
        centerTitle: true,
        title: Text(
          "Health Calc",
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
              height: getScreenHeight(context) / 5,
            ),
            SizedBox(
              height: getScreenHeight(context) / 10,
            ),
            ElevatedButton(
              child: Text('Cálculo TMB'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tmb()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Cálculo IMC'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Imc()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Cálculo Consumo Água'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Agua()),
                );
              },
            ),
            SizedBox(
              height: getScreenHeight(context) / 15,
            ),
          ],
        ),
      ),
    );
  }
}
