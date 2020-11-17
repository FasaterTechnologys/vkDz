import 'package:flutter/material.dart';
import 'package:vk_zapros/screens/homeVkResult/homevcStranicaScreen.dart';
import 'package:vk_zapros/peremen.dart';
import 'package:vk_zapros/screens/vkStranicaScreen/startWindow/homeStartWindow.dart';

OnTap(BuildContext context) {
  if (SarchController.text.length < 3) return;
  name = SarchController.text;
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => HomevcStranicaScreen()));
}
