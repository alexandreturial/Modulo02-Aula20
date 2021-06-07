import 'package:camera/camera.dart';
import 'package:dispositive_resource/Pages/FormUser/controller.dart';
import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  final CameraDescription camera;
  final FormController controller;
  CameraView(this.camera, this.controller);

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late CameraController _cameraController;
  late Future<void> _initCameraFuture;

  @override
  void initState() {
    super.initState();

    _cameraController = CameraController(widget.camera, ResolutionPreset.max);
    _initCameraFuture = _cameraController.initialize();
  }

  _takePicture(BuildContext context) async {
    await _initCameraFuture;
    final photo = await _cameraController.takePicture();
    widget.controller.setPhoto(photo.path);

    Navigator.popAndPushNamed(context, 'previewcam',
        arguments: widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('precisamos de sua melhor selfie!'),
              Expanded(
                
                child: Stack(
                  children: [
                    FutureBuilder(
                      future: _initCameraFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return CameraPreview(_cameraController);
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(bottom: 35), 
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {
                          _takePicture(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
