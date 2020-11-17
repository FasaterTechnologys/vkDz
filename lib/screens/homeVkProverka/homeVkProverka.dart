import 'package:flutter/material.dart';
import 'package:vk_zapros/screens/homeVkProverka/buttonYes.dart';
import 'package:vk_zapros/screens/homeVkResult/logo.dart';
import 'package:vk_zapros/screens/homeVkResult/nameandstatus.dart';
import 'package:vk_zapros/peremen.dart';

class HomeVkProverka extends StatefulWidget {
  HomeVkProverka({Key key}) : super(key: key);

  @override
  _HomeVkProverkaState createState() => _HomeVkProverkaState();
}

class _HomeVkProverkaState extends State<HomeVkProverka> {
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
          ), //загрузка проверки аккаунта
        ],
      ),
    );
  }
}

Widget Content(BuildContext context) {
  String img = usersVk.photo_max_orig ??
      "https://okeygeek.ru/wp-content/uploads/2017/09/1885f2cadafc0e310a9c97a54e52070d.jpg";
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.network(
        img,
        width: MediaQuery.of(context).size.width * 0.625,
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
      ),
      nameandstatus("Это ваш аккаунт?", 20, FontWeight.w400, Colors.white),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
      ),
      buttonYes(context),
    ],
  );
}
