import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vk_zapros/peremen.dart';
import 'package:vk_zapros/screens/homeVkResult/homevcStranicaScreen.dart';
import 'package:vk_zapros/screens/vkStranicaScreen/startWindow/homeStartWindow.dart';

setPrefs(int id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (usersVk != null) if (usersVk.first_name != null) {
    prefs.setString("first_name", usersVk.first_name);
    prefs.setString("last_name", usersVk.last_name);
    prefs.setInt("id", usersVk.id);
    prefs.setString("city", usersVk.city);
    prefs.setInt("online", usersVk.online);
    prefs.setString("status", usersVk.status ?? "");
    prefs.setString("photo_max_orig", usersVk.photo_max_orig);
    prefs.setInt("friends", usersVk.friends);
    prefs.setInt("subscribe", usersVk.subscribe);
    prefs.setBool("is_closed", usersVk.is_closed);
  }
}

getPrefs(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getString("first_name") != null) {
    usersVk.first_name = prefs.getString("first_name");
    usersVk.last_name = prefs.getString("last_name");
    usersVk.id = prefs.getInt("id");
    usersVk.city = prefs.getString("city");
    usersVk.status = prefs.getString("status");
    usersVk.online = prefs.getInt("online");
    usersVk.photo_max_orig = prefs.getString("photo_max_orig");
    usersVk.friends = prefs.getInt("friends");
    usersVk.subscribe = prefs.getInt("subscribe");
    usersVk.is_closed = prefs.getBool("is_closed");
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomevcStranicaScreen()));
  } else {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeStartWindow()));
  }
}
