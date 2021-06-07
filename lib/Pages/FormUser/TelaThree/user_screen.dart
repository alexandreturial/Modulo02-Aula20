import 'dart:io';

import 'package:dispositive_resource/Pages/FormUser/Widgets/card_user.dart';
import 'package:dispositive_resource/Pages/FormUser/controller.dart';
import 'package:dispositive_resource/Pages/FormUser/model.dart';
import 'package:dispositive_resource/Utils/app_gradients.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormController user =
        ModalRoute.of(context)!.settings.arguments as FormController;

    return Container(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: AppGradients.linear),
          
          child: Center(
            child: CardUser(
              size: 0.7,
              content: StreamBuilder<User>(
                stream: user.user.stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.active) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.file(
                          File(snapshot.data!.photo!),
                          height: 300,
                        ),
                        Text(
                            '${snapshot.data!.name} ${snapshot.data!.surName}',
                            style: TextStyle(
                              fontSize: 25
                            ),
                          ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
