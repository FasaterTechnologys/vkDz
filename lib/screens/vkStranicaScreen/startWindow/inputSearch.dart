import 'package:flutter/material.dart';

Widget InputSerach(
    BuildContext context, String hint, TextEditingController controller) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.06,
    width: MediaQuery.of(context).size.width * 0.8,
    child: TextField(
      controller: controller,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(153, 155, 158, 1),
        ),
        hintText: hint,
      ),
    ),
  );
}
