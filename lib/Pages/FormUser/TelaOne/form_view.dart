import 'package:camera/camera.dart';
import 'package:dispositive_resource/Pages/FormUser/TelaTwo/camera_view.dart';
import 'package:dispositive_resource/Pages/FormUser/TelaTwo/preview_screen.dart';
import 'package:dispositive_resource/Pages/FormUser/Widgets/card_user.dart';
import 'package:dispositive_resource/Pages/FormUser/Widgets/form_user.dart';
import 'package:dispositive_resource/Pages/FormUser/controller.dart';
import 'package:dispositive_resource/Utils/app_gradients.dart';
import 'package:flutter/material.dart';

class FormUser extends StatefulWidget {
  @override
  _FormUserState createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  final _formKey = GlobalKey<FormState>();

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
    FormController controller = FormController();

    return Scaffold(
        body: Container(
           decoration: BoxDecoration(
            gradient: AppGradients.linear
          ),
          child: Align(
            child: CardUser(
              size: 0.5,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: FormUserData(
                      user: controller,
                      formKey: _formKey,
                    )
                  ),
                  ElevatedButton(
                        onPressed: () {
                          final isValid = _formKey.currentState!.validate();
                          if (isValid) {
                            _showCamera(controller);
                          }
                        },
                        child: Text("proximo"),
                      ),
                ],
              ),
            )
          ),
        ));
  }
}
