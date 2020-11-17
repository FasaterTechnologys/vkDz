import 'package:flutter/material.dart';
import 'package:vk_zapros/screens/homeVkResult/logo.dart';
import 'package:vk_zapros/peremen.dart';
import 'package:vk_zapros/screens/homeVkResult/stranica/ava.dart';
import 'package:vk_zapros/screens/homeVkResult/stranica/statusandname.dart';
import 'package:vk_zapros/screens/homeVkResult/vkparametr.dart';

import '../../saveandload.dart';

class HomevcStranicaScreen extends StatefulWidget {
  HomevcStranicaScreen({Key key}) : super(key: key);

  @override
  _HomevcStranicaScreenState createState() => _HomevcStranicaScreenState();
}

String statusLog = "Loading ***";

class _HomevcStranicaScreenState extends State<HomevcStranicaScreen> {
  @override
  void initState() {
    setPrefs(6);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 25, 25, 1),
      body: Column(
        children: [
          logo(
              context,
              usersVk == null
                  ? 0
                  : usersVk.id), //загрузка лого с проверкой на пустоту
          Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Divider(
                color: Colors.grey,
              )), //полоска под лого
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: usersVk == null ? SizedBox() : Content(context),
          ), //загрузка информации о аккаунте
        ],
      ),
    );
  }
}

Widget Content(BuildContext context) {
  String img = usersVk.photo_max_orig ??
      "https://okeygeek.ru/wp-content/uploads/2017/09/1885f2cadafc0e310a9c97a54e52070d.jpg";
  String last_name = usersVk.last_name;
  String first_name = usersVk.first_name;
  String status = usersVk.status;
  int online = usersVk.online;
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ava(img), //загрузка авы
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
            child: statusandname(status, online, first_name, last_name,
                context), //вся инфа справа от авы
          ),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.025,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          vkparametr(usersVk.friends.toString(), Icons.people, Colors.white, 20,
              context, 0.015), //количество друзей
          vkparametr(usersVk.city.toString(), Icons.home, Colors.white, 20,
              context, 0.015), // город
          vkparametr(usersVk.subscribe.toString(), Icons.wifi, Colors.white, 20,
              context, 0.015), // подписчики
        ],
      ),
    ],
  );
}
