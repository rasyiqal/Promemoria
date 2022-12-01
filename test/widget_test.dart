import 'dart:convert';
import 'package:doa/data/api/doa_model.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  final String apiUrl = "https://doa-doa-api-ahmadramadhan.fly.dev/api";

  Future<List<Doa>> fecthDataDoa() async {
    var result = await http.get(Uri.parse(apiUrl));
    List<dynamic> listJson = json.decode(result.body);
    return listJson.map((e) => Doa.fromJson(e)).toList();
  }

  List<Doa> a = await fecthDataDoa();
  print(a[0].artinya);
}
