import 'package:flutter/material.dart';
import 'package:sudoku_solver/screening.dart';

void main() {
  runApp(SudokuSolver());
}

class SudokuSolver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sudoku solver',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: TextTheme(
                button: TextStyle(fontSize: 20, fontStyle: FontStyle.italic))),
        home: Scaffold(
          drawer: Drawer(
            child: Center(
              child: Text("jedi bre govna"),
            ),
          ),
          body: ScreeningPage(),
          appBar: AppBar(
            title: Text("Sudoku solver"),
          ),
        ));
  }
}
