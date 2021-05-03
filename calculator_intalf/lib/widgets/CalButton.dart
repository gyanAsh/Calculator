import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final double buttonWidthSize;
  final double buttonHeightSize;
  final Function callBack;

  const CalButton(
      {Key key,
      this.callBack,
      this.textSize = 24,
      this.buttonWidthSize = 75,
      this.buttonHeightSize = 70,
      this.text,
      this.fillColor,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //     colors: <Color>[Color(0xFF3C4042), Color(0xFF1E2225)],
      //   ),
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(30),
      //     topRight: Radius.circular(30),
      //     bottomRight: Radius.circular(30),
      //     bottomLeft: Radius.circular(30),
      //   ),
      // ),
      child: SizedBox(
        width: buttonWidthSize,
        height: buttonHeightSize,
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
            backgroundColor: MaterialStateProperty.all<Color>(Color(fillColor)),
            // foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          child: Text(
            text,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(
              color: Color(textColor),
              fontSize: textSize,
            )),
          ),
          onPressed: () {
            callBack(text);
          },
        ),
      ),
    );
  }
}
