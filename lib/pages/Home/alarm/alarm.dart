import 'package:flutter/material.dart';
import 'package:doa/theme/theme.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  bool progres = false;
  bool error = false;
  late String datasubuh;
  late String datadzuhur;
  late String dataashar;
  late String datamaghrib;
  late String dataisya;
  late String datatanggal;

  void ambilData() async {
    setState(() {
      progres = true;
    });

    var tanggalSekarang = DateTime.now();
    var formatTanggal = DateFormat('yyyy-MM-dd');
    String formatTanggalSekarang = formatTanggal.format(tanggalSekarang);

    try {
      // mensimulasikan request network
      Response response = await get(Uri.parse(
          'https://api.banghasan.com/sholat/format/json/jadwal/kota/775/tanggal/$formatTanggalSekarang'));
      Map data = jsonDecode(response.body);
      String subuh = data['jadwal']['data']['subuh'];
      String dzuhur = data['jadwal']['data']['dzuhur'];
      String ashar = data['jadwal']['data']['ashar'];
      String maghrib = data['jadwal']['data']['maghrib'];
      String isya = data['jadwal']['data']['isya'];
      String tanggal = data['jadwal']['data']['tanggal'];

      setState(() {
        datasubuh = subuh;
        datadzuhur = dzuhur;
        dataashar = ashar;
        datamaghrib = maghrib;
        dataisya = isya;
        datatanggal = tanggal;
        progres = false;
        error = false;
      });
    } catch (e) {
      setState(() {
        progres = false;
        error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () => ambilData(),
          )
        ],
      ),
      body: ListView(children: [
        Container(
            margin: const EdgeInsets.only(
              top: 24,
              bottom: 24,
            ),
            // alignment: const Alignment(0.0, 0.0),
            child: Column(
              children: [
                const Text(
                  'Kota Malang',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Text(
                  datatanggal,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            )),
        Center(
          child: (progres)
              ? Container(
                  padding: const EdgeInsets.all(100),
                  child: const CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    color: Colors.blue,
                    strokeWidth: 5,
                  ),
                )
              : (error)
                  ? Container(
                      margin: const EdgeInsets.all(24),
                      alignment: const Alignment(0.0, 0.0),
                      child: const Text('Gagal load data...'))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                              title: Text(
                                "Subuh",
                                style: blackTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                              ),
                              leading: const Icon(
                                Icons.alarm,
                                size: 40,
                                color: Colors.blue,
                              ),
                              trailing: Text(datasubuh)),
                        ),
                        Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                              title: Text(
                                "Dzuhur",
                                style: blackTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                              ),
                              leading: const Icon(
                                Icons.alarm,
                                size: 40,
                                color: Colors.blue,
                              ),
                              trailing: Text(datadzuhur)),
                        ),
                        Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                              title: Text(
                                "Ashar",
                                style: blackTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                              ),
                              leading: const Icon(
                                Icons.alarm,
                                size: 40,
                                color: Colors.blue,
                              ),
                              trailing: Text(dataashar)),
                        ),
                        Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                              title: Text(
                                "Maghrib",
                                style: blackTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                              ),
                              leading: const Icon(
                                Icons.alarm,
                                size: 40,
                                color: Colors.blue,
                              ),
                              trailing: Text(datamaghrib)),
                        ),
                        Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                              title: Text(
                                "Isya",
                                style: blackTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                              ),
                              leading: const Icon(
                                Icons.alarm,
                                size: 40,
                                color: Colors.blue,
                              ),
                              trailing: Text(dataisya)),
                        ),
                      ],
                    ),
        ),
      ]),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    progres = false;
    error = false;
    datasubuh = '00:00';
    datadzuhur = '00:00';
    dataashar = '00:00';
    datamaghrib = '00:00';
    dataisya = '00:00';
    datatanggal = 'Hari, tanggal';
  }
}
