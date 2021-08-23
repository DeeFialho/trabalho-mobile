import 'package:flutter/material.dart';
import 'package:health_calc/constants/app_constants.dart';
import 'package:health_calc/constants/text_style.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';

class Imc extends StatefulWidget {
  @override
  _ImcState createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  TextEditingController _pesoController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();
  double _imc = 0;
  String _resultado = "";


  double imcCalc(_peso, _altura) {
    
    _imc = _peso / (_altura * _altura);

    return _imc;
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
          "Índice de massa corporal",
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
                      hintText: "peso kg",
                      hintStyle: hintTextStyle,
                    ),
                  ),
                ),
                Container(
                  width: getScreenWidth(context) / 3,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _alturaController,
                    style: mainTextStyle,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    maxLength: 4,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "altura m",
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
                double _altura = double.parse(_alturaController.text);
               
                setState(() {
                  imcCalc(_peso, _altura);
                   if(_imc > 25){
                      _resultado = "Você está acima do peso";
                    } else if(_imc >= 18.5 && _imc <= 25){
                      _resultado = "Você está no peso normal";
                    }else{
                      _resultado = "Você está abaixo do peso";
                    }
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
                _imc.toStringAsFixed(2),
                style: resultTextStyle,
                
              ),
            ),
              Visibility(
                visible: _resultado.isNotEmpty,
                  child: Container(
                child: Text(
                  _resultado,
                  style: mainTextStyle,
              )),
              )
          ],
        ),
      ),
    );
  }
}
