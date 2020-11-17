import 'package:flutter/material.dart';
import 'package:vk_zapros/screens/homeVkResult/nameandstatus.dart';
import 'package:vk_zapros/screens/homeVkResult/vkparametr.dart';

Widget statusandname(String status, int online, String first_name,
    String last_name, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      nameandstatus(
          "$first_name $last_name", 20, FontWeight.w600, Colors.white),
      SizedBox(
        height: 5,
      ),
      status == ""
          ? SizedBox()
          : Column(children: [
              nameandstatus(
                  status.length > 22 ? status.substring(0, 22) : status,
                  15,
                  FontWeight.w400,
                  Colors.white),
              SizedBox(
                height: 5,
              ),
            ]),
      vkparametr(online == 0 ? " не в сети" : " в сети", Icons.phone_android,
          Colors.grey, 15, context, 0.001),
    ],
  );
}
