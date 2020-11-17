import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vk_zapros/peremen.dart';
import 'package:vk_zapros/screens/vkStranicaScreen/startWindow/homeStartWindow.dart';

Widget logo(
  BuildContext context,
  int hint,
) {
  return Container(
    height: 47.53,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          hint.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        GestureDetector(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeStartWindow()));
              prefs.setString("first_name", null);
            },
            child: Icon(Icons.arrow_right, size: 25, color: Colors.white)),
      ],
    ),
  );
}
