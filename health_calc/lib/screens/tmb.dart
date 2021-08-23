import 'package:flutter/material.dart';
import 'package:health_calc/constants/app_constants.dart';
import 'package:health_calc/constants/text_style.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';

class Tmb extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

enum genero { feminino, male }

class _HomeState extends State<Tmb> {
  TextEditingController _pesoController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();
  TextEditingController _idadeController = TextEditingController();
  double _tmb = 0;
  genero? _genero = genero.feminino;

  double tmbCalc(_peso, _altura, _idade, _genero) {
    if (_genero == genero.feminino) {
      _tmb = 655.1 + (9.563 * _peso) + (1.85 * _altura) - (4.676 * _idade);
    } else {
      _tmb = 66.47 + (13.75 * _peso) + (5.003 * _altura) - (6.755 * _idade);
    }
    return _tmb;
  }

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
          "Taxa Metabólica Basal",
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
            ListTile(
              title: Text(
                'Feminino',
                style: radioStyle,
              ),
              leading: Radio<genero>(
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: genero.feminino,
                groupValue: _genero,
                onChanged: (genero? value) {
                  setState(() {
                    _genero = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                'Masculino',
                style: radioStyle,
              ),
              leading: Radio<genero>(
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: genero.male,
                groupValue: _genero,
                onChanged: (genero? value) {
                  setState(() {
                    _genero = value;
                  });
                },
              ),
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
                Container(
                  width: getScreenWidth(context) / 3,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _alturaController,
                    style: mainTextStyle,
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "altura",
                      hintStyle: hintTextStyle,
                    ),
                  ),
                ),
                Container(
                  width: getScreenWidth(context) / 3,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _idadeController,
                    style: mainTextStyle,
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "idade",
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
                double _idade = double.parse(_idadeController.text);
                setState(() {
                  tmbCalc(_peso, _altura, _idade, _genero);
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
                _tmb.toStringAsFixed(0),
                style: resultTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}