import 'package:flutter/material.dart';
import 'package:vk_zapros/screens/vkStranicaScreen/startWindow/buttonopenvk.dart';
import 'package:vk_zapros/screens/vkStranicaScreen/startWindow/inputSearch.dart';

import '../../../peremen.dart';
import '../../../saveandload.dart';

class HomeStartWindow extends StatefulWidget {
  HomeStartWindow({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

TextEditingController SarchController = TextEditingController();

class _HomeState extends State<HomeStartWindow> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(usersVk.city);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputSerach(context, "Введите ссылку или короткое имя на страницу",
              SarchController), //ввод для текста
          buttonopenvk(context), //кнопка поиск
        ],
      ),
    );
  }
}
