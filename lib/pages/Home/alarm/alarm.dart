import 'package:doa/theme/theme.dart';
import 'package:doa/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:doa/services/local_notif_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  NotificationServices notificationServices = NotificationServices();
  bool notif1 = true;
  bool notif2 = true;
  bool notif3 = true;
  bool notif4 = true;
  bool notif5 = true;

  // ignore: prefer_typing_uninitialized_variables
  late var loading;
  // ignore: prefer_typing_uninitialized_variables
  late var datasubuh;
  late int datajamSubuh;
  late int datamenitSubuh;

  late var datadzuhur;
  late int datajamDzuhur;
  late int datamenitDzuhur;

  late var dataashar;
  late int datajamAshar;
  late int datamenitAshar;

  late var datamaghrib;
  late int datajamMaghrib;
  late int datamenitMaghrib;

  late var dataisya;
  late int datajamIsya;
  late int datamenitIsya;

  late var datatanggal;
  late var font = TextStyle(
    fontSize: 19,
  );
  late var judul = TextStyle(
      fontSize: 21, fontWeight: FontWeight.w500, color: Colors.grey[700]);

  void ambilData() async {
    var tanggalSekarang = DateTime.now();
    var formatTanggal = DateFormat('yyyy-MM-dd');
    String formatTanggalSekarang = formatTanggal.format(tanggalSekarang);

    Response response = await get(Uri.parse(
        'https://api.banghasan.com/sholat/format/json/jadwal/kota/775/tanggal/$formatTanggalSekarang'));

    Map data = jsonDecode(response.body);
    print(data);
    String subuh = data['jadwal']['data']['subuh'];
    int jamSubuh = int.parse(subuh.substring(0, 2));
    int menitSubuh = int.parse(subuh.substring(3, 5));

    String dzuhur = data['jadwal']['data']['dzuhur'];
    int jamDzuhur = int.parse(dzuhur.substring(0, 2));
    int menitDzuhur = int.parse(dzuhur.substring(3, 5));

    String ashar = data['jadwal']['data']['ashar'];
    int jamAshar = int.parse(ashar.substring(0, 2));
    int menitashar = int.parse(ashar.substring(3, 5));

    String maghrib = data['jadwal']['data']['maghrib'];
    int jamMaghrib = int.parse(maghrib.substring(0, 2));
    int menitmaghrib = int.parse(maghrib.substring(3, 5));

    String isya = data['jadwal']['data']['isya'];
    int jamisya = int.parse(isya.substring(0, 2));
    int menitisya = int.parse(isya.substring(3, 5));

    String tanggal = data['jadwal']['data']['tanggal'];

    setState(() {
      datasubuh = Text(subuh, style: font);
      datajamSubuh = jamSubuh;
      datamenitSubuh = menitSubuh;

      datadzuhur = Text(dzuhur, style: font);
      datajamDzuhur = jamDzuhur;
      datamenitDzuhur = menitDzuhur;

      dataashar = Text(ashar, style: font);
      datajamAshar = jamAshar;
      datamenitAshar = menitashar;

      datamaghrib = Text(maghrib, style: font);
      datajamMaghrib = jamMaghrib;
      datamenitMaghrib = menitmaghrib;

      dataisya = Text(isya, style: font);
      datajamIsya = jamisya;
      datamenitIsya = menitisya;

      datatanggal = Text(tanggal, style: judul);
    });
  }

  int _selectedTabIndex = 0;
  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    super.initState();
    notificationServices.initialisetNotifications();
    loading = const Loading();
    datasubuh = loading;
    datadzuhur = loading;
    dataashar = loading;
    datamaghrib = loading;
    dataisya = loading;
    datatanggal = const LoadingTanggal();
    ambilData();
    print('tunggu sebentar ...');
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 56,
            left: 24,
            right: 24,
          ),
          child: Text(
            'Jadwal Sholat',
            style: blackTextStyle.copyWith(
                fontSize: 30, fontWeight: semiBold, letterSpacing: 0.3),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(
                Icons.location_on_outlined,
                size: 30,
              ),
            ),
            Text(
              "Kota Malang",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 92, 90, 90).withOpacity(0.2),
                spreadRadius: 0.5,
                blurRadius: 4,
                offset: Offset(3, 4), // changes position of shadow
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: datatanggal,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Subuh',
                                  style: font,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Dzuhur',
                                  style: font,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Ashar',
                                  style: font,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Maghrib',
                                  style: font,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Isya',
                                  style: font,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    datasubuh,
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          notificationServices
                                                .sendNotification(
                                              'Adzan Subuh',
                                              'Sholat Dulu',
                                              datajamMaghrib,
                                              datamenitMaghrib,
                                            );
                                          // notifikasi_shubuh();
                                          setState(() {
                                            notif1 = !notif1;
                                          });
                                        },
                                        child: Icon(
                                          notif1
                                              ? Icons.notifications_none
                                              : Icons.notifications,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    datadzuhur,
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          notificationServices
                                                .sendNotification(
                                              'Adzan Dzuhur',
                                              'Sholat Dulu',
                                              datajamMaghrib,
                                              datamenitMaghrib,
                                            );
                                          // notifikasi_dhuhur();
                                          setState(() {
                                            notif2 = !notif2;
                                          });
                                        },
                                        child: Icon(
                                          notif2
                                              ? Icons.notifications_none
                                              : Icons.notifications,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    dataashar,
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            notificationServices
                                                .sendNotification(
                                              'Adzan Ashar',
                                              'Sholat Dulu',
                                              datajamMaghrib,
                                              datamenitMaghrib,
                                            );
                                            // notifikasi_ashar();
                                            notif3 = !notif3;
                                          });
                                        },
                                        child: Icon(
                                          notif3
                                              ? Icons.notifications_none
                                              : Icons.notifications,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    datamaghrib,
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            notificationServices
                                                .sendNotification(
                                              'Adzan Maghrib',
                                              'Sholat Dulu',
                                              datajamMaghrib,
                                              datamenitMaghrib,
                                            );
                                            // notifikasi_maghrib();

                                            notif4 = !notif4;
                                          });
                                        },
                                        child: Icon(
                                          notif4
                                              ? Icons.notifications_none
                                              : Icons.notifications,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    dataisya,
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            notificationServices
                                                .sendNotification(
                                              'Adzan Isya',
                                              'Sholat Dulu',
                                              datajamIsya,
                                              datamenitIsya,
                                            );
                                            // notifikasi_maghrib();
                                            notif5 = !notif5;
                                          });
                                        },
                                        child: Icon(
                                          notif5
                                              ? Icons.notifications_none
                                              : Icons.notifications,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
