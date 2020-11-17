import 'package:flutter/material.dart';

void openWindow(BuildContext context) async {
  bool value = await Navigator.push(
    context,
    PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) => MyPopup(),
      transitionsBuilder:
          (___, Animation<double> animation, ____, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(scale: animation, child: child),
        );
      },
    ),
  );
}

class MyPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Ошибка получения данных"),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text('Ок'),
        ),
      ],
    );
  }
}
