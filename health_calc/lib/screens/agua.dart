import 'package:flutter/material.dart';
import 'package:health_calc/constants/app_constants.dart';
import 'package:health_calc/constants/text_style.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';

class Agua extends StatefulWidget {
  @override
  _AguaState createState() => _AguaState();
}

class _AguaState extends State<Agua> {
  TextEditingController _pesoController = TextEditingController();
  double _agua = 0;
  

  double aguaCalc(_peso) {
    
      _agua =  _peso * 35;
    
    return _agua;
  }

  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getScreenaltura(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Consumo de água diário",
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
              height: getScreenaltura(context) / 15,
            ),

            SizedBox(
              height: getScreenaltura(context) / 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: getScreenWidth(context) / 3,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _pesoController,
                    style: mainTextStyle,
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "peso",
                      hintStyle: hintTextStyle,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getScreenaltura(context) / 20,
            ),
            GestureDetector(
              onTap: () {
                double _peso = double.parse(_pesoController.text);
                
                setState(() {
                  aguaCalc(_peso);
                });
              },
              child: Container(
                child: Text(
                  "Calcular",
                  style: buttonTextStyle,
                ),
              ),
            ),
            SizedBox(
              height: getScreenaltura(context) / 15,
            ),
            Container(
              child: Text(
                _agua.toStringAsFixed(0),
                style: resultTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}