import 'dart:async';
import 'package:dispositive_resource/Pages/FormUser/model.dart';

class FormController{
  FormModel model = FormModel();

  void setName(String name){
    model.setName(name);
  }

  void setSurname(String name){
    model.setSurName(name);
  }

  void setPhoto(String path){
    model.setPhoto(path);
  }

  String? getPhoto(){
    return model.photo;
  }

  StreamController<User> user = StreamController();

  void saveUser(){
    user.add(model.saveUser());
  }

}