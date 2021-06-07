import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  final Widget content;
  final double size;

  const CardUser({
    Key? key,
    required this.content,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * size,
            padding: EdgeInsets.all(25),
            constraints: BoxConstraints(minWidth: 300),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(0, 2),
                      spreadRadius: 2)
                ]),
            child: content
    );
  }
}
