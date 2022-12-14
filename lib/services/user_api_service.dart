import 'dart:convert';
import 'package:doa/data/user_api.dart';
import 'package:http/http.dart' as http;

class ApiUser {
  
  final String apiUrl = "http://192.168.43.14:3000/user";

  Future<List<UserModel>> fecthDataUser() async {

    var result = await http.get(Uri.parse(apiUrl));
    List<dynamic> listJson = json.decode(result.body);
    // print(listJson);
    print(listJson.map((e) => UserModel.fromJson(e)).toList().toString());
    return listJson.map((e) => UserModel.fromJson(e)).toList();
  }
}
