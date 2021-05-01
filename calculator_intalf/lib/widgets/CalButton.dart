import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalButton extends StatelessWidget {
  final String text;
  // const BorderRadiusGeometry borderRadius = BorderRadius.circular(50);

  const CalButton({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 65,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.lightGreen[200]),
          // foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        child: Text(
          text,
          style: GoogleFonts.rubik(
              textStyle: TextStyle(
            color: Colors.black,
            fontSize: 24,
          )),
        ),
        onPressed: () {},
      ),
    );
  }
}
