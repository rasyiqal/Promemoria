import 'dart:convert';
import 'package:doa/data/api/user_api.dart';
import 'package:http/http.dart' as http;

class LocalService {
  final String apiUrl = "http://localhost:3000";

  Future<List<User>> fecthDataUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    List<dynamic> listJson = json.decode(result.body)["user"];
    // print(listJson);
    // print(listJson.map((e) => Ramen.fromJson(e)).toList().toString());

    return listJson.map((e) => User.fromJson(e)).toList();
  }
}
