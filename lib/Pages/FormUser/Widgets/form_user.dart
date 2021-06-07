import 'package:flutter/material.dart';

import 'package:dispositive_resource/Pages/FormUser/controller.dart';

class FormUserData extends StatelessWidget {
  final FormController user;
  final GlobalKey<FormState> formKey;

  const FormUserData({
    Key? key,
    required this.user,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'campo obrigatorio';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Nome",
                ),
                onChanged: (text) => user.setName(text), //controller.setName(text),
              ),
              TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'campo obrigatorio';
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Sobrenome"),
                onChanged: (text) => user.setSurname(text), // controller.setSurname(text),
              ),
            ],
          )),
    );
  }
}
