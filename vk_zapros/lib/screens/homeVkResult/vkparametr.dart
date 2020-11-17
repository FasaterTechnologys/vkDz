import 'package:flutter/material.dart';

Widget vkparametr(String text, IconData icon, Color color, double size,
    BuildContext context, double indent) {
  if (text != null && text != "null") {
    return Row(
      children: [
        Icon(
          icon,
          size: size,
          color: Colors.grey,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * indent,
        ),
        Text(
          text,
          style: TextStyle(fontSize: size, color: color),
        ),
      ],
    );
  } else {
    return SizedBox();
  }
}
