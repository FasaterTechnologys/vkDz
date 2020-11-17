import 'package:flutter/material.dart';

Widget nameandstatus(String text, double size, FontWeight font, Color colors) {
  return Text(
    text,
    style: TextStyle(fontSize: size, color: colors, fontWeight: font),
  );
}
