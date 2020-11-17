import 'package:flutter/material.dart';
import 'package:vk_zapros/peremen.dart';

Widget ava(String img) {
  return Align(
    alignment: Alignment.topLeft,
    child: CircleAvatar(
      radius: 40,
      backgroundImage: NetworkImage(
        img.toString().replaceAll(exp, ""),
      ),
    ),
  );
}
