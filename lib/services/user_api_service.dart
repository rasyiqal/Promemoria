import 'dart:convert';
import 'package:doa/data/user_api.dart';
import 'package:http/http.dart' as http;

class ApiUser {
  final String apiUrl = "http://localhost:3000/user";

  Future<List<User>> fecthDataUser() async {
    var result = await http.get(Uri.parse(apiUrl));
    List<dynamic> listJson = json.decode(result.body);
    // print(listJson);
    print(listJson.map((e) => User.fromJson(e)).toList().toString());
    return listJson.map((e) => User.fromJson(e)).toList();
  }
}
