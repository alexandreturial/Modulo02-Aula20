import 'dart:io';
import 'package:camera/camera.dart';
import 'package:dispositive_resource/Pages/FormUser/TelaTwo/camera_view.dart';
import 'package:dispositive_resource/Pages/FormUser/controller.dart';
import 'package:flutter/material.dart';

class PreviewCam extends StatefulWidget {
  const PreviewCam({Key? key}) : super(key: key);

  @override
  _PreviewCamState createState() => _PreviewCamState();
}

class _PreviewCamState extends State<PreviewCam> {
  _showCamera(FormController controller) async {
    final cameras = await availableCameras();
    
    final camera = cameras.firstWhere((element) => element.lensDirection == CameraLensDirection.front);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CameraView(camera, controller)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FormController controller = ModalRoute.of(context)!.settings.arguments as FormController;
    return Container(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: controller.getPhoto() != null
                      ? Image.file(File(controller.getPhoto()!))
                      : Container()),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showCamera(controller);
                    },
                    child: Text('tirar outra selfie')
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.saveUser();
                      Navigator.pushNamed(context, 'user', arguments: controller);
                      
                    },
                    child: Text('Next')
                  ),
                ],
              )
            )
          ],
        ),
      ),
    ));
  }
}
