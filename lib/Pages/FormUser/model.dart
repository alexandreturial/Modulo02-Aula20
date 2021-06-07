class FormModel{
  String? _name;
  String? _surName;
  String? _photo;

  User user = User();

  void setName(String name){
    _name = name;
  }

  void setSurName(String name){
    _surName = name;
  }

  String? get photo => _photo;

  void setPhoto(String path){
    _photo = path;
  }

  User saveUser(){
    if(_name != null && _surName != null && _photo != null){
      user.addUser(_name!, _surName!, _photo!);
    }
     return user;
  }

  String getFullName(){
    return '$_name $_surName';
  }

}

class User{
  String? name;
  String? surName;
  String? photo;

  void addUser(String nameUser, String surNameUser, String photoUser){
    name = nameUser;
    surName = surNameUser;
    photo = photoUser;
  }
}