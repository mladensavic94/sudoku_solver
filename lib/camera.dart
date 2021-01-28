import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sudoku_solver/preview.dart';

class CameraWidget extends StatefulWidget {
  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  CameraController _controller;

  @override
  Widget build(BuildContext context) {
    var windowSize = MediaQuery.of(context).size;
    if (_controller == null ||
        (_controller != null && !_controller.value.isInitialized))
      Center(child: CircularProgressIndicator());
    return Column(children: [
      Container(
        width: windowSize.width * 0.8,
        height: windowSize.width * 0.8,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent, width: 4)),
        child: ClipRect(
          child: OverflowBox(
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(
                  width: windowSize.width * 0.8,
                  height: windowSize.width * 0.8 * _controller.value.aspectRatio,
                child: CameraPreview(_controller)
              ),
            ),
          ),
        ),
      ),
      Padding(
          padding: EdgeInsets.only(top: windowSize.width * 0.1),
          child: Container(
              child: FlatButton(
            child: Text(
              "Solve",
              style: Theme.of(context).textTheme.button,
            ),
            onPressed: () => onCapture(context),
            color: Theme.of(context).primaryColor,
            minWidth: windowSize.width * 0.8,
            height: windowSize.height * 0.06,
          )))
    ]);
  }

  Future initCamera(CameraDescription cameraDescription) async {
    if (_controller != null) {
      await _controller.dispose();
    }
    _controller = CameraController(cameraDescription, ResolutionPreset.high);
    _controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    if (_controller.value.hasError) {
      print('Camera Error ${_controller.value.errorDescription}');
    }

    try {
      await _controller.initialize();
    } catch (e) {
      print('Camera Error $e');
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    availableCameras().then((value) {
      initCamera(value.first).then((v) {});
    }).catchError((e) {
      print('Error : ${e.code}');
    });
  }

  onCapture(context) async {
    try {
      await _controller.takePicture().then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PicturePreview(imgPath: value.path)));
      });
    } catch (e) {
      print("Error $e");
    }
  }
}
