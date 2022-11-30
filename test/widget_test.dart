import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

Future<void> main() async {
  late var datasubuh;
  late int datajamSubuh;
  late int menitSubuh;
  //dzuhur
  late var datadzuhur;
  late int datajamDzuhur;
  late int menitDzuhur;
  //ashar
  late var dataashar;
  late int datajamAshar;
  late int menitAshar;
  //maghrib
  late var datamaghrib;
  late int datajamMaghrib;
  late int menitMaghrib;
  //isya
  late var dataisya;
  late int datajamIsya;
  late int menitIsya;

  late var datatanggal;

  Future<void> ambilData() async {
    var tanggalSekarang = DateTime.now();
    var formatTanggal = DateFormat('yyyy-MM-dd');
    String formatTanggalSekarang = formatTanggal.format(tanggalSekarang);

    Response response = await get(Uri.parse(
        'https://api.banghasan.com/sholat/format/json/jadwal/kota/775/tanggal/$formatTanggalSekarang'));

    Map data = jsonDecode(response.body);

    String subuh = data['jadwal']['data']['subuh'];
    int jamSubuh = int.parse(subuh.substring(0, 2));
    int menitSubuh = int.parse(subuh.substring(3, 5));

    String dzuhur = data['jadwal']['data']['dzuhur'];
    int jamDzuhur = int.parse(dzuhur.substring(0, 2));
    int menitDzuhur = int.parse(dzuhur.substring(3, 5));

    String ashar = data['jadwal']['data']['ashar'];
    int jamAshar = int.parse(ashar.substring(0, 2));
    int menitAshar = int.parse(ashar.substring(3, 5));

    String maghrib = data['jadwal']['data']['maghrib'];
    int jamMaghrib = int.parse(maghrib.substring(0, 2));
    int menitMaghrib = int.parse(maghrib.substring(3, 5));

    String isya = data['jadwal']['data']['isya'];
    int jamIsya = int.parse(isya.substring(0, 2));
    int menitIsya = 25;

    String tanggal = data['jadwal']['data']['tanggal'];

    print(menitIsya);
  }

  await ambilData();
}
