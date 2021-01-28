import 'dart:io';

import 'package:flutter/material.dart';

class PicturePreview extends StatefulWidget {
  final String imgPath;

  PicturePreview({this.imgPath});

  @override
  _PicturePreviewState createState() => _PicturePreviewState();
}

class _PicturePreviewState extends State<PicturePreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sudoku solver"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Center(
            child: Image.file(File(widget.imgPath), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
