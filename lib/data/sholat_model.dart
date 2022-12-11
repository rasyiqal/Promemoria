class Sholat {
  final String subuh;
  final String dzuhur;
  final String ashar;
  final String maghrib;
  final String isya;
  final String tanggal;

  const Sholat({
    required this.subuh,
    required this.dzuhur,
    required this.ashar,
    required this.maghrib,
    required this.isya,
    required this.tanggal,
  });

  factory Sholat.fromJson(Map<String, dynamic> json) {
    return Sholat(
        subuh: json['jadwal']['data']['subuh'],
        dzuhur: json['jadwal']['data']['dzuhur'],
        ashar: json['jadwal']['data']['ashar'],
        maghrib: json['jadwal']['data']['maghrib'],
        isya: json['jadwal']['data']['isya'],
        tanggal: json['jadwal']['data']['tanggal']);
  }
}
