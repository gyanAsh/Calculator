import 'package:flutter/material.dart';
import './widgets/CalButton.dart';

void main() {
  runApp(MyCal());
}

class MyCal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Color(0xFF283637),
        body: Center(
          child: CalButton(
            text: '1',
          ),
        ),
      ),
    );
  }
}
