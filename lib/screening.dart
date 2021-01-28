import 'package:flutter/material.dart';

import 'camera.dart';

class ScreeningPage extends StatefulWidget {

  @override
  _ScreeningPageState createState() => _ScreeningPageState();
}

class _ScreeningPageState extends State<ScreeningPage> {
  @override
  Widget build(BuildContext context) {
    var windowSize = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
            top: windowSize.height * 0.1,
            left: windowSize.width * 0.1,
            right: windowSize.width * 0.1),
        child: Column(
          children: [
            Center(
              child: Text("Focus Sudoku grid within blue square!",
                  style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            ),
            Padding(
                padding: EdgeInsets.only(top: windowSize.height * 0.1),
                child: CameraWidget()),
          ],
        ),
      ),
    );
  }
}
