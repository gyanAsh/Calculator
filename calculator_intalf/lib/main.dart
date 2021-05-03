import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/CalButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyCal());
}

class MyCal extends StatefulWidget {
  MyCal({Key key}) : super(key: key);
  @override
  MyCalState createState() => MyCalState();
}

class MyCalState extends State<MyCal> {
  String history = '';
  String expression = '';

  void numClick(String text) {
    setState(() {
      expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      history = '';
      expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      expression = '';
    });
  }

  void backSpace(String text) {
    setState(() {
      expression = expression.substring(0, expression.length - 1);
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    double evel = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      history = expression;
      expression = evel.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Color(0xFF3C4042), Color(0xFF1E2225)],
          ),
        ),
        child: Scaffold(
          backgroundColor: Color(0x00ffffff),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  history,
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                    color: Color(0x99A5ADAF),
                    fontSize: 30,
                  )),
                ),
              ),
              Container(
                // margin: EdgeInsets.all(10),
                child: Text(
                  expression,
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                    color: Color(0xFFA5ADAF),
                    fontSize: 60,
                  )),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CalButton(
                    text: 'AC',
                    fillColor: 0xFFFDB82D,
                    textColor: 0xFFffffff,
                    callBack: allClear,
                  ),
                  CalButton(
                    text: 'C',
                    fillColor: 0xFF4C453B,
                    textColor: 0xFFBE912C,
                    callBack: clear,
                  ),
                  CalButton(
                    text: '%',
                    fillColor: 0xFF4C453B,
                    textColor: 0xFFBE912C,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '*',
                    fillColor: 0xFF4A335D,
                    textColor: 0xFFD485F0,
                    textSize: 30,
                    callBack: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CalButton(
                    text: '7',
                    fillColor: 0xFF35393C,
                    textColor: 0xFFA7B0AF,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '8',
                    fillColor: 0xFF35393C,
                    textColor: 0xFFA7B0AF,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '9',
                    fillColor: 0xFF35393C,
                    textColor: 0xFFA7B0AF,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '/',
                    fillColor: 0xFF4A335D,
                    textColor: 0xFFD485F0,
                    callBack: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CalButton(
                    text: '4',
                    fillColor: 0xFF35393C,
                    textColor: 0xFFA7B0AF,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '5',
                    fillColor: 0xFF35393C,
                    textColor: 0xFFA7B0AF,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '6',
                    fillColor: 0xFF35393C,
                    textColor: 0xFFA7B0AF,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '-',
                    fillColor: 0xFF4A335D,
                    textColor: 0xFFD485F0,
                    textSize: 30,
                    callBack: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CalButton(
                    text: '1',
                    fillColor: 0xFF35393C,
                    textColor: 0xFFA7B0AF,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '2',
                    fillColor: 0xFF35393C,
                    textColor: 0xFFA7B0AF,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '3',
                    fillColor: 0xFF35393C,
                    textColor: 0xFFA7B0AF,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '+',
                    fillColor: 0xFF4A335D,
                    textColor: 0xFFD485F0,
                    callBack: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CalButton(
                    text: '.',
                    fillColor: 0xFF35393C,
                    textColor: 0xFFA7B0AF,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '0',
                    fillColor: 0xFF35393C,
                    textColor: 0xFFA7B0AF,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '<|',
                    fillColor: 0xFF35393C,
                    textColor: 0xFFA7B0AF,
                    callBack: backSpace,
                  ),
                  CalButton(
                    text: '=',
                    fillColor: 0xFF8D28DC,
                    textColor: 0xFFFFFFFF,
                    callBack: evaluate,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
