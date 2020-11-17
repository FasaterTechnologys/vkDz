import 'package:flutter/material.dart';
import 'package:vk_zapros/screens/homeVkProverka/homeVkProverka.dart';
import 'package:vk_zapros/screens/homeVkResult/homevcStranicaScreen.dart';
import 'package:vk_zapros/peremen.dart';
import 'package:vk_zapros/screens/vkStranicaScreen/startWindow/homeStartWindow.dart';
import 'package:vk_zapros/screens/vkStranicaScreen/startWindow/openWindow.dart';

import '../../../serelezation.dart';

void future(String id, BuildContext context) async {
  download = false;
  VkConnect sort = await getIdList(id);
  download = true;

  sort == null
      ? {
          statusLog = "Ошибка подключения",
          openWindow(context),
        }
      : {
          if (usersVk.is_closed == true)
            {
              openWindow(context),
            }
          else
            {
              usersVk = sort,
              download = true,
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeVkProverka())),
            }
        };
} //функция получения данных с сервера

Widget buttonopenvk(BuildContext context) {
  return Center(
    child: GestureDetector(
      onTap: () async {
        if (download == false) return;
        if (SarchController.text.length < 1) return;
        name = SarchController.text;
        future(name, context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            "Поиск",
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
