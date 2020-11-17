import 'package:vk_zapros/serelezation.dart';

VkConnect usersVk = VkConnect();
RegExp exp = RegExp(r"(\\+)");
RegExp login = RegExp(r"(\\+http+vk.com+m.+)");
String name;
bool download = true;
