import 'package:dispositive_resource/Pages/FormUser/TelaOne/form_view.dart';
import 'package:dispositive_resource/Pages/FormUser/TelaThree/user_screen.dart';
import 'package:dispositive_resource/Pages/FormUser/TelaTwo/preview_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => FormUser(),
        'previewcam' : (context) => PreviewCam(),
        'user' : (context) => UserScreen(),
      },
    );
  }
}

