import 'dart:convert';
import 'package:doa/data/api/model.dart';
import 'package:http/http.dart' as http;


  class ApiService {
  final String apiUrl =
     "https://doa-doa-api-ahmadramadhan.fly.dev/api";

  Future<List<Doa>> fecthDataDoa() async {
    var result = await http.get(Uri.parse(apiUrl));
    List<dynamic> listJson = json.decode(result.body);
    // print(listJson);
    // print(listJson.map((e) => Ramen.fromJson(e)).toList().toString());
    return listJson.map((e) => Doa.fromJson(e)).toList();
  }
}
