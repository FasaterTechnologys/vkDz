import 'package:flutter/material.dart';
import 'package:vk_zapros/saveandload.dart';

class StartLoadData extends StatefulWidget {
  StartLoadData({Key key}) : super(key: key);

  @override
  _StartLoadDataState createState() => _StartLoadDataState();
}

class _StartLoadDataState extends State<StartLoadData> {
  @override
  void initState() {
    getPrefs(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
