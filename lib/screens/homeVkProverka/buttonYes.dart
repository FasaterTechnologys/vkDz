import 'package:flutter/material.dart';
import 'package:vk_zapros/screens/homeVkResult/homevcStranicaScreen.dart';

Widget buttonYes(BuildContext context) {
  return Center(
    child: GestureDetector(
      onTap: () async {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomevcStranicaScreen()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            "Да!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
    ),
  );
}
