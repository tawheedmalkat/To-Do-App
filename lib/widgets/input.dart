import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {


  final String? hint;
  final Widget? icon;
  final TextEditingController? controller;
  final int? maxLines;

  MyTextField({this.hint, this.icon, this.controller,this.maxLines});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width*0.025),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(),
          prefixIcon: icon,
        ),
        controller: controller,
        maxLines: maxLines ?? 1,
      ),
    );
  }
}

