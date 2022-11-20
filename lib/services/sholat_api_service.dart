import 'dart:convert';
import 'package:doa/data/api/sholat_model.dart';
import 'package:http/http.dart' as http;

 class SholatApi {
  final String apiUrl =
     "https://api.banghasan.com/sholat/format/json/jadwal/kota/775/tanggal/2022-10-07";

  Future<List<Sholat>> fecthDataSholat() async {
    var result = await http.get(Uri.parse(apiUrl));
    List<dynamic> listJson = json.decode(result.body);
    // print(listJson);
    // print(listJson.map((e) => Ramen.fromJson(e)).toList().toString());
    return listJson.map((e) => Sholat.fromJson(e)).toList();
  }
}