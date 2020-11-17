import 'dart:convert';
import 'package:http/http.dart' as http;

class VkConnect {
  String first_name;
  int id;
  String last_name;
  var is_closed;
  var photo_max_orig;
  var status;
  int online;
  var subscribe;
  var friends;
  String city;
  VkConnect({
    this.first_name,
    this.id,
    this.last_name,
    this.is_closed,
    this.photo_max_orig,
    this.status,
    this.subscribe,
    this.friends,
    this.online,
    this.city,
  });
  factory VkConnect.fromJson(
      {String first_name,
      int id,
      String last_name,
      bool is_closed,
      String photo_max_orig,
      String status,
      int subscribe,
      int friends,
      int online,
      String city}) {
    print("Упешная обработка!");
    return VkConnect(
      first_name: first_name,
      id: id,
      last_name: last_name,
      is_closed: is_closed,
      photo_max_orig: photo_max_orig,
      status: status,
      subscribe: subscribe,
      friends: friends,
      online: online,
      city: city,
    );
  }
}

Future<VkConnect> getIdList(String id) async {
  String glav = "https://api.vk.com/method/users.get?user_ids=" +
      id +
      "&v=5.89&lang=ru&access_token=f90a85f7dad568fa9b215609a346c8fe3a63fcd87aacaaf22ff71742c5b326a8e083d2dfbb50b1af1ac9c&fields=photo_max_orig";

  String subscribe_friends = "https://api.vk.com/method/users.get?user_ids=" +
      id +
      "&v=5.89&lang=ru&access_token=f90a85f7dad568fa9b215609a346c8fe3a63fcd87aacaaf22ff71742c5b326a8e083d2dfbb50b1af1ac9c&fields=&fields=counters";

  String online = "https://api.vk.com/method/users.get?user_ids=" +
      id +
      "&v=5.89&lang=ru&access_token=f90a85f7dad568fa9b215609a346c8fe3a63fcd87aacaaf22ff71742c5b326a8e083d2dfbb50b1af1ac9c&fields=online";

  String status = "https://api.vk.com/method/users.get?user_ids=" +
      id +
      "&v=5.89&lang=ru&access_token=f90a85f7dad568fa9b215609a346c8fe3a63fcd87aacaaf22ff71742c5b326a8e083d2dfbb50b1af1ac9c&fields=status";

  String city = "https://api.vk.com/method/users.get?user_ids=" +
      id +
      "&v=5.89&lang=ru&access_token=f90a85f7dad568fa9b215609a346c8fe3a63fcd87aacaaf22ff71742c5b326a8e083d2dfbb50b1af1ac9c&fields=city";
  print("Подключение к серверу...");
  var response1 = await http.get(glav);
  var response2 = await http.get(subscribe_friends);
  var response3 = await http.get(online);
  var response4 = await http.get(status);
  var response5 = await http.get(city);

  //var adressJson = json['result']['address'];
  var jsonglav = json.decode(response1.body);
  var jsonsubscribe_friends = json.decode(response2.body);
  var jsononline = json.decode(response3.body);
  var jsononstatus = json.decode(response4.body);
  var jsoncity = json.decode(response5.body);

  if (response5.statusCode == 200) {
    print("Подключено успешно! Обработка...");
    if (jsonglav["response"] != null)
      return VkConnect.fromJson(
        first_name: jsonglav["response"][0]["first_name"],
        id: jsonglav["response"][0]["id"],
        last_name: jsonglav["response"][0]["last_name"],
        is_closed: jsonglav["response"][0]["is_closed"],
        photo_max_orig: jsonglav["response"][0]["photo_max_orig"] ?? "",
        status: jsononstatus["response"][0]["status"],
        subscribe: jsonsubscribe_friends["response"][0]["counters"] == null
            ? null
            : jsonsubscribe_friends["response"][0]["counters"]["followers"],
        friends: jsonsubscribe_friends["response"][0]["counters"] == null
            ? null
            : jsonsubscribe_friends["response"][0]["counters"]["friends"],
        online: jsononline["response"][0]["online"],
        city: jsoncity["response"][0]["city"] == null
            ? null
            : jsoncity["response"][0]["city"]["title"],
      );
  } else {
    throw Exception("Error: ${response1.reasonPhrase}");
  }
}
